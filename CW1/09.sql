select C.country, count(O.ordid) as numbers
from customers C, (Select * From orders where odate<'20161231' AND odate>'20160101')O
where C.custid = O.ocust
group by C.country
having count(O.ordid)>0
;
