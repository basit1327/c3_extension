
'use strict';
const _ = require('lodash'),
	{invalidQueryResult,failedToGetDatabaseConnection} = require('../../../configs/res_codes'),
	DbConnection = require('../../dataaccesss/dbconnection').DbConnection;

async function getOrdersList(req,res){
	let connection;
	try {
		let offset = Number(req.query.offset) || 0;
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let dbRes = await connection.query(`SELECT * from orders LIMIT 10 OFFSET ?`,[offset]);
			console.log('orders ', dbRes);
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

module.exports = {
	getOrdersList,
}
