'use strict';

const
	express = require('express'),
	userAuthService = require('../../services/user/user_authentication'),
	productService = require('../../services/product'),
	userProfileService = require('../../services/user/user_profile');

let router = express.Router();

/*Auth APIs*/
router.get('/logout', userAuthService.userLogOut);
router.post('/update', userProfileService.updateAccount);
router.get('/delete_own', userProfileService.deleteOwnAccount);

/*Product APIs */
router.get('/products', productService.getProductsList);

module.exports = router;
