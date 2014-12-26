/**
 * Main application file
 */

'use strict';

// Set default node environment to development
process.env.NODE_ENV = process.env.NODE_ENV || 'development';

var express = require('express');
//var mongoose = require('mongoose');
var config = require('./config/environment');

// Connect to database
//mongoose.connect(config.mongo.uri, config.mongo.options);

// Populate DB with sample data
//if(config.seedDB) { require('./config/seed'); }

// Setup server
var app = express();
var server = require('http').createServer(app);
var socketio = require('socket.io')(server, {
    serveClient: (config.env === 'production') ? false : true,
    path: '/socket.io-client'
});
require('./config/socketio')(socketio);
require('./config/express')(app);
require('./routes')(app);


var models = require("../models");



models.sequelize.sync({force: true}).then(function () {
// Start server
    server.listen(config.port, config.ip, function () {
        console.log('Express server listening on %d, in %s mode', config.port, app.get('env'));

        models.User.create({
            firstName: "Toby",
            surname: "Tremayne",
            email: "toby@magicindustries.net",
            password: "password",
            bActive: true,
            bLocked: false
        }).then(function (user) {
            models.User.find({ where: {email: "toby@magicindustries.net"}}).complete(function(err, theuser) {
                if (err) {
                    console.log('error occurred', err);
                }
                console.log(theuser);
            })
        }, function (err){
            console.log(err);
            console.log(err.stack);
        });

    });
});


// Expose app
module.exports = module.exports = app;