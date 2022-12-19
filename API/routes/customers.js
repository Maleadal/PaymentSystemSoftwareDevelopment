const router = require("express").Router()
const customerController = require("../controllers/customers")

router.post('/', customerController.getCustomers);
router.post('/delete', customerController.deleteCustomer);
router.post('/edit', customerController.editCustomer);
router.post('/add', customerController.addCustomer);

module.exports = router;