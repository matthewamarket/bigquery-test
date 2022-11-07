with payments as (

    select
        id as payment_id,
        orderid,
        paymentmethod as payment_method,
        status,
        amount,
        created as payment_date

    from `dbt-tutorial`.stripe.payment
)

select
*
from payments