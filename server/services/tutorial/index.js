/**
 * @author Basit Raza <razabasit88@gmail.com>
 * @link http://be.net/basit_raza Author Website
 * @since 2021-01-26
 */

'use strict';
const _ = require('lodash'),
	{failedToGetDatabaseConnection} = require('../../../configs/res_codes'),
	DbConnection = require('../../dataaccesss/dbconnection').DbConnection;

const categories = [1,2] // 1 mean Engineering 2 mean simple

async function addNewTutorial (req,res){
	let connection;
	try {
		let {title,link,description,category} = req.body;
		if ( !title || !link || !description || isNaN(Number(category)) ) {
			res.send({status:400,detail:'Must provide title, link, description, category'});
			return;
		}
		if(categories.indexOf(Number(category))== -1){
			res.send({status:400,detail:'Invalid Category value category can be 1 or 2 (1 for engineering 2 for simple)'});
			return;
		}
		
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let dbRes = await connection.query(`INSERT INTO tutorials
				(title,link,description,category,created_at)
				VALUES (?,?,?,?,?)`,[title,link,description,Number(category),new Date().getTime()]);
			if ( _.has(dbRes, 'insertId') ) {
				res.send({status:200,detail:'Successfully added new tutorial'})
			}
			else {
				res.send({status:400,detail:'Failed to add new tutorial'})
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while trying to add new tutorial'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function getTutorialsList(req,res){
	let connection;
	try {
		let offset = Number(req.query.offset) || 0;
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let dbRes = await connection.query(`SELECT * from tutorials ORDER BY id DESC LIMIT 10 OFFSET ?`,[offset]);
			if ( dbRes.length>0 ){
				res.send({status:200,detail:`List of 10 tutorials with offset ${offset}`,data:dbRes});
			} else {
				res.send({status:400,detail:'Oops no record found..'})
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while getting tutorials list'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function getTutorialDetail(req,res){
	let connection;
	let id = Number(req.query.id);
	try {
		if(!id){
			res.send({status:400,detail:'Tutorial-Id not provided'})
			return;
		}
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let dbRes = await connection.query(`SELECT * from tutorials where id=? LIMIT 1`,[id]);
			if ( dbRes.length>0 ){
				res.send({status:200,detail:`Detail of tutorial id: ${id}`,data:dbRes[0]});
			} else {
				res.send({status:400,detail:'Oops no record found..'})
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while getting tutorial detail'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function updateTutorialDetail (req,res){
	let connection;
	try {
		let {id, title,link,description,category} = req.body;
		if ( isNaN(Number(id)) || !title || !link || !description || isNaN(Number(category)) ) {
			res.send({status:400,detail:'Must provide id, title, link, description, category'});
			return;
		}
		if(categories.indexOf(Number(category))== -1){
			res.send({status:400,detail:'Invalid Category value category can be 1 or 2 (1 for engineering 2 for simple)'});
			return;
		}
		
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let dbRes = await connection.query(`UPDATE tutorials
				SET title=?, link=?, description=?, category=? WHERE id = ?`,[title,link,description,Number(category),Number(id)]);
			if ( _.has(dbRes,'affectedRows') ){
				res.send({status:200,detail:'Successfully update tutorial'})
			}
			else {
				res.send({status:400,detail:'Failed to update tutorial'})
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while trying to update tutorial detail'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function deleteTutorialById (req,res){
	let connection;
	try {
		let id = req.query.id;
		if ( isNaN(Number(id)) ) {
			res.send({status:400,detail:'Must provide id'});
			return;
		}
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let dbRes = await connection.query(`DELETE from tutorials WHERE id = ?`,[Number(id)]);
			if ( _.has(dbRes,'affectedRows') ){
				res.send({status:200,detail:'Successfully deleted tutorial'})
			}
			else {
				res.send({status:400,detail:'Failed to delete tutorial'})
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while trying to deleting tutorial detail'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

module.exports = {
	addNewTutorial,
	getTutorialsList,
	getTutorialDetail,
	updateTutorialDetail,
	deleteTutorialById
}
