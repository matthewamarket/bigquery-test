with payments as (

    select
        id as payment_id,
        order_id,
        paymentmethod as payment_method,
        status,
        amount,
        created as payment_date

    from `dbt-tutorial`.jaffle_shop.payment
)

select
*
from payments