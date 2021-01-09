/**
 * @author Basit Raza <razabasit88@gmail.com>
 * @link http://be.net/basit_raza Author Website
 * @since 2021-01-08
 */

'use strict';
const _ = require('lodash'),
	{invalidQueryResult,failedToGetDatabaseConnection} = require('../../../configs/res_codes'),
	DbConnection = require('../../dataaccesss/dbconnection').DbConnection;

async function getProductsList(req,res){
	let connection;
	try {
		let offset = Number(req.query.offset) || 0;
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let dbRes = await connection.query(`SELECT * from products where status=1 LIMIT 10 OFFSET ?`,[offset]);
			if ( dbRes.length>0 ){
				res.send({status:200,detail:`List of 10 products with offset ${offset}`,data:dbRes});
			} else {
				res.send({status:400,detail:'Oops no record found..'})
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while getting products list'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function getProductDetail(req,res){
	let connection;
	let id = Number(req.query.id);
	try {
		if(!id){
			res.send({status:400,detail:'ProductId not provided'})
			return;
		}
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let dbRes = await connection.query(`SELECT * from products where id=? LIMIT 1`,[id]);
			if ( dbRes.length>0 ){
				res.send({status:200,detail:`Detail of productId ${id}`,data:dbRes[0]});
			} else {
				res.send({status:400,detail:'Oops no record found..'})
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while adding new product'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function addNewProduct(req,res){
	let connection;
	let {title,model,price,category,description,image,color} = req.body;
	try {
		if(!title || !model || !Number(price) || !description || !category || !image || !color){
			res.send({status:400,detail:'Please fill complete details'})
			return;
		}
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let dbRes = await connection.query(`INSERT INTO products
					(title,model,price,category,description,image,color)
					VALUES (?,?,?,?,?,?,?);`,
				[title,model,Number(price),category,description,image,color]);
			if ( dbRes.insertId ){
				res.send({status:200,detail:`Product added successfully`,productId:dbRes.insertId});
			} else {
				res.send({status:400,detail:'Oops, could not add the product'})
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while adding new product'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}


module.exports = {
	getProductsList,
	getProductDetail,
	addNewProduct
};
