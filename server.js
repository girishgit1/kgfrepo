const http = require('http');
const port = 3232;

const requestListener = function (req, res) {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello, World!\n');
};

const server = http.createServer(requestListener);
server.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
