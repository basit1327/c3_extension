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



module.exports = {
	getProductsList,
};
