const router = require("express").Router()
const recordController = require("../controllers/record")

router.post('/', recordController.getRecords);
router.post('/delete', recordController.deleteRecord);
router.post('/add', recordController.addRecord);
router.post('/find', recordController.findRecord);

module.exports = router;