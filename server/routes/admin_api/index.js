'use strict';

const
	express = require('express'),
	adminApiController = require('../../controllers/admin_api');

let router = express.Router();

router.use('/api', adminApiController);

module.exports = router;
