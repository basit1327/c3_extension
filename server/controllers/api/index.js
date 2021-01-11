'use strict';

const
	express = require('express'),
	userAuthService = require('../../services/user/user_authentication'),
	userProfileService = require('../../services/user/user_profile'),
	orderService = require('../../services/user/order');

let router = express.Router();

/*Auth APIs*/
router.get('/logout', userAuthService.userLogOut);
router.post('/update', userProfileService.updateAccount);
router.get('/delete_own', userProfileService.deleteOwnAccount);
router.post('/create_order', orderService.createOrder);


module.exports = router;
