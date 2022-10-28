const jwt = require("jsonwebtoken");
require("dotenv").config();
const client = require("../db");
console.log("jwt", process.env.JWT);
const auth = async (req, res, next) => {
  console.log("auth middleware");
  //
  console.log("step 1");
  try {
    const token = req.cookies.token;
    const decoded = jwt.verify(token, process.env.JWT); //gets user id, that gets saved into decoded.id
    const user = await client.query(`SELECT * FROM users WHERE id = $1`, [
      decoded.id,
    ]);
    if (!user.rows) {
      throw new Error("no user");
    }
    req.user = user.rows[0]; //attaches a user property onto the req, and that user is the obj that it got from the db
    delete req.user.password; //we dont want to pass the password on so we delete it from req.user object
    res.cookie("isArtist", `${req.user.is_artist}`, {
      maxAge: Infinity + 1,
    });
    res.cookie("isDriver", `${req.user.is_driver}`, {
      maxAge: Infinity + 1,
    });
    res.cookie("name", req.user.name, { maxAge: Infinity + 1 });
    console.log("req.user", req.user);
    next(); //next just means that we are done here so send it off to the endpoint function, so this fxn goes to the next router fxn
  } catch (e) {
    console.log(e);

    res.cookie("token", "", { maxAge: 0 });
    res.cookie("name", "", { maxAge: 0 });
    res.cookie("isArtist", "", { maxAge: 0 });
    res
      .cookie("isDriver", "", { maxAge: 0 })
      .status(401)
      .json({ error: "Please authenticate", details: e });
  }
  console.log("auth middleware end");
  //   await client.
};

module.exports = auth;
