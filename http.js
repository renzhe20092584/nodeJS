var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'application/json'});
  var tjson = {aa:"123"};
  res.write("3432");
  res.end();
}).listen(1339, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');
