select
    s.date_date,
    s.products_id,
    p.purchase_price,
    s.orders_id,
    s.quantity,
    s.revenue,
    round (p.purchase_price * quantity, 2) as purchase_cost,
    round (revenue - (p.purchase_price * quantity), 2) as margin
from {{ ref("stg_raw__sales") }} as s
left join {{ ref("stg_raw__product") }} as p using (products_id)
