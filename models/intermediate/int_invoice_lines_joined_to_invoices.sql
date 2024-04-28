with invoiceline as(
    select *
    from {{ ref('stg_music__invoiceline') }}
),

invoice as (
    select *
    from {{ ref('stg_music__invoice') }}
)

select
    invoiceline.invoice_lineid,
    invoiceline.invoice_id,
    invoiceline.track_id,
    invoice.customer_id,
    invoice.invoice_date_est,
    invoice.billing_address,
    invoice.billing_city,
    invoice.billing_state,
    invoice.billing_country,
    invoice.billing_zipcode,
    invoiceline.quantity_purchased,
    invoiceline.invoice_lineitem_revenue_usd
from invoiceline
    left join invoice 
        on invoiceline.invoice_id=invoice.invoice_id