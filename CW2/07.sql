select custid
from customers
where custid not in (select distinct C.custid
FROM customers C, orders O,details D, products P
where C.custid=O.ocust and O.ordid = D.ordid and D.pcode = P.pcode and P.ptype = 'BOOK' and O.odate>'20151231' and O.odate<'20170101')
;
