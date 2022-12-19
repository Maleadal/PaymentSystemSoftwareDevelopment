const conn = require("../config");
const recordModel = require("../models/record");

getRecords = (req, res) => {
  recordModel.getAll((err, payment) => {
    if (err) {
      res.send("Error in fetching data: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      res.status(200).json(payment);
    }
  });
};

deleteRecord = (req, res) => {
  id = req.body.id;
  if (!id) {
    return res.send("ID is required");
  }

  recordModel.deleteRecord(id, (err, payment) => {
    if (err) {
      res.send("Error: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      res.status(200).send(payment);
    }
  });
};

addRecord = (req, res) => {
  const { customer_id, payment_id } = req.body;
  if (!customer_id || !payment_id) {
    return res.send("Error: Data sent was insufficient");
  }

  recordModel.addRecord(customer_id, payment_id, (err, payment) => {
    if (err) {
      res.send("Error: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      res.status(200).send("Payment added successfully");
    }
  });
};

module.exports = {
  getRecords,
  addRecord,
  deleteRecord,
};
