const router = require("express").Router();
const adminController = require("../controllers/admin");

router.post("/", adminController.getAdmin);


module.exports = router;
