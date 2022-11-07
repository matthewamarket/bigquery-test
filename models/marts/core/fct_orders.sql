with customers as (

    select * from {{ ref('stg_customers')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

payments as (

    select * from {{ref('stg_payments')}}

),

final as (

    select
        orders.order_id,
        customers.customer_id,
        sum(payments.amount) as amount
    from orders
    left join customer using (customer_id)
    left join payments using (order_id)
    group by 1,2

)

select * from final