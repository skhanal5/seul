import express from 'express';

const userControllers = require('../controllers/user.controller');
const router = express.Router();
const authenticate = require('../middleware/authenticate');

router.get('/test', userControllers.test);
router.post('/create', userControllers.createUser);
router.post('/register', userControllers.registerUser);
router.post('/authenticate', userControllers.authenticateUser);
router.use(authenticate)
module.exports = router;
