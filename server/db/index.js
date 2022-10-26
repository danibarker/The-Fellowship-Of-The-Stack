require("dotenv").config();

const pg = require("pg");

pg.defaults.ssl = true;
const connectionString =
  process.env.DATABASE_URL ||
  `postgres://avljsgdm:fjdtLle4XFsMgPD-9Whp0jJ_eGGnaRkt@otto.db.elephantsql.com/avljsgdm`;

const pool = new pg.Pool({
  max: 50,
  ssl: { rejectUnauthorized: false },
  connectionString
});
module.exports = pool;
