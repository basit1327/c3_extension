'use strict';

const
	express = require('express'),
	adminAuthService = require('../../services/admin/admin_authentication');

let router = express.Router();

/*Auth APIs*/
router.get('/logout', adminAuthService.adminLogOut);


module.exports = router;
