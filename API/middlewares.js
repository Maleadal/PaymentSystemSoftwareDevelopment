const conn = require("./config");
const Admin = require("./models/admin");
const logger = (req, res, next) => {
  const method = req.method;
  const url = req.url;
  const time = new Date();
  const body = req.body;
  console.log("===========================");
  console.log(`Method: ${method}`);
  console.log(`URL: ${url}`);
  console.log(`Time: ${time}`);
  console.log(`Body: ${body}`);
  console.log("===========================");

  next();
};

const authKey = (req, res, next) => {
  const query = "SELECT * FROM api_key";
  conn.query(query, (err, rows, fields) => {
    if (err) {
      console.log("Error in query: " + err);
    } else {
      const api_key = rows[0].key;
      const req_key = req.body.key;
      if (api_key == req_key) {
        next();
      } else {
        console.log("API KEY unspecified");
        return res.status(401).send({ error: "Unauthorized Request" });
      }
    }
  });
};

const authUser = (req, res, next) => {
  if (req.url == "/api/admin") {
    next();
  } else {
    const query = "SELECT * FROM admin";
    conn.query(query, (err, rows, fields) => {
      if (err) {
        console.log("Error in query: " + err);
      } else {
        const iUser = req.body.user;
        const iPassword = req.body.password;
        const admin = Admin.getFromRow(rows);
        if (admin.user != iUser || admin.password != iPassword) {
          return res.status(401).send({ error: "Unauthorized User" });
        }
        next();
      }
    });
  }
};

module.exports = [logger, authKey, authUser];
