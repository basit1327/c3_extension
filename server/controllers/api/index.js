'use strict';

const
	express = require('express'),
	userAuthService = require('../../services/user/user_authentication'),
	userProfileService = require('../../services/user/user_profile');

let router = express.Router();

router.get('/logout', userAuthService.userLogOut);
router.post('/update', userProfileService.updateAccount);
router.get('/delete_own', userProfileService.deleteOwnAccount);

module.exports = router;
