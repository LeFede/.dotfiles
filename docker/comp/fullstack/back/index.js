import express from "express";

const app = express();

app.get("/", async (_req, res) => {
  return res.send("HOLA PAAA");
});

app.listen(3000, () => console.log("🚀 ROCKET SCIENCE!!"));
