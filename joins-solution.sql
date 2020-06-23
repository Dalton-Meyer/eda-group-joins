-- 1. Get all customers and their addresses
SELECT * FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
-- 2. Get all orders and their line items
SELECT "orders", "products"."description", "line_items"."quantity"
FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "products"."id" = "line_items"."product_id"
-- 3. Which warehouses have cheetos
SELECT "warehouse"."warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" iLIKE '%Cheeto%' AND "warehouse_product"."on_hand" !=0
-- 4. Which warehouses have diet pepsi
SELECT "warehouse"."warehouse"
FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi' AND "warehouse_product"."on_hand" !=0

-- 5. Get the number of orders for each customer.
SELECT "customers"."first_name", count(orders) FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "customers"."first_name"
-- 6. How many customers do we have
SELECT count("customers") FROM "customers"
-- 7. How many products do we carry
SELECT count("products") FROM "products"
-- 8. What is the total available on-hand quantity of diet pepsi
SELECT sum(warehouse_product.on_hand) FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi'

--stretch
--how much was the toal cost for each order
