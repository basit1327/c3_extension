'use strict';

const
	express = require('express'),
	publicApiController = require('../../controllers/public');

let router = express.Router();

router.use('/', publicApiController);

module.exports = router;
