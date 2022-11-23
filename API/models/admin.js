const conn = require("../config.js");

class Admin {
  constructor(admin) {
    this.user = admin.user;
    this.password = admin.password;
  }

  static getFromRow(row) {
    const admin = { user: row[0].username, password: row[0].password };

    return new Admin(admin);
  }

  getUser() {
    return this.user;
  }
}

Admin.get = (result) => {
  const query = "SELECT * FROM admin";
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
module.exports = Admin;
