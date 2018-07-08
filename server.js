var http = require('http');
var port = 3000;

var currentColor = function randomBackgroundColor() {
  var x = Math.floor(Math.random() * 256);
  var y = Math.floor(Math.random() * 256);
  var z = Math.floor(Math.random() * 256);
  var bgColor = 'rgb(' + x + ',' + y + ',' + z + ')';
  return bgColor;
}();

var serverIpString;
require('dns').lookup(require('os').hostname(), function(err, serverIp, fam) {
  serverIpString = serverIp;
  console.log(`Server: ${serverIp} calculated color: ${currentColor}`);
})

var handleRequest = function(request, response) {
  console.log('Received request for URL: ' + request.url);
  response.writeHead(200, {'Content-Type': 'text/html'});
  response.write(
      '<html><style>body {background-color: ' + currentColor +
      `;display: flex;justify-content: center;align-items: center;color:white;text-shadow: 2px 2px 2px #333333;}</style><body><h1>Hello World from ${
          serverIpString}!</h1></body></html>`);
  setTimeout(function() {
    console.log('Block Request for load-testing....');
    response.end();
  }, 5000);
};
var www = http.createServer(handleRequest);
www.listen(port);