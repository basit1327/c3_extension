'use strict';

const
	express = require('express'),
	adminAuthService = require('../../services/admin/admin_authentication'),
	productService = require('../../services/product'),
	tutorialService = require('../../services/tutorial');

let router = express.Router();

/*Auth APIs*/
router.get('/logout', adminAuthService.adminLogOut);
router.post('/update_account', adminAuthService.updateAccount);
router.post('/add_new_product', productService.addNewProduct);
router.post('/add_new_tutorial', tutorialService.addNewTutorial);
router.post('/update_tutorial', tutorialService.updateTutorialDetail);
router.get('/delete_tutorial', tutorialService.deleteTutorialById);


module.exports = router;
