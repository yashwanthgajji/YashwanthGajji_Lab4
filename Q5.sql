# Q5
# Display the Supplier details who can supply more than one product.

SELECT * FROM supplier WHERE SUPP_ID IN (
	SELECT SUPP_ID FROM supplier_pricing
    group by SUPP_ID
    having count(PRO_ID)>1
);