select custid, cname, odate
from customers C,(select max(odate) AS odate, ocust  from orders group by ocust) AS O
where custid = ocust
;
