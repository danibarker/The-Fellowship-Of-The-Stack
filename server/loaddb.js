const { Pool } = require("pg");
const products = require("./products");
const pool = new Pool({
    user: "me",
    host: "localhost",
    database: "api",
    password: "password",
    port: 5432,
});
const loadTables = async () => {
    const client = await pool.connect();
    await client.query("DROP TABLE products; DROP TABLE artists");
    let result = await client.query(`CREATE TABLE "products" (
      "id" SERIAL PRIMARY KEY,
      "title" varchar,
      "artist_id" int,
      "price" real,
      "description" varchar,
      "image" varchar,
      "num_sales" int,
      "num_stars" real,
      "num_reviews" int,
      "variations" varchar,
      "size_and_fit" varchar,
      "size" varchar,
      "materials" varchar
    )`);

    result = await client.query(
        'CREATE TABLE "artists" ( "id" SERIAL PRIMARY KEY, "username" varchar)'
    );
    client.query(
        'ALTER TABLE "products" ADD FOREIGN KEY ("artist_id") REFERENCES "artists" ("id")'
    );

    client.query("INSERT INTO artists (username) VALUES ('someone')");
};
const runQuery = async (query) => {
    let client = await pool.connect();
    await client.query(query);
    client.end()
};

loadTables().then(() => {
    let query = ''
    for (product of products) {
        let columns = `'${product.title}', ${product.price}, '${product.description}', '${product.image}',${product.num_sales}, ${product.num_stars}, ${product.num_reviews}, '${product.variations}', ${product.artist_id}, '${product.size}', '${product.size_and_fit}', '${product.materials}'`;
        query +=
            "INSERT INTO products (title,price,description,image,num_sales,num_stars,num_reviews, variations, artist_id, size, size_and_fit, materials) VALUES (" +
            columns +
            "); ";
        
    }
    runQuery(query);
});
