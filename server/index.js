import express from 'express';
import bodyParser from 'body-parser';
import cloudinary from 'cloudinary';
import multer from 'multer';

import connect from './database/conn.js';

const app = express();
const PORT = process.env.PORT || 3000;

// Cloudinary Configuration
cloudinary.config({
  cloud_name: 'resq',
  api_key: '783841812137264',
  api_secret: 'J1I3kdn4q8hZRst4345BoFKh360'
});

// Configure multer for file uploads, using memory storage so make sure images are not too large
const upload = multer({
  storage: multer.memoryStorage(),
});

//body-parser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
connect().catch((err) => console.log(err));

app.get('/', (req, res) => {
  res.send('ResQ API');
});

// Import report model
import Report from './model/report.model.js';

//Post request to store the report in database
app.post('/reportPost', upload.single('image'), async (req, res) => {
  try {
    let imageUrl = ''; // Default empty URL if no image is uploaded.

    if (req.file) {
      // Convert the buffer to a base64-encoded URI
      const imageBuffer = req.file.buffer.toString('base64');
      const dataUri = `data:${req.file.mimetype};base64,${imageBuffer}`;

      // Upload the image directly to Cloudinary using data URI
      const result = await cloudinary.uploader.upload(dataUri, {
        folder: 'ResQ-Reports',
      });

      imageUrl = result.secure_url;
    }

    const report = new Report({
      name: req.body.name,
      dtype: req.body.dtype || '',
      description: req.body.description || '',
      contact: req.body.contact || '',
      lat: req.body.lat || '',
      long: req.body.long || '',
      image: imageUrl,
      date: req.body.date || '',
      time: req.body.time || '',
      status: 'Ongoing',
    });

    // Save the report to MongoDB
    await report.save();

    res.json('Report added successfully.');
  } catch (error) {
    console.error(error);
    res.status(400).json({ error: 'Bad Request' });
  }
});

//Get request to fetch the reports from database
app.get('/reportFetch', (req, res) => {
  Report.find().then((reports) => res.json(reports));
});

// Import org model
import Org from './model/org.model.js';


//Post request to store the org details in database
app.post('/orgPost', upload.single('image'), async (req, res) => {
  try {
    let imageUrl = '';

    if (req.file) {

      const imageBuffer = req.file.buffer.toString('base64');
      const dataUri = `data:${req.file.mimetype};base64,${imageBuffer}`;


      const result = await cloudinary.uploader.upload(dataUri, {
        folder: 'ResQ-Orgs',
      });

      imageUrl = result.secure_url;
    }

    const org = new Org({
      name: req.body.name,
      description: req.body.description || '',
      orgtype: req.body.orgtype || '',
      contact: req.body.contact || '',
      lat: req.body.lat || '',
      long: req.body.long || '',
      logo: imageUrl
    });

    await org.save()
    res.json('Report added successfully.');
  } catch (error) {
    console.error(error);
    res.status(400).json({ error: 'Bad Request' });
  }
});

//Get request to fetch the org details from database
app.get('/orgFetch', (req, res) => {
  Org.find().then((orgs) => res.json(orgs));
});

//Search filters for organisations:
//By organisation type:
app.get('/orgFetch/:orgtype', (req, res) => {
  Org.find({ orgtype: req.params.orgtype }).then((orgs) => res.json(orgs));
});
//By location:
app.get('/orgFetch/:location', (req, res) => {
  Org.find({ location: req.params.location }).then((orgs) => res.json(orgs));
});
//Search filters for reports:
//By disaster type:
app.get('/reportFetch/:dtype', (req, res) => {
  Report.find({ dtype: req.params.dtype }).then((reports) => res.json(reports));
});
//By location:
app.get('/reportFetch/:location', (req, res) => {
  Report.find({ location: req.params.location }).then((reports) => res.json(reports));
});
//By status:
app.get('/reportFetch/:status', (req, res) => {
  Report.find({ status: req.params.status }).then((reports) => res.json(reports));
});
//By date:
app.get('/reportFetch/:date', (req, res) => {
  Report.find({ date: req.params.date }).then((reports) => res.json(reports));
});
//Autocomplete search:
//Reports
app.get("/reportSearch/", async (req, res) => {
  try {
    console.log(req.query.term);
    const result = await Report.aggregate([
      {
        '$search': {
          'index': 'autocomplete',
          'autocomplete': {
            'query': req.query.term,
            path: "name",//the search index is on the name field
            fuzzy: {
              maxEdits: 2,
            },
          },
          'highlight': {
            'path': [
              'name'
            ]
          }
        }
      },
      {
        $limit: 5,
      }, {
        '$project': {
          'name': 1,
          'description': 1,
          'contact': 1,
          'lat': 1,
          'long': 1,
          'image': 1,
          'date': 1,
          'time': 1,
          'status': 1
        }
      }
    ])
    res.json(result);
  } catch (err) {
    res.json({ message: err });
  }
});
//Organisations
app.get("/orgSearch/", async (req, res) => {
  try {
    console.log(req.query.term);
    const result = await Org.aggregate([
      {
        '$search': {
          'index': 'autocomplete',
          'autocomplete': {
            'query': req.query.term,
            path: "name",//the search index is on the name field
            fuzzy: {
              maxEdits: 2,
            },
          },
          'highlight': {
            'path': [
              'name'
            ]
          }
        }
      },
      {
        $limit: 5,
      }, {
        '$project': {
          'name': 1,
          'description': 1,
          'orgtype': 1,
          'contact': 1,
          'lat': 1,
          'long': 1,
          'logo': 1
        }
      }
    ])
    res.json(result);
  } catch (err) {
    res.json({ message: err });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});



