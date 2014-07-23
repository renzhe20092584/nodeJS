var http = require("http");
var url = require("url");
var querystring = require("querystring");

function start(route) {
  function onRequest(request, response) {
    var pathname = url.parse(request.url).pathname;
    console.log("Request for " + pathname + " received.");
    console.log("11  " + request.url)
//    route(pathname);

    var quary = url.parse(request.url).query;
    console.log("quary1  " + quary);
    var strfoo = querystring.parse(quary)["foo"];//["foo"];
    console.log("quary2  " + strfoo);
    console.log("quary3  " + querystring.parse(quary).foo);

    response.writeHead(200, {"Content-Type": "text/plain"});

    var retstring = querystring.stringify({ foo: 'bar', baz: ['qux', 'quux'], corge: '' });

    response.write("Hello World");
    response.write(retstring);
    response.end();
  }

  http.createServer(onRequest).listen(8888);
  console.log("Server has started.");
}

exports.start = start;
