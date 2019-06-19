select O.ordid, O.odate, sum(D.qty*P.price)as price
from orders O, details D, products P
where O.ordid = D.ordid AND D.pcode = P.pcode AND O.ordid NOT IN (select ordid from invoices)
group by O.ordid
;
