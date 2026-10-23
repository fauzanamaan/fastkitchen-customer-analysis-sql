# FastKitchen Customer Analysis

SQL analysis of a takeout restaurant's orders and customer accounts, comparing registered customers with guest customers.

**Queries:** [sql/queries.sql](sql/queries.sql) · **Full completed document:** [project-pdf/fastkitchen-customer-analysis.pdf](project-pdf/fastkitchen-customer-analysis.pdf)

This is a milestone project from the Global Career Accelerator program. The scenario and data come from the program. FastKitchen is fictional, and the PDF describes the data as constructed, not real.

## Context

The scenario is a data contractor helping a new fast-food restaurant understand its customers. Some customers have accounts and others check out as guests, so the analysis has to combine orders with account details without losing guest orders.

## Data

- `fastkitchen.orders`: one row per order, with order type (onsite, online carryout or online delivery), subtotal, tip, total, and a user id that is blank for guest customers.
- `fastkitchen.users`: one row per registered account, with city, state and zip code.

## Tools and skills

- SQL: `AVG` and `ROUND`, `GROUP BY` on one and two columns
- `IS NULL` and `IS NOT NULL` to split registered and guest orders
- `LEFT JOIN` to keep every order, including guest orders
- Common table expressions (`WITH`)

## Approach

1. Calculated the average order total, then compared averages by order type.
2. Counted orders from registered users and from guests.
3. Counted registered users by city, then by city and zip code.
4. Joined orders to users with a `LEFT JOIN` and ranked spending by user and zip code.
5. Calculated the average order total per zip code.

## Key findings

- **The average order total is $22.22.**
- **Order types are similar.** Carryout gets the highest tips, and delivery has the highest subtotal and total.
- **Guests placed more orders than registered users:** 2,088 against 1,932.
- **Allen has the most registered users (212)**, spread over several zip codes.
- **Among registered users, the top spender is in zip code 63222.**
- **3 zip codes have a higher average order total than guest customers.**
- **Guests likely skip accounts for a faster checkout.** Rewards or sign-up benefits, and a quicker way to log in, could turn more guests into registered users.

## Running the queries

The queries cannot be re-run outside the program. The data exists only in the Global Career Accelerator SQL app, and this repo does not include it.

`sql/queries.sql` holds the queries exactly as written in the completed document, in order, each labeled with its task. Task 1E was a written answer.

## Repo structure

```
fastkitchen-customer-analysis-sql/
├── sql/
│   └── queries.sql                          the queries, labeled by task
└── project-pdf/
    └── fastkitchen-customer-analysis.pdf    full completed document with written answers
```
