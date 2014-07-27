1、 服务端需要返回一段普通文本给客户端，Content-Type="text/plain"
2 、服务端需要返回一段HTML代码给客户端 ，Content-Type="text/html"
3 、服务端需要返回一段XML代码给客户端 ，Content-Type="text/xml"
4 、服务端需要返回一段javascript代码给客户端，Content-Type="application/javascript"
5 、服务端需要返回一段json串给客户端，Content-Type="application/json"

json 的 contentType 常见写法有 : text/json & text/javascript

Content-Type="application/javascript"     text/javascript


1.
-g 要安装到系统的 bin/ 目录下需要权限
sudo npm install -g supervisor
supervisor  xx.js 替代 node xx.js不需要从新启动 nodejs 就可以看到结果