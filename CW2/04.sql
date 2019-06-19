SELECT L2.ptype, L2.custid

FROM
(SELECT L.ptype, MAX(L.S)as M
FROM (select products.ptype, customers.custid, sum(qty) as S
from products,customers,orders,details
where orders.ocust = customers.custid AND orders.ordid = details.ordid AND details.pcode = products.pcode
group by products.ptype, customers.custid) AS L
group by L.ptype)as L1,

(select products.ptype, customers.custid, sum(qty) as S
from products,customers,orders,details
where orders.ocust = customers.custid AND orders.ordid = details.ordid AND details.pcode = products.pcode
group by products.ptype, customers.custid) AS L2

where L2.S=L1.M and L2.ptype=L1.ptype
;
