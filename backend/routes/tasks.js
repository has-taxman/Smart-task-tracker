const express = require("express");
const router = express.Router();
const pool = require("../db");
const auth = require("../middleware/auth");

router.use(auth);

router.get("/", async (req, res) => {
  const result = await pool.query("SELECT * FROM tasks WHERE user_id = $1", [req.user.id]);
  res.json(result.rows);
});

router.post("/", async (req, res) => {
  const { title } = req.body;
  const result = await pool.query(
    "INSERT INTO tasks (user_id, title) VALUES ($1, $2) RETURNING *",
    [req.user.id, title]
  );
  res.json(result.rows[0]);
});

module.exports = router;
