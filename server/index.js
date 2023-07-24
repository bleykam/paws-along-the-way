require('dotenv').config();
const PORT = process.env.PORT || 5000;
const express = require('express');
const cors = require('cors');
const path = require('path');
const app = express();
const requestRoutes = require('./routes/requestRoute');
const userRoutes = require('./routes/userRoute');

const isProduction = process.env.NODE_ENV === 'production';
console.log(isProduction)

if (isProduction) {
  // Serve static files from the 'client/build' directory in production
  app.use(express.static('client/build'));
  
  
} else {
  // Serve static files from the 'public' directory in development
  app.use(express.static('client/public'));
}

app.use(cors('*'));

app.use(express.json());
// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));
app.use('/api/user', userRoutes);
app.use('/api/requests', requestRoutes);

app.use((req, res, next) => {
  if (req.url.endsWith('.css')) {
    res.setHeader('Content-Type', 'text/css');
  }
  next();
});


app.listen(PORT, () => {
  console.log(`🚀 Server listening on port ${PORT}.`);
});


