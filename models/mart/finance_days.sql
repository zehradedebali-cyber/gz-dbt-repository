select 
        date_date,
        count (DISTINCT orders_id) as cnt_orders,
        round(sum (revenue),2) as total_revenue,
        round(SUM(revenue) / COUNT(DISTINCT orders_id),2) AS average_basket,
        round(sum(margin),2) as total_margin,
        round(sum(operational_margin),2) as total_op_margin,
        round(sum(purchase_cost),2) as total_purchase_cost,
        round(sum(shipping_fee),2) as total_shipping_fee,
        round(sum(ship_cost),2) as total_ship_cost,
        round(sum(logcost),2) as total_logcost,
        round(sum(quantity),2) as total_quantity

from {{ref("int_orders_operational")}}
group by date_date
order by date_date desc