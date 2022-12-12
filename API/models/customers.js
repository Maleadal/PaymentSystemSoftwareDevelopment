const conn = require("../config.js");

class Customer {
  constructor(customer) {
    this.id = customer.id;
    this.last_name = customer.last_name;
    this.first_name = customer.first_name;
    this.middle_name = customer.middle_name;
    this.address = customer.address;
  }

  static getFromRow(row) {
    row = row[0];
    const customer = {
      id: row.id,
      last_name: row.last_name,
      first_name: row.first_name,
      middle_name: row.middle_name,
      address: row.address,
    };

    return new Customer(customer);
  }
}

Customer.getAll = (result) => {
  const query = "SELECT * FROM customer";
  conn.query(query, (err, rows, fields) => {
    if (err) {
      console.log("Error in query: ", err);
    } else if (rows !== 0) {
      console.log("Query Successful");
      result(null, rows);
    } else {
      console.log("No data in table");
      result(null, { message: "No data in table" });
    }
  });
};

Customer.deleteCustomer = (id, result) => {
  const query = "DELETE FROM customer WHERE id = ?";
  conn.query(query, id, (err, rows, fields) => {
    if (err) {
      console.log("Error in query: ", err);
    } else {
      result(null, { message: "Customer with id: " + id + " Deleted" });
    }
  });
};

// TODO: Update the query and add the parameters
Customer.editCustomer = (data, result) =>{
  const query = "UPDATE customer SET last_name=?, first_name=?, middle_name=?, address=? WHERE id=?"
  conn.query()
}
module.exports = Customer;
