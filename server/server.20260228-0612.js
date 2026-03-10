const express = require("express");
const cors = require("cors");
const path = require("path");

const PORT = process.env.PORT || 5555;
const cookieParser = require("cookie-parser");
const apiRouter = require("./routers/apiRouter");
// const {
//   emailsSent,
//   sendReminder
// } = require("./helperFunctions/sendGridFunctions");
require("./db");

const app = express();
app.use(cookieParser());
app.use(express.json());
// app.use(cors({ credentials: true }));
app.use(cors());
app.use(express.static(path.join(__dirname, "../frontend/versa/build")));

app.listen(PORT, () => {
  console.log(`Listening on ${PORT}`);
});

app.use(express.static("../frontend/versa/build"));

// ROUTES

// app.use("*", async (req, res, next) => {
//   let sent = await emailsSent(
//     new Date().toLocaleDateString("en-US", {
//       year: "numeric",
//       month: "numeric",
//       day: "numeric",
//     })
//   );

//   if (!sent) {
//     sendReminder();
//   }
//   next();
// });

app.use("/api", apiRouter);

app.get("*", (req, res) => {
  res.sendFile(
    path.resolve(__dirname, "../frontend/versa/build", "index.html")
  );
});
