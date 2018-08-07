//Example server

var express = require('express');
var fs = require('fs');
var https = require('https');
var app = express();
var path = require('path');

app.get('/', function(req, res) {
	res.send('hello world');
});

https.createServer(
	{
//the following pathnames require the files to be in the same folder as server.js
		key: fs.readFileSync(path.resolve(__dirname, 'server.key')),
		cert: fs.readFileSync(path.resolve(__dirname, 'server.crt')),
		passphrase: process.env.SERVER_CERT_PASSPHRASE,
	},
	app
	)
	.listen(3000, function() {
		console.log(
			'Example app listening on port 3000! Go to https://localhost:3000/'
		);
	});
