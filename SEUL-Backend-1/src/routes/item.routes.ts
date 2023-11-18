import express from 'express';

const itemController = require('../controllers/item.controller');
const router = express.Router();


router.post('/create', itemController.createItem);  

module.exports = router;
