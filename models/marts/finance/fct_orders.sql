WITH stripe_payments AS (

   SELECT *
   FROM {{ ref('stg_stripe__payments') }}

),

orders AS (

   SELECT *
   FROM {{ ref('stg_jaffle_shop__orders') }}

),

stripe_payments_success AS (

   SELECT
      order_id,
      SUM(CASE WHEN status = 'success' THEN amount END) AS amount
   FROM stripe_payments
   GROUP BY 1

),

final AS (

   SELECT
      o.order_id,
      o.customer_id,
      sps.amount,
      o.order_date
   FROM orders AS o
   LEFT JOIN stripe_payments_success AS sps ON o.order_id = sps.order_id
)

SELECT * FROM final
