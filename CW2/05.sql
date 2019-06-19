select L.custid, count(distinct L.Co), cast(sum(Su)/count(distinct L.Co)as decimal(18,2))
FROM (
SELECT C.custid, O.ordid as Co, sum(P.price*D.qty) as Su
from customers C, orders O, details D, products P
where C.custid = O.ocust and D.ordid = O.ordid and P.pcode = D.pcode
group by C.custid, O.ordid

union
select C.custid, O.ordid as Co,0 as Su
from customers C, orders O
where C.custid = O.ocust and (O.ordid NOT IN(select distinct ordid from details))
) 
as L
group by L.custid

union
select custid, 0, NULL
from customers
where custid not in (select ocust from orders)
;
