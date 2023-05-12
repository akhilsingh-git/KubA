const express = require('express');
const app = express();
const port = 3000;

// Add the Hello, World! route
app.get('/', (req, res) => {
  res.send('Hello, World!');
});
// Define your other routes and middleware 


app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
