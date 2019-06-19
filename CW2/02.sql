select ptype, cast(sum(qty)/CAST(count(distinct orders.ordid) as float) as decimal(18,2))
From orders,details,products
where orders.ordid=details.ordid AND products.pcode=details.pcode Group by ptype
; 
