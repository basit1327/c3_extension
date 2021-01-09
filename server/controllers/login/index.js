'use strict';

const
	express = require('express'),
	userAuthService = require('../../services/user/user_authentication'),
	adminAuthService = require('../../services/admin/admin_authentication');

let router = express.Router();

/* USER LOGIN */
router.post('/login', userAuthService.userLogin);
router.post('/signup', userAuthService.userRegister);

/* ADMIN LOGIN */
router.post('/admin/login', adminAuthService.adminLogin);


module.exports = router;
