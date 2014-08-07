var http = require("http");
var url = require("url");
var querystring = require("querystring");


//http://127.0.0.1:8888/index.js?foo=342&fbb=555
/*
request：发过来的请求
response：返回过去的响应

request.url：/index.js?foo=342&fbb=555
url.parse(request.url).pathname：/index.js
url.parse(request.url).query：foo=342&fbb=555

var quary = url.parse(request.url).query
querystring.parse(quary).foo
querystring.parse(quary)["foo"]：342

*/
function start(route) {

  function onRequest(request, response) {  
    var pathname = url.parse(request.url).pathname;
    var quary = url.parse(request.url).query;

    route(pathname);

    var strfoo = querystring.parse(quary)["foo"];


    var retstring = querystring.stringify({ foo: 'bar', baz: ['qux', 'quux'], corge: '' });
    // var retstring = querystring.stringify({foo: "bar", baz: 'qux'}, ',', ':')
    var retstring1 = querystring.parse('foo=bar&baz=qux&baz=quux&corge');
    console.log('url : ' + request.body)


    var user = {  
        PhoneNumber: '15210943874',  
        authKey: 'fewfewf'  
    };


    response.writeHead(200, {"Content-Type": "text/json & text/javascript"});
    response.write(JSON.stringify(user));
    response.end();
  }


  http.createServer(onRequest).listen(8887);
  console.log("Server has started.");
}


exports.start = start;
