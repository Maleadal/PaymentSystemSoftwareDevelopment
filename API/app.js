const express = require("express");
const app = express();
const port = 3000;
const adminRouter = require("./routes/admin");
const customerRouter = require("./routes/customers")
const middlewares = require("./middlewares");

app.use(express.json());
// * Server connection
app.listen(port, () => {
  console.log("Server running on http://localhost:" + port);
});

// Routes
app.get("/", (req, res) => {
  return res.send(
    "API for the payment recording system for the course Software Development 1"
  );
});

app.use(middlewares);

app.use("/api/admin", adminRouter);
app.use("/api/customer", customerRouter)
