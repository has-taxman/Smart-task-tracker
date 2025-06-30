const express = require("express");
const cors = require("cors");
const path = require("path");

const app = express();
app.use(cors());
app.use(express.json());

// ➡️ Add this line to serve files from /public folder
app.use(express.static(path.join(__dirname, 'public')));

// API routes
app.use("/", require("./routes/auth"));
app.use("/tasks", require("./routes/tasks"));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
