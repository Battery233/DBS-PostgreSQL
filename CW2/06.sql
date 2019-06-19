SELECT l1.ptype, count(distinct L2.ordid)
from (SELECT O.ordid,P.ptype FROM products P, orders O,details D where O.ordid = D.ordid and P.pcode = D.pcode) as l1, (select O.ordid from products P, orders O,details D where O.ordid = D.ordid and P.pcode = D.pcode group by O.ordid having count(distinct P.ptype) = 1) as l2
where l1.ordid = l2.ordid
group by l1.ptype
;
