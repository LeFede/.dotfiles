import express from "express";
import mongoose from "mongoose";

const Animal = mongoose.model(
  "Animal",
  new mongoose.Schema({
    tipo: String,
    estado: String,
  }),
);

const app = express();

mongoose.connect(
  "mongodb://fede:password@monguito:27017/miapp?authSource=admin",
);

app.get("/", async (_req, res) => {
  console.log("listando");
  const animales = await Animal.find();
  return res.send(animales);
});

app.get("/crear", async (_req, res) => {
  console.log("Creando");
  const nuevoAnimal = await Animal.create({ tipo: "Chancho", estado: "feliz" });
  return res.send("tremendoooo");
});

app.listen(3000, () => console.log("listening on port 3000 🚀..."));
