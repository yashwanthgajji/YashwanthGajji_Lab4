# Q7
# Display the Id and Name of the Product ordered after “2021-10-05”.
SELECT PRO_ID, PRO_NAME FROM product WHERE PRO_ID IN (
	SELECT PRO_ID FROM supplier_pricing WHERE PRICING_ID IN (
		SELECT PRICING_ID FROM `order` WHERE ORD_DATE > '2021-10-05'
	)
);