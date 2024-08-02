-- TABLE
CREATE TABLE contact_request(
 id_email serial primary key,
 id_country integer not null,
 id_priority integer not null,
 name varchar (50) not null,
 detail varchar (100) not null,
 physical_address varchar (100) not null,
 foreign key (id_country) references countries (id_country),
 foreign key (id_priority) references priorities (id_priority)
);
CREATE TABLE countries(
  id_country serial primary key,
  name varchar(50) not null  
);
CREATE TABLE customers(
 id_customer serial primary key,
 email varchar (50) NOT null,
 id_country integer not null,
 id_role integer not null,
 name varchar (50) not null,
 age varchar (10) not null,
 password varchar (50) not null,
 physical_address varchar (100) not null,
 foreign key (id_country) references countries (id_country),
 foreign key (id_role) references roles (id_role)
);
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE discounts(
  id_discount serial primary key,
  status varchar(100) not null,
  percentage DECIMAL(5,2) DEFAULT 21.00
);
CREATE TABLE invoices(
  id_invoice serial primary key,
  id_customer integer not null,
  id_payment integer not null,
  id_invoice_status integer not null,
  DATE varchar (50) not null,
  total_to_pay varchar (50) not null,
  foreign key (id_customer) references customers (id_customer),
  foreign key (id_payment) references payments (id_payment),
  foreign key (id_invoice_status) references invoice_status (id_invoice_status)
);
CREATE TABLE invoice_status(
  id_invoice_status serial primary key,
  status varchar(50) not null  
);
CREATE TABLE offers(
  id_offer serial primary key,
  status varchar(100) not null  
);
CREATE TABLE orders(
  id_order serial primary key,
  id_invoice integer not null,
  id_product integer not null,
  detail varchar (50) not null,
  amount integer not null,
  price integer not null,
  foreign key (id_invoice) references invoices (id_invoice),
  foreign key (id_product) references products (id_product)
);
CREATE TABLE payments(
  id_payment serial primary key,
  type varchar(50) not null  
);
CREATE TABLE priorities(
  id_priority serial primary key,
  type_name varchar(50) not null  
);
CREATE TABLE products(
 id_product serial primary key,
 id_discount integer not null,
 id_offer integer not null,
 id_tax integer not null,
 name varchar (50) not null,
 detail varchar (50) not null,
 minimum_stock varchar (50) not null,
 maximun_stock varchar (100) not null,
 current_stock varchar (100) not null,
 price varchar (50) not null,
 price_with_tax varchar (50) not null,
 foreign key (id_discount) references discounts (id_discount),
 foreign key (id_offer) references offers (id_offer),
 foreign key (id_tax) references taxes (id_tax)
);
CREATE TABLE products_customers(
  id_product integer not null,
  id_customer integer not null,
  foreign key (id_product) references products (id_product),
  foreign key (id_customer) references customers (id_customer)
);
CREATE TABLE roles(
  id_role serial primary key,
  name varchar(50) not null  
);
CREATE TABLE taxes(
  id_tax serial primary key,
  percentage DECIMAL(5,2) DEFAULT 21.00
);
CREATE TABLE users(
 id_users serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country)   
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
