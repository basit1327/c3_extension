'use strict';

const
	express = require('express'),
	adminAuthService = require('../../services/admin/admin_authentication'),
	productService = require('../../services/product');

let router = express.Router();

/*Auth APIs*/
router.get('/logout', adminAuthService.adminLogOut);
router.post('/update_account', adminAuthService.updateAccount);
router.post('/addNewProduct', productService.addNewProduct);


module.exports = router;
