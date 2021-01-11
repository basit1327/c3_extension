/**
 * @author Basit Raza <razabasit88@gmail.com>
 * @link http://be.net/basit_raza Author Website
 * @since 2021-01-11
 */

'use strict';
const _ = require('lodash'),
	{invalidQueryResult,failedToGetDatabaseConnection} = require('../../../../configs/res_codes'),
	DbConnection = require('../../../dataaccesss/dbconnection').DbConnection;


async function createOrder(req,res){
	let connection;
	try{
		let orderItems = req.body.order;
		
		let insertOrderItems = async (orderId,productId,quantity)=>{
			let orderItemInsert = await connection.query(`INSERT INTO order_items (order_id,product_id,quantity) VALUES (?,?,?)`,[orderId,productId,quantity]);
			return _.has(orderItemInsert,'insertId');
		}
		
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			await connection.query(`START TRANSACTION`);
			let allProductsValid = false;
			let orderId;
			let orderTotal = 0;
			for(let i=0;i<orderItems.length;i++){
				let productDetail = await connection.query(`SELECT * FROM products WHERE id=? AND status = 1`,[Number(orderItems[i].productId)])
				if(_.has(productDetail,'[0].id') && _.has(productDetail,'[0].price')){
					orderTotal += productDetail[0].price
				}
				else{
					await connection.query(`ROLLBACK`);
					throw 'No product found with id:'+orderItems[i].productId;
				}
				if(i==orderItems.length-1){
					allProductsValid = true;
				}
			}
			if(allProductsValid){
				let orderInsert = await connection.query(`INSERT INTO orders (user_id,created_at,total_amount) VALUES (?,?,?)`,[req.userId,new Date().getTime(),orderTotal]);
				if ( _.has(orderInsert,'insertId') ){
					orderId = orderInsert.insertId;
					for(let i=0;i<orderItems.length;i++){
						let orderItemInserted = insertOrderItems(orderId,orderItems[i].productId,orderItems[i].quantity);
						if(!orderItemInserted){
							await connection.query(`ROLLBACK`);
							throw 'something went wrong no insert id in order-item insert'
						}
					}
				} else {
					await connection.query(`ROLLBACK`);
					throw 'something went wrong no insert id in order insert'
				}
			}
			await connection.query(`COMMIT`);
			res.send({status:200,detail:'Your order is placed successfully',orderId});
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while adding your order'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function getOrderById(req,res){
	let connection;
	try {
		let id = Number(req.query.id);
		if ( !id ) {
			res.send({status:400,detail:'Invalid request'});
			return;
		}
		
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let orderDetail = await connection.query(`SELECT * FROM orders WHERE orders.id=? AND orders.user_id=? LIMIT 1`,[id,req.userId]);
			if ( _.has(orderDetail,'[0].id') ){
				let orderItems = await connection.query(`
					SELECT order_items.*,
					products.title, products.model, products.price,products.category,products.image
					FROM order_items
					INNER JOIN products
					ON order_items.product_id = products.id
					WHERE order_id=?`,[orderDetail[0].id]);
				res.send({
					status:200,
					detail:'Order Details',
					data:{
						created_at:orderDetail[0].created_at,
						total_amount:orderDetail[0].total_amount,
						order_id:orderDetail[0].id,
						status:orderDetail[0].status,
						items:orderItems
					}
				});
			} else {
				throw 'something went wrong while updating user details'
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while getting order details'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function getAllOrders(req,res){
	let connection;
	try {
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let ordersList = await connection.query(`SELECT * FROM orders WHERE orders.user_id=?`,[req.userId]);
			let data = [];
			for(let i=0;i<ordersList.length;i++){
				let orderItems = await connection.query(`
					SELECT order_items.*,
					products.title, products.model, products.price,products.category,products.image
					FROM order_items
					INNER JOIN products
					ON order_items.product_id = products.id
					WHERE order_id=?`,[ordersList[0].id]);
				data.push({
					created_at:ordersList[i].created_at,
					total_amount:ordersList[i].total_amount,
					order_id:ordersList[i].id,
					status:ordersList[i].status,
					items:orderItems
				})
			}
			if(data.length>0){
				res.send({status:200,detail:"All of your recent orders",data})
			}
			else{
				res.send({status:200,detail:"You've no order yet",data})
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while getting order details'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}


module.exports = {
	createOrder,
	getOrderById,
	getAllOrders
};
