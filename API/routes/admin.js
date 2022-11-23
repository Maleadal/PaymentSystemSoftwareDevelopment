const router = require("express").Router();
const adminController = require("../controllers/admin");

router.post("/", adminController.getAdmin);
router.post("/test", (req, res) => {
  res.send("hello world");
});

module.exports = router;
