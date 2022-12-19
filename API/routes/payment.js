const router = require("express").Router()
const paymentController = require("../controllers/payment")

router.post('/', paymentController.getPayments);
router.post('/delete', paymentController.deletePayment);
router.post('/edit', paymentController.editPayment);
router.post('/add', paymentController.addPayment);

module.exports = router;