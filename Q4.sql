# Q4
# Display all the orders along with product name ordered by a customer having Customer_Id=2

select ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID, (
	select PRO_NAME from product where PRO_ID = (
		select PRO_ID from supplier_pricing 
        where PRICING_ID = ord.PRICING_ID
    )
) as Product_Name from `order` as ord 
where CUS_ID = 2;