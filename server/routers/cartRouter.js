const express = require("express");
const router = new express.Router();
const client = require("../db");
const optionalAuth = require("../middleware/optionalAuth");

router.get("/:session", optionalAuth, async (req, res) => {
  try {
    const userID = req.user.id || req.params.session;
    const cartQuery = await client.query(
      `SELECT * FROM carts WHERE user_id = '${userID}'`
    );
    const cartID = cartQuery.rows[0].id;
    const itemsQuery = await client.query(
      `SELECT s.quantity AS num_left, C.*, p.thumbnail, p.sizes, p.title, p.price FROM cart_items C 
        INNER JOIN products p ON p.id = c.product_id 
        INNER JOIN stock s ON p.id=s.product_id AND c.colour = s.color AND c.size = s.size
        WHERE c.cart_id = ${cartID}`
    );
    const items = itemsQuery.rows;
    res.status(200).json(items);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.get(
  "/:session/item/:cartProduct/:colour/:size",
  optionalAuth,
  async (req, res) => {
    const { session, cartProduct, colour, size } = req.params;
    const userID = req.user.id || session;
    const itemQuery = await client.query(`SELECT quantity FROM cart_items WHERE
        user_id = '${userID}' AND product_id = ${cartProduct} 
        AND colour=${colour} AND size=${size}`);
    const quantity = itemQuery.rows[0].quantity;
    res.status(200).send(quantity);
  }
);
router.post("/add", optionalAuth, async (req, res) => {
  const { cartProduct, colour, size, quantity, session } = req.body;
  const userID = req.user.id || session;
  let checkForCart = await client.query(
    `SELECT id from carts WHERE user_id = '${userID}'`
  );
  let cartID;
  if (checkForCart.rows.length > 0) {
    cartID = checkForCart.rows[0].id;
  } else {
    let cartResponse = await client.query(
      `INSERT INTO carts (user_id) values ('${userID}') RETURNING id`
    );
    cartID = cartResponse.rows[0].id;
  }
  const checkForItem = client.query(
    `SELECT product_id FROM cart_items WHERE product_id = ${cartProduct} AND cart_id= ${cartID} AND colour='${colour}' AND size='${size}'`
  );
  if ((await checkForItem).rows.length > 0) {
    client.query(`UPDATE cart_items SET quantity=quantity+${quantity}
        WHERE product_id = ${cartProduct} and cart_id=${cartID}
        and colour='${colour}' and size='${size}'`);
  } else {
    client.query(
      `INSERT INTO cart_items (product_id, colour, size, quantity,cart_id) values (${cartProduct},'${colour}','${size}',${quantity},${cartID}) `
    );
  }
  res.status(200).send("success");
});

router.put("/edit", optionalAuth, async (req, res) => {
  const { cartProduct, colour, size, quantity, session } = req.body;
  const userID = req.user.id || session;
  let checkForCart = await client.query(
    `SELECT id from carts WHERE user_id = '${userID}'`
  );
  let cartID = checkForCart.rows[0].id;
  const update =
    await client.query(`UPDATE cart_items SET quantity = ${quantity}
    WHERE product_id=${cartProduct} AND colour='${colour}' 
    AND size='${size}' AND cart_id='${cartID}'`);
  res.status(200).send();
});

router.delete("/remove", optionalAuth, async (req, res) => {
  //
  const { cartProduct, colour, size, quantity, session } = req.body;
  const userID = req.user.id || session;
});
router.delete("/clear", optionalAuth, async (req, res) => {
  const { session } = req.body;
  const userID = req.user.id || session;
  let checkForCart = await client.query(
    `SELECT id from carts WHERE user_id = '${userID}'`
  );
  let cartID = checkForCart.rows[0].id;
  let clearCart = await client.query(
    `DELETE FROM cart_items WHERE cart_id = ${cartID};DELETE FROM carts WHERE id=${cartID}`
  );
  res.status(200).send();
});
module.exports = router;
