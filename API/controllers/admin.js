const adminModel = require("../models/admin");

getAdmin = (req, res) => {
  adminModel.get((err, admin) => {
    if (err) {
      res.send("Error in fetching data: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      res.status(200).json(admin);
    }
  });
};

module.exports = {
  getAdmin,
};
