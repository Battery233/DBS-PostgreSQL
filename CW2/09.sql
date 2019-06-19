select L.custid, max(DUA)
from (
select C.custid, min (O2.odate-O1.odate) as DUA
from customers C, orders O1, orders O2
where C.custid = O1.ocust and C.custid = O2.ocust and O2.odate>O1.odate
group by C.custid, O1.odate
)
as L
group by L.custid
union
select C.custid, 0
from customers C, orders O1, orders O2
where C.custid = O1.ocust and C.custid = O2.ocust
group by C.custid
having max(O1.odate-O2.odate)=0
;
