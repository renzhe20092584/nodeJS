
// console.log("dsd")
//  var http = require("http"); 
//  var url = require("url"); 

//  http.createServer(function (req, res) { 
//     var urlObj = url.parse(req.url, true); // 获取被代理的 URL 
//     var urlToProxy = urlObj.query.url; 
//     if (!urlToProxy) { 
//         res.statusCode = 400; 
//         res.end("URL 是dsd sdsd 必须的。"); 
//     } 
//     else { 
//         console.log("处理代理请求：" + urlToProxy); 
//         var parsedUrl = url.parse(urlToProxy); 
//         var opt = { 
//             host : parsedUrl.hostname, 
//             port : parsedUrl.port || 80, 
//             path : (parsedUrl.pathname || "") + (parsedUrl.search || "") 
//                 + (parsedUrl.hash || "") 
//         }; 
//         http.get(opt, function(pres) { // 请求被代理 URL 的内容
//             res.statusCode = pres.statusCode; 
//             var headers = pres.headers; 
//             for (var key in headers) { 
//                 res.setHeader(key, headers[key]); 
//             } 
//             pres.on("data", function(chunk) { 
//                 res.write(chunk); // 写回数据
//             }); 
//             pres.on("end", function() { 
//                 res.end(); 
//             }); 
//         }); 
//     } 
//  }).listen(8088, "127.0.0.1"); 

//  console.log("代理服务器已经在 8088 端口启动。");

var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});

  var json = {aa:"aaddd"};

  res.write("json");
  res.end('Hello World\n');
}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');

// To run the server, put the code into a file example.js and execute it with the node program from the command line:

// % node example.js
// Server running at http://127.0.0.1:1337/
// Here is an example of a simple TCP server which listens on port 1337 and echoes whatever you send it:

// var net = require('net');
// var server = net.createServer(function (socket) {
//   socket.write('Echo server\r\n');
//   socket.pipe(socket);
// });

// server.listen(1337, '127.0.0.1');