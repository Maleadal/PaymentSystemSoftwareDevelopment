const customerModel = require("../models/customers");

getCustomers = (req, res) => {
  customerModel.getAll((err, customer) => {
    if (err) {
      res.send("Error in fetching data: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      res.status(200).json(customer);
    }
  });
};

deleteCustomer = (req, res) => {
  id = req.body.id;
  if (!id) {
    return res.send("Id is required");
  }
  customerModel.deleteCustomer(id, (err, customer) => {
    if (err) {
      res.send("Error: " + err);
      console.log("Error in " + __dirname + ": " + err);
    } else {
      res.status(200).send(customer);
    }
  });
};

module.exports = {
  getCustomers,
  deleteCustomer,
};
