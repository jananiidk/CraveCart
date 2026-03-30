// ─────────────────────────────────────────────────────
//  server.js  –  Crave Cart Backend
//  npm install express cors mysql2
//  node server.js
// ─────────────────────────────────────────────────────
const express = require("express");
const cors    = require("cors");
const mysql   = require("mysql2");

const app = express();
app.use(cors());
app.use(express.json());

// ── DB ────────────────────────────────────────────────
const db = mysql.createConnection({
  host    : "localhost",
  user    : "root",
  password: "8870_Jan",   // ← your MySQL password
  database: "crave_db"
});

db.connect(err => {
  if (err) { console.error("❌ DB Error:", err.message); process.exit(1); }
  console.log("✅ MySQL connected to crave_db");
});

const q = (sql, params = []) =>
  new Promise((res, rej) =>
    db.query(sql, params, (err, rows) => (err ? rej(err) : res(rows)))
  );

// ═══════════════════════════════════════════════════
//  CUSTOMERS
// ═══════════════════════════════════════════════════

// GET all — for login dropdown
app.get("/customers", async (req, res) => {
  try {
    res.json(await q(
      `SELECT customer_id, customer_firstname, customer_lastname,
              customer_email, customer_address
       FROM Customer`
    ));
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// POST register new customer
app.post("/register-customer", async (req, res) => {
  const { firstname, lastname, email, phone, address, password } = req.body;
  if (!firstname || !lastname || !email || !phone || !address || !password)
    return res.status(400).json({ error: "All fields required" });
  try {
    const dup = await q("SELECT customer_id FROM Customer WHERE customer_email=?", [email]);
    if (dup.length) return res.status(409).json({ error: "Email already registered" });

    const [mx] = await q("SELECT IFNULL(MAX(customer_id),100) AS m FROM Customer");
    const newId = mx.m + 1;
    await q(
      `INSERT INTO Customer
         (customer_id, customer_firstname, customer_lastname,
          customer_password, customer_phoneno, customer_address,
          customer_email, Admin_id)
       VALUES (?,?,?,?,?,?,?,11)`,
      [newId, firstname, lastname, password, phone, address, email]
    );
    res.json({ customer_id: newId, message: "Registered" });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// POST customer login
app.post("/login", async (req, res) => {
  const { customer_id, password } = req.body;
  try {
    const rows = await q(
      "SELECT * FROM Customer WHERE customer_id=? AND customer_password=?",
      [customer_id, password]
    );
    if (!rows.length) return res.status(401).json({ error: "Wrong password" });
    res.json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ═══════════════════════════════════════════════════
//  RESTAURANTS
// ═══════════════════════════════════════════════════

// GET all
app.get("/restaurants", async (req, res) => {
  try { res.json(await q("SELECT * FROM Restaurant")); }
  catch (e) { res.status(500).json({ error: e.message }); }
});

// POST register new restaurant
app.post("/register-restaurant", async (req, res) => {
  const { name, address, phone, password } = req.body;
  if (!name || !address || !phone || !password)
    return res.status(400).json({ error: "All fields required" });
  try {
    const [mx] = await q("SELECT IFNULL(MAX(restaurant_id),200) AS m FROM Restaurant");
    const newId = mx.m + 1;
    await q(
      `INSERT INTO Restaurant
         (restaurant_id, restaurant_name, restaurant_address,
          restaurant_password, restaurant_phoneno, Admin_id)
       VALUES (?,?,?,?,?,11)`,
      [newId, name, address, password, phone]
    );
    res.json({ restaurant_id: newId, message: "Restaurant registered" });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// POST restaurant login
app.post("/restaurant-login", async (req, res) => {
  const { restaurant_id, password } = req.body;
  try {
    const rows = await q(
      "SELECT * FROM Restaurant WHERE restaurant_id=? AND restaurant_password=?",
      [restaurant_id, password]
    );
    if (!rows.length) return res.status(401).json({ error: "Wrong password" });
    res.json(rows[0]);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ═══════════════════════════════════════════════════
//  CATEGORIES
// ═══════════════════════════════════════════════════

app.get("/categories", async (req, res) => {
  try { res.json(await q("SELECT * FROM Category")); }
  catch (e) { res.status(500).json({ error: e.message }); }
});

// POST add category for a restaurant (a restaurant can have many categories)
app.post("/categories", async (req, res) => {
  const { category_name, restaurant_id } = req.body;
  if (!category_name || !restaurant_id)
    return res.status(400).json({ error: "category_name and restaurant_id required" });
  try {
    const dup = await q(
      "SELECT category_id FROM Category WHERE category_name=? AND restaurant_id=?",
      [category_name, restaurant_id]
    );
    if (dup.length) return res.status(409).json({ error: "Category already exists for this restaurant" });

    const [mx] = await q("SELECT IFNULL(MAX(category_id),300) AS m FROM Category");
    const newId = mx.m + 1;
    await q(
      "INSERT INTO Category (category_id, category_name, restaurant_id) VALUES (?,?,?)",
      [newId, category_name, restaurant_id]
    );
    res.json({ category_id: newId, message: "Category added" });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ═══════════════════════════════════════════════════
//  MENU ITEMS
// ═══════════════════════════════════════════════════

app.get("/menu", async (req, res) => {
  try { res.json(await q("SELECT * FROM Menu_items")); }
  catch (e) { res.status(500).json({ error: e.message }); }
});

app.post("/menu", async (req, res) => {
  const { item_name, price, category_id } = req.body;
  if (!item_name || price == null || !category_id)
    return res.status(400).json({ error: "item_name, price, category_id required" });
  try {
    const [mx] = await q("SELECT IFNULL(MAX(item_code),400) AS m FROM Menu_items");
    const newCode = mx.m + 1;
    await q(
      "INSERT INTO Menu_items (item_code, item_name, price, category_id) VALUES (?,?,?,?)",
      [newCode, item_name, price, category_id]
    );
    res.json({ item_code: newCode, message: "Item added" });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

app.delete("/menu/:code", async (req, res) => {
  try {
    await q("DELETE FROM Orders     WHERE item_code=?", [req.params.code]);
    await q("DELETE FROM Menu_items WHERE item_code=?", [req.params.code]);
    res.json({ message: "Deleted" });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ═══════════════════════════════════════════════════
//  RATINGS
// ═══════════════════════════════════════════════════

app.get("/ratings", async (req, res) => {
  try { res.json(await q("SELECT * FROM Rating")); }
  catch (e) { res.status(500).json({ error: e.message }); }
});

app.post("/rate", async (req, res) => {
  const { customer_id, restaurant_id, rating } = req.body;
  try {
    await q("DELETE FROM Rating WHERE customer_id=? AND restaurant_id=?", [customer_id, restaurant_id]);
    await q("INSERT INTO Rating (ratings, customer_id, restaurant_id) VALUES (?,?,?)",
      [rating, customer_id, restaurant_id]);
    res.json({ message: "Rating saved" });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ═══════════════════════════════════════════════════
//  DELIVERIES
// ═══════════════════════════════════════════════════

app.get("/deliveries", async (req, res) => {
  try { res.json(await q("SELECT * FROM Delivery_details")); }
  catch (e) { res.status(500).json({ error: e.message }); }
});

// ═══════════════════════════════════════════════════
//  ORDERS
// ═══════════════════════════════════════════════════

// GET customer orders with full details
app.get("/orders/:customer_id", async (req, res) => {
  try {
    const orders = await q(
      `SELECT od.*, dd.delivery_address, dd.delivery_status,
              pd.payment_mode, r.restaurant_name
       FROM Order_details od
       LEFT JOIN Delivery_details dd ON od.delivery_id   = dd.delivery_id
       LEFT JOIN Payment_details  pd ON od.payment_id    = pd.payment_id
       LEFT JOIN Restaurant        r ON od.restaurant_id = r.restaurant_id
       WHERE od.customer_id=?
       ORDER BY od.Order_time DESC`,
      [req.params.customer_id]
    );
    for (const o of orders) {
      o.items = await q(
        `SELECT oi.quantity, mi.item_name, mi.price
           FROM Orders oi JOIN Menu_items mi ON oi.item_code=mi.item_code
          WHERE oi.Order_id=?`,
        [o.Order_id]
      );
    }
    res.json(orders);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// GET restaurant orders
app.get("/restaurant-orders/:restaurant_id", async (req, res) => {
  try {
    const orders = await q(
      `SELECT od.*, c.customer_firstname, c.customer_lastname,
              dd.delivery_address, dd.delivery_status, pd.payment_mode
       FROM Order_details od
       LEFT JOIN Customer          c  ON od.customer_id  = c.customer_id
       LEFT JOIN Delivery_details  dd ON od.delivery_id  = dd.delivery_id
       LEFT JOIN Payment_details   pd ON od.payment_id   = pd.payment_id
       WHERE od.restaurant_id=?
       ORDER BY od.Order_time DESC`,
      [req.params.restaurant_id]
    );
    for (const o of orders) {
      o.items = await q(
        `SELECT oi.quantity, mi.item_name, mi.price
           FROM Orders oi JOIN Menu_items mi ON oi.item_code=mi.item_code
          WHERE oi.Order_id=?`,
        [o.Order_id]
      );
    }
    res.json(orders);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// POST place order — writes to Payment_details, Delivery_details, Order_details, Orders
app.post("/order", async (req, res) => {
  const { customer_id, restaurant_id, items, total, payment_mode, delivery_address } = req.body;
  if (!customer_id || !items?.length)
    return res.status(400).json({ error: "Missing required fields" });
  try {
    const [pmx] = await q("SELECT IFNULL(MAX(payment_id),600) AS m FROM Payment_details");
    const pid   = pmx.m + 1;
    await q("INSERT INTO Payment_details (payment_id,payment_mode,payment_timestamp) VALUES (?,?,NOW())",
      [pid, payment_mode || "COD"]);

    const [dmx] = await q("SELECT IFNULL(MAX(delivery_id),500) AS m FROM Delivery_details");
    const did   = dmx.m + 1;
    await q("INSERT INTO Delivery_details (delivery_id,delivery_address,delivery_status) VALUES (?,?,'Preparing')",
      [did, delivery_address || ""]);

    const [omx] = await q("SELECT IFNULL(MAX(Order_id),700) AS m FROM Order_details");
    const oid   = omx.m + 1;
    await q(
      `INSERT INTO Order_details
         (Order_id,Order_time,Order_amount,Order_status,customer_id,delivery_id,payment_id,restaurant_id)
       VALUES (?,NOW(),?,'Preparing',?,?,?,?)`,
      [oid, total, customer_id, did, pid, restaurant_id]
    );
    for (const item of items) {
      await q("INSERT INTO Orders (quantity,Order_id,item_code) VALUES (?,?,?)",
        [item.quantity, oid, item.item_code]);
    }
    res.json({ Order_id: oid, message: "Order placed" });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ═══════════════════════════════════════════════════
//  RESTAURANT STATS
// ═══════════════════════════════════════════════════

app.get("/restaurant-stats/:id", async (req, res) => {
  const id = req.params.id;
  try {
    const [oc]  = await q("SELECT COUNT(*) AS cnt   FROM Order_details WHERE restaurant_id=?", [id]);
    const [rev] = await q("SELECT IFNULL(SUM(Order_amount),0) AS total FROM Order_details WHERE restaurant_id=?", [id]);
    const [avg] = await q("SELECT IFNULL(AVG(ratings),0) AS avg FROM Rating WHERE restaurant_id=?", [id]);
    const [cc]  = await q("SELECT COUNT(*) AS cnt   FROM Category WHERE restaurant_id=?", [id]);
    res.json({ orders: oc.cnt, revenue: rev.total, rating: parseFloat(avg.avg).toFixed(1), cats: cc.cnt });
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ─────────────────────────────────────────────────────
app.listen(3000, () => console.log("🚀  Server → http://localhost:3000"));