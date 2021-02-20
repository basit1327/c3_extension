'use strict';

const auth = require('../services/auth'),
    apiRoute = require('./api'),
    publicApiController = require('./public'),
    adminApiController = require('./admin_api'),
    loginRoute = require('../routes/login');

function init(server) {

    // supporting every casing in query parameters
    server.use(function (req, res, next) {
        for (var key in req.query) {
            req.query[key.toLowerCase()] = req.query[key];
        }
        for (var key in req.body) {
            req.body[key.toLowerCase()] = req.body[key];
        }
        next();
    });

    server.use('/', function (req, res, next) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
        res.setHeader('Access-Control-Allow-Headers', "Origin, X-Requested-With, Content-Type, Authorization");
        next();
    });

    server.get('/', function (req, res) {
        res.send('<center>' +
            '<div style="text-align: center; font-family: sans-serif; color: #777; font-size: 30px">Server is Listning</div>'+
            '<img src="https://cdn.dribbble.com/users/563824/screenshots/3633228/untitled-5.gif">' +
            '</center>')
    });

    server.use('/api',auth.authenticateUserSession,apiRoute);
    server.use('/public',publicApiController);
    server.use('/admin',auth.authenticateAdminSession,adminApiController);
    server.use('/auth',loginRoute);

}

module.exports = {
    init: init
};
