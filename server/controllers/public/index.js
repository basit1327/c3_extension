'use strict';

const
	express = require('express'),
	productService = require('../../services/product'),
	tutorialService = require('../../services/tutorial'),
	contactService = require('../../services/user/contact');

let router = express.Router();

/*Product APIs */
router.get('/products', productService.getProductsList);
router.get('/productById', productService.getProductDetail);
router.get('/tutorials', tutorialService.getTutorialsList);
router.get('/tutorialById', tutorialService.getTutorialDetail);
router.post('/submit_contact', contactService.submitContactEmail);

module.exports = router;
