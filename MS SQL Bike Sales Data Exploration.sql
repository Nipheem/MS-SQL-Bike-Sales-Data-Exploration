SELECT
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name) AS customer_name,
	cus.city,
	cus.state,
	ord.order_date,
	SUM(itm.quantity) AS total_units,
	SUM(itm.quantity* itm.list_price) AS revenue,
	pro.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name) AS sales_rep
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items itm
On ord.order_id = itm.order_id
JOIN production.products pro
ON pro.product_id = itm.product_id
JOIN production.categories cat
ON pro.category_id = cat.category_id
JOIN production.brands bra
ON bra.brand_id = pro.brand_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON sta.staff_id = ord.staff_id
GROUP BY 
ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name)
