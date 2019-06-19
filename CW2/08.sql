select C.custid, cast(sum(D.qty*P.price)as decimal(18,2))
from customers C, orders O, details D, products P
where C.custid = O.ocust and O.ordid = D.ordid and D.pcode = P.pcode and O.odate>'20151231' and O.odate<'20160701' and P.ptype='MUSIC'
group by C.custid
having sum(D.qty*P.price)<50
union
select custid,cast(0 as decimal(18,2))
from customers
where custid not in (select distinct C.custid
FROM customers C, orders O,details D, products P
where C.custid=O.ocust and O.ordid = D.ordid and D.pcode = P.pcode and P.ptype = 'MUSIC' and O.odate>'20151231' and O.odate<'20160701')
;
