const express = require("express")
const app = express();

app.get("/", (req, res) => {
    res.send("Hola desde mi api de docker");
});

app.listen(3000, () => {
    console.log("servidor corriendo correctamente !!");
})