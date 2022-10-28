require("dotenv").config();

const connectionString =
  process.env.DATABASE_URL ||
  `postgres://avljsgdm:fjdtLle4XFsMgPD-9Whp0jJ_eGGnaRkt@otto.db.elephantsql.com/avljsgdm`;

const { Client } = require("pg");
const client = new Client(connectionString);
client.connect();
module.exports = client;
