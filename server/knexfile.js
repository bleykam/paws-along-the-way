require('dotenv').config();

// Update with your config settings.

/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */
module.exports = {
  development: {
  client: 'mysql2',
    connection: {
      port: process.env.DB_PORT,
      host: process.env.MYSQL_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
      connectionLimit: 10
    }
    // Other development settings
  },
  production: {
    // Production configuration settings
    client: 'mysql2' || 'mysql',
    connection: {
      host: process.env.DB_HOST|| process.env.MYSQL_HOST,
      user: process.env.DB_USER || process.env.MYSQL_USER,
      password: process.env.DB_PASSWORD || process.env.MYSQL_PASSWORD,
      database: process.env.DB_DATABASE || process.env.MYSQL_DATABASE,
      port: process.env.DB_PORT || process.env.MYSQL_PORT,
      pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
      },
      connectionLimit: 10
    }
    // Other production settings
  },
};
