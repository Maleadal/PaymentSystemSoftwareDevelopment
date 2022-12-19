const conn = require("../config");
const paymentModel = require("../models/payment");

getPayments = (req, res) => {
  paymentModel.getAll((err, payment) => {
    if (err) {
      res.send("Error in fetching data: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      res.status(200).json(payment);
    }
  });
};

deletePayment = (req, res) => {
  id = req.body.id;
  if (!id) {
    return res.send("ID is required");
  }

  paymentModel.deletePayment(id, (err, payment) => {
    if (err) {
      res.send("Error: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      res.status(200).send(payment);
    }
  });
};

addPayment = (req, res) => {
  const { name, value } = req.body;
  if (!name || !value) {
    return res.send("Error: Data sent was insufficient");
  }

  paymentModel.addPayment(name, value, (err, payment) => {
    if (err) {
      res.send("Error: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      res.status(200).send("Payment added successfully");
    }
  });
};

editPayment = (req, res) => {
  const { id, name, value } = req.body;
  if (!id || !name || !value) {
    return res.send("Error: Data send was insufficient");
  }

  const query = "SELECT * FROM payment WHERE id = ?";
  conn.query(query, id, (err, rows, fields) => {
    if (err) {
      res.send("Error: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      if (Object.keys(rows).length == 0) {
        return res.send("No payment found with id: " + id);
      } else {
        paymentModel.updatePayment(id, name, value, (err, payment) => {
          if (err) {
            res.send("Error: " + err);
            console.log("Error in " + __dirname + ": " + err);
          } else {
            res.status(200).send("Payment successfully edited");
          }
        });
      }
    }
  });
};

module.exports = {
  getPayments,
  addPayment,
  editPayment,
  deletePayment,
};
