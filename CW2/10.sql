select L.custid
from(
select C.custid, min (O2.odate-O1.odate) as DUA
from customers C, orders O1, orders O2
where C.custid = O1.ocust and C.custid = O2.ocust and O2.odate>O1.odate
group by C.custid, O1.odate
) as L
group by L.custid
having count(DUA)>3 and cast(sum(DUA) as decimal(18,2))/count(DUA)<30
;
