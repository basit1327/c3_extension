'use strict';

const
	express = require('express'),
	productService = require('../../services/product')

let router = express.Router();

/*Product APIs */
router.get('/products', productService.getProductsList);
router.get('/productById', productService.getProductDetail);

module.exports = router;
