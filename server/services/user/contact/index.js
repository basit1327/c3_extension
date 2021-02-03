/**
 * @author Basit Raza <razabasit88@gmail.com>
 * @link http://be.net/basit_raza Author Website
 * @since 2021-02-03
 */

'use strict';
const _ = require('lodash'),
	emailService = require('../../email');


async function submitContactEmail(req,res){
	let connection;
	try{
		let {email,username,subject,message} = req.body;
		if(!email || !username || !subject || !message ){
			res.send({status:400,detail:'Please fill all required fields'})
			return;
		}
		let template = emailService.utils.generateContactEmail(username,subject,message,email);
		let sendEmail = await emailService.sendEmail(null,username,subject,message,template);
		if(sendEmail instanceof Error){
			res.send({status:400,detail:sendEmail.message})
		}
		else {
			res.send({status:200,detail:'You request has been received.'})
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong...'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

module.exports = {
	submitContactEmail
};
