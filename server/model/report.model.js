import mongoose from "mongoose";

//User Report Schema
const reportSchema = new mongoose.Schema({
  name: String,
  dtype: String,
  description: String,
  contact: String,
  lat: String,
  long: String,
  image: String,
  date: String,
  time: String,
  status: String,
});
//User Report Model
export default mongoose.model.reports || mongoose.model("Report", reportSchema);