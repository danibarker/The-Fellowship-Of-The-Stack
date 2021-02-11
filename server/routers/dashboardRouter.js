const express = require("express");
const router = new express.Router();
const pool = require("../db");
const auth = require("../middleware/auth");

router.get("/sales-by-products", auth, async (req, res) => {
    try {
        const result = await pool.query(
            `SELECT p.title, s.sale_price, s.quantity, SUM(s.sale_price * s.quantity) 
            FROM sales_by_product s
            INNER JOIN products p
            ON p.id=s.product_id
            GROUP BY product_id, title, s.sale_price, s.quantity
            ORDER BY SUM desc;
            `
        );

        const productSalesInfo = result.rows;

        res.json(productSalesInfo);
    } catch (e) {
        console.log("error", e);
        res.send(e);
    }
});
router.get("/total-orders", auth, async (req, res) => {
    try {
        const result = await pool.query(
            `SELECT sum(sale_price), EXTRACT(day FROM DATE) AS DAY, 
            EXTRACT(month FROM DATE) AS MONTH, 
            EXTRACT(year FROM DATE) AS YEAR FROM sales_by_product 
            WHERE artist_id = ${req.user.id}
            GROUP BY EXTRACT(day FROM DATE), 
            EXTRACT(month FROM DATE), 
            EXTRACT(year FROM DATE)
            ORDER BY DAY desc
            `
        );
        const productSalesInfo = result.rows;

        res.json(productSalesInfo);
    } catch (e) {
        console.log("error", e);
        res.send(e);
    }
});

router.get("/total-sales/", auth, async (req, res) => {
    try {
        const result = await pool.query(
            `SELECT sum(sale_price), EXTRACT(day FROM DATE) AS DAY, EXTRACT(month FROM DATE) AS month, EXTRACT(year FROM DATE) AS YEAR
            FROM sales_by_product
            WHERE artist_id = ${req.user.id}
            GROUP BY EXTRACT(day FROM DATE), EXTRACT(month FROM DATE), EXTRACT(year FROM DATE)
            ORDER BY DAY desc
            `
        );

        const productSalesInfo = result.rows;
        console.log(result.rows, "baked");
        console.log(productSalesInfo, "donuts");

        res.json(productSalesInfo);
    } catch (e) {
        console.log("error", e);
        res.send(e);
    }
});

router.get("/average-order-value", auth, async (req, res) => {
    console.log(req.params, "fresh");
    try {
        const result = await pool.query(
            `SELECT AVG(SUM) as average, day, MONTH, YEAR FROM 
            (SELECT SUM(sale_price), extract(day from DATE) AS DAY, 
            EXTRACT(month FROM DATE) AS month, EXTRACT(year FROM DATE) AS YEAR 
            FROM sales_by_product where artist_id = ${req.user.id} GROUP BY order_id, 
            EXTRACT(DAY FROM DATE), EXTRACT(month FROM DATE), 
            EXTRACT(year FROM DATE)) s 
            GROUP BY s.day, s.month,s.year ORDER BY s.DAY desc
            `
        );

        const productSalesInfo = result.rows;
        console.log(result.rows, "baked");
        console.log(productSalesInfo, "donuts");

        res.json(productSalesInfo);
    } catch (e) {
        console.log("error", e);
        res.send(e);
    }
});
router.get("/recent-orders", auth, async (req, res) => {
    console.log(req.params, "fresh");
    try {
        const result = await pool.query(
            `SELECT o.*, u.name FROM orders o left JOIN users u on o.buyer_id=u.id ORDER BY Date desc;
            `
        );

        const orderInfo = result.rows;
        for (order of orderInfo) {
            let options = {
                weekday: "long",
                year: "numeric",
                month: "long",
                day: "numeric",
            };

            let ordersDate = new Date(order.date);

            let orderDate = ordersDate.toLocaleDateString("en-US", options);

            let orderTime = ordersDate.toLocaleTimeString([], {
                hour: "2-digit",
                minute: "2-digit",
            });
            order.orderTime = orderTime;
            order.orderDate = orderDate;
        }
        console.log(orderInfo, "baked");

        console.log(orderInfo, "donuts");

        res.json(orderInfo);
    } catch (e) {
        console.log("error", e);
        res.send(e);
    }
});

module.exports = router;
