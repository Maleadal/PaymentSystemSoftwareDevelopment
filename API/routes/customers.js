const router = require("express").Router()
const customerController = require("../controllers/customers")

router.post('/', customerController.getCustomers);
router.post('/delete', customerController.deleteCustomer);

module.exports = router;