const conn = require("../config.js");

class Record {
  constructor(record) {
    this.id = record.id;
    this.customer_id = record.customer_id;
    this.payment_id = record.payment_id;
  }

  static getFromRow(row) {
    row = row[0];
    const record = {
      id: row.id,
      customer_id: row.customer_id,
      payment_id: row.payment_id,
    };

    return new Record(record);
  }
}

Record.getAll = (result) => {
    const query = "SELECT * FROM records";
    conn.query(query, (err, rows, fields) => {
      if (err) {
        console.log("Error in query: ", err);
      } else {
        console.log("Query Successful");
        result(null, rows);
      }
    });
  };

  Record.deleteRecord = (customer_id, payment_id, result) => {
    const query2 = "DELETE FROM records WHERE customer_id = ? AND payment_id = ?";
    conn.query(query2, [customer_id, payment_id], (err, rows, fields) => {
      if (err) {
        console.log("Error in query: ", err);
      } else {
        console.log("Query Successful");
        result(null, {message: "Record Deleted"})
      }
    });
  };

  Record.addRecord = (customer_id, payment_id, result) => {
    const query = "INSERT INTO records(customer_id, `payment_id`) VALUES (?, ?)";
    conn.query(query,[customer_id, payment_id], (err, rows, fields) => {
      if (err) {
        console.log("Error in query: ", err);
      } else {
        result(null, { messsage: "Record Added" });
      }
    });
  };

  Record.findRecord = (customer_id, payment_id, result) =>{
    const query = "SELECT * FROM records WHERE customer_id = ? AND payment_id = ?";
    conn.query(query, [customer_id, payment_id], (err, rows, fields)=>{
      if (err) {
        console.log("Error in query: ", err);
      } else {
        result(null, rows);
      }
    })
  }

module.exports = Record