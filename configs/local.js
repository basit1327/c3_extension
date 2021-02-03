'use strict';

module.exports = {
    environment: "LOCAL",
    hostname: 'localhost',
    serverPort : 3006,
    jwtSecret : 'kjh513%%!151e1523521423',
    debug : true,
    SMTPConfig:{
        pool:true,
        host:'mail.calculatechs.com',
        port:26,
        secure:false,
        auth:{
            user:'contact@calculatechs.com',
            pass:'Waleed_123.ok'
        },
        tls: {
            rejectUnauthorized: false
        }
    },
};
