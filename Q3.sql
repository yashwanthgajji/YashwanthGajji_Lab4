#Q3
#Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

SELECT COUNT(CUS_ID) AS Number_Of_Customers, CUS_GENDER FROM (
	SELECT CUS_ID, CUS_GENDER FROM customer WHERE CUS_ID IN (
		SELECT CUS_ID FROM `order` where ORD_AMOUNT >= 3000
	)
) AS cusgender 
GROUP BY CUS_GENDER;