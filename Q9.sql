DELIMITER //

CREATE PROCEDURE displaySupplierDetails()
BEGIN
	select report.supp_id, report.supp_name, report.Average,
    case
		when report.Average=5 then 'Excellent Service'
        when report.Average>4 then 'Good Service'
        when report.Average>2 then 'Average Service'
        else 'Poor Service'
	end as Type_Of_Service from(
		select final.supp_id, supplier.supp_name, final.Average from (
			select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from (
				select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing
                inner join (
					select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `order`
                    inner join rating on rating.`ord_id`=`order`.ord_id
                ) as test on test.pricing_id=supplier_pricing.pricing_id
            ) as test2 group by supplier_pricing.supp_id
        ) as final
        inner join supplier where final.supp_id=supplier.supp_id
    ) as report
END //

DELIMITER ;