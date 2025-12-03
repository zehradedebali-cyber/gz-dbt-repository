SELECT  s.date_date,
        s.pdt_id as product_id,
        CAST (p.purchSE_PRICE as FLOAT64) as purchase_price,
        s.orders_id,
        s. quantity,
        s. revenue
        CAST (p.purchSE_PRICE as FLOAT64)*quantity as purchase_cost,
        revenue-(CAST (p.purchSE_PRICE as FLOAT64)*quantity) as margin
FROM {{ref("stg_raw__sales")}} as s
left join {{ref("stg_raw__product")}} as p
on s.pdt_id = p.products_id
