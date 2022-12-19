const conn = require("../config.js");

class Payment {
  constructor(payment) {
    this.id = payment.id;
    this.name = payment.name;
    this.value = payment.value;
  }

  static getFromRow(row) {
    row = row[0];
    const payment = {
      id: row.id,
      name: row.name,
      value: row.value,
    };

    return new Payment(payment);
  }
}

Payment.getAll = (result) => {
  const query = "SELECT * FROM payment";
  conn.query(query, (err, rows, fields) => {
    if (err) {
      console.log("Error in query: ", err);
    } else {
      console.log("Query Successful");
      result(null, rows);
    }
  });
};

Payment.deletePayment = (id, result) => {
  const query = "DELETE FROM payment WHERE id = ?";
  const query2 = "DELETE FROM records WHERE payment_id = ?";
  conn.query(query2, id, (err, rows, fields) => {
    if (err) {
      console.log("Error in query: ", err);
    } else {
      conn.query(query, id, (err, rows, fields) => {
        if (err) {
          console.log("Error in query: ", err);
        } else {
          result(null, { message: "Payment with id: " + id + " Deleted" });
        }
      });
    }
  });
};

Payment.addPayment = (name, value, result) => {
  const query = "INSERT INTO payment(name, `value`) VALUES (?, ?)";
  conn.query(query,[name, value], (err, rows, fields) => {
    if (err) {
      console.log("Error in query: ", err);
    } else {
      result(null, { messsage: "Payment with name: " + name + " Added" });
    }
  });
};

Payment.updatePayment = (id, name, value, result) => {
  const query = "UPDATE payment SET name = ?, `value` = ? WHERE id = ?";

  conn.query(query, [name, value, id], (err, rows, fields) => {
    if (err) {
      console.log("Error in query: ", err);
    } else {
      result(null, {
        message: "Payment with id " + id + " Updated successfully",
      });
    }
  });
};

module.exports = Payment;
