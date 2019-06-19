select *
from customers
where custid not in(select ocust from orders where odate<'20161231' AND odate>'20160101')
;
