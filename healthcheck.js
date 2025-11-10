const http = require('http');

const options = {
  hostname: 'localhost',
  port: process.env.APP_PORT || 13000,
  path: '/api/app:getLang',
  method: 'GET',
  timeout: 5000
};

const req = http.request(options, (res) => {
  if (res.statusCode === 200) {
    console.log('✅ Health check passed');
    process.exit(0);
  } else {
    console.log(`❌ Health check failed: ${res.statusCode}`);
    process.exit(1);
  }
});

req.on('error', (err) => {
  console.log(`❌ Health check error: ${err.message}`);
  process.exit(1);
});

req.on('timeout', () => {
  console.log('❌ Health check timeout');
  req.destroy();
  process.exit(1);
});

req.end();