'use strict';

const
	express = require('express'),
	productService = require('../../services/product'),
	tutorialService = require('../../services/tutorial');

let router = express.Router();

/*Product APIs */
router.get('/products', productService.getProductsList);
router.get('/productById', productService.getProductDetail);
router.get('/tutorials', tutorialService.getTutorialsList);
router.get('/tutorialById', tutorialService.getTutorialDetail);

module.exports = router;
