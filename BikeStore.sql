select o.order_id,
CONCAT(c.first_name,' ',c.last_name) as Name,
c.city,
c.state,
o.order_date,
sum(oi.quantity) as total_units,
sum(oi.quantity * oi.list_price) as revenue,
p.product_name,
pc.category_name,
ss.store_name,
concat(s.first_name,' ' ,s.last_name) as sales_rep 
from sales.customers c,
sales.orders o,
sales.order_items oi,
production.products p,
production.categories pc,
sales.stores ss,
sales.staffs s
where c.customer_id=o.customer_id and
 o.order_id = oi.order_id and
  p.product_id = oi.product_id and 
  pc.category_id = p.category_id and
  ss.store_id=o.store_id and 
  s.staff_id=o.staff_id
group by
 o.order_id,
 CONCAT(c.first_name,' ',c.last_name),
 c.city,c.state,
 o.order_date,
p.product_name,
pc.category_name,
ss.store_name,
concat(s.first_name,' ' ,s.last_name) 
