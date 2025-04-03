const express = require('express');
const app = express();
const port = 3000;

// Serve static files from www directory
app.use(express.static('www'));

// Start server
app.listen(port, '0.0.0.0', () => {
  console.log(`Server running at http://localhost:${port}`);
  console.log('Access the mobile download page at:');
  console.log(`http://localhost:${port}/download.html`);
});