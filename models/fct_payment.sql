with 

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payment') }}

),

payment_amt as (

    select
        customer_id,
        order_id,
        amount
    from orders
    inner join payments using (order_id)
)

select *
from payment_amt