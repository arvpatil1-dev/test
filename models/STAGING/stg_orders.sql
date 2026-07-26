with source as (
    select * from {{ source('raw', 'ORDERS') }}
), 

renamed as (
    select
        order_id as o_id,
        customer_id as cus_id,
        order_date,
        order_status,
        total_amount
    from source
    where order_status = 'Shipped'
)

select * from renamed