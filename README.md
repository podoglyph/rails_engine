# README

This project exposes sales data via a JSON API using Rails 5.1.1, PostgreSQL, and Ruby 2.4.1.

Project Setup

To try the project yourself:

  * Create a directory on your machine for this project and `cd` into it

  * Clone this repo
  
  * `cd rails_engine`

  * Run `bundle`

  * Run `rails db:create`, `rails db:migrate`, and then `bundle exec rake import` to seed the database

  * Start your rails server and navigate to `localhost:3000`

**Running Spec Harness**

 * navigate to `/rales_engine_spec_harness` in a seperate terminal tab
 * run `rails s` on the `/rails_engine` folder in the first terminal tab
 * run `rake` on the `/rales_engine_spec_harness` folder in new terminal tab

**Exposing the Data**

**Relationship Endpoints**

**Merchants**

`GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant

`GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant

**Invoices**

`GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions

`GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items

`GET /api/v1/invoices/:id/items` returns a collection of associated items

`GET /api/v1/invoices/:id/customer` returns the associated customer

`GET /api/v1/invoices/:id/merchant` returns the associated merchant

**Invoice Items**

`GET /api/v1/invoice_items/:id/invoice` returns the associated invoice

`GET /api/v1/invoice_items/:id/item` returns the associated item

**Items**

`GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items

`GET /api/v1/items/:id/merchant` returns the associated merchant

**Transactions**

`GET /api/v1/transactions/:id/invoice` returns the associated invoice

**Customers**

`GET /api/v1/customers/:id/invoices` returns a collection of associated invoices

`GET /api/v1/customers/:id/transactions` returns a collection of associated transactions

**Business Intelligence Endpoints**

**All Merchants**

`GET /api/v1/merchants/most_revenue?quantity=x` returns the top x merchants ranked by total revenue

`GET /api/v1/merchants/most_items?quantity=x` returns the top x merchants ranked by total number of items sold

`GET /api/v1/merchants/revenue?date=x` returns the total revenue for date x across all merchants
Assume the dates provided match the format of a standard ActiveRecord timestamp.

**Single Merchant**

`GET /api/v1/merchants/:id/revenue returns` the total revenue for that merchant across all transactions

`GET /api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date x

`GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.

**BOSS MODE**
`GET /api/v1/merchants/:id/customers_with_pending_invoice` returns a collection of customers which have pending (unpaid) invoices.

**Items**

`GET /api/v1/items/most_revenue?quantity=x` returns the top x items ranked by total revenue generated

`GET /api/v1/items/most_items?quantity=x` returns the top x item instances ranked by total number sold

`GET /api/v1/items/:id/best_day` returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

**Customers**

`GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions
