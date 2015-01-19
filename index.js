var ghost = require('ghost');
var path = require('path');
ghost({
  config: path.join(__dirname, 'config.js'),
  contentPath: path.join(__dirname, 'content')
}).then(function(ghostServer) {
  ghostServer.start();
})
