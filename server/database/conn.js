import mongoose from "mongoose";
const mongoURL = "mongodb+srv://ayushawasthi468:SixtyNine420!@cluster0.cr220yd.mongodb.net/userDB";
export default async function connect() {
    await mongoose.connect(mongoURL);
    console.log(mongoose.connection.readyState ? "Connected to MongoDB" : "Error connecting to MongoDB");
    }