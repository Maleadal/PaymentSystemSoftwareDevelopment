const conn = require("../config");
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

editCustomer = (req, res) => {
  const { last_name, first_name, middle_name, address, id } = req.body;
  if (!id || !last_name || !first_name || !middle_name || !address) {
    return res.send("Error: Data sent was insufficient");
  }
  const query = "SELECT * FROM customer WHERE id = ?";
  conn.query(query, id, (err, rows, fields) => {
    if (err) {
      console.log("Error in " + __dirname + ": " + err);
      return res.send("Error: " + err);
    } else {
      if (Object.keys(rows).length == 0) {
        return res.send("No customer found with id: " + id);
      } else {
        customerModel.editCustomer(
          last_name,
          first_name,
          middle_name,
          address,
          id,
          (err, customer) => {
            if (err) {
              res.send("Error: " + err);
              console.log("Error in " + __dirname + ": " + err);
            } else {
              res.status(200).send(customer);
            }
          }
        );
      }
    }
  });
};

addCustomer = (req, res) => {
  const { last_name, first_name, middle_name, address } = req.body;
  if (!last_name || !first_name || !middle_name || !address) {
    return res.send("Error: Data sent was insufficient");
  }
  customerModel.addCustomer(
    last_name,
    first_name,
    middle_name,
    address,
    (err, customer) => {
      if (err) {
        res.send("Error: " + err);
        console.log("Error in " + __dirname + ": " + err);
      } else {
        res.status(200).send("Customer added succesfully");
      }
    }
  );
};

module.exports = {
  getCustomers,
  deleteCustomer,
  editCustomer,
  addCustomer,
};
