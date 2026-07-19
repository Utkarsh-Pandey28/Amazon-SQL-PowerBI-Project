-- schema started 


-- 1. CATEGORY
CREATE TABLE amazon.category (
    category_id     INT PRIMARY KEY,
    category_name   VARCHAR(50) NOT NULL
);
 
-- 2. SELLER
CREATE TABLE amazon.seller (
    seller_id       INT PRIMARY KEY,
    seller_name     VARCHAR(100) NOT NULL,
    origin          VARCHAR(50) NOT NULL
);
 
-- 3. PRODUCT
CREATE TABLE amazon.product (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(150) NOT NULL,
    price           DECIMAL(10,2) NOT NULL,
    category_id     INT NOT NULL,
    cogs            DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);
 
-- 4. CUSTOMER
CREATE TABLE amazon.customer (
    customer_id     INT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    state           VARCHAR(50) NOT NULL
);
 
-- 5. ORDERS
CREATE TABLE amazon.orders (
    order_id        INT PRIMARY KEY,
    order_date      DATE NOT NULL,
    customer_id     INT NOT NULL,
    seller_id       INT NOT NULL,
    order_status    VARCHAR(20) NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_orders_seller   FOREIGN KEY (seller_id)   REFERENCES seller(seller_id)
);
 
-- 6. ORDER_ITEMS
CREATE TABLE amazon.order_items (
    order_item_id   INT PRIMARY KEY,
    order_id        INT NOT NULL,
    product_id      INT NOT NULL,
    quantity        INT NOT NULL,
    price_per_unit  DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orderitems_order   FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    CONSTRAINT fk_orderitems_product FOREIGN KEY (product_id) REFERENCES product(product_id)
);
 
-- 7. SHIPPING
CREATE TABLE amazon.shipping (
    shipping_id         INT PRIMARY KEY,
    order_id            INT NOT NULL UNIQUE,
    shipping_date       DATE NOT NULL,
    shipping_providers  VARCHAR(50) NOT NULL,
    delivery_status     VARCHAR(20) NOT NULL,
    CONSTRAINT fk_shipping_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
 
-- 8. PAYMENTS
CREATE TABLE amazon.payments (
    payment_id      INT PRIMARY KEY,
    order_id        INT NOT NULL UNIQUE,
    payment_date    DATE NOT NULL,
    payment_status  VARCHAR(20) NOT NULL,
    CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
 
-- 9. INVENTORY
CREATE TABLE amazon.inventory (
    inventory_id    INT PRIMARY KEY,
    product_id      INT NOT NULL UNIQUE,
    stock           INT NOT NULL,
    warehouse_id    INT NOT NULL,
    last_stock_date DATE NOT NULL,
    CONSTRAINT fk_inventory_product FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- schema ended

