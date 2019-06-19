select *
from orders           
where odate <'20160906' AND ordid NOT IN (Select ordid From details)
;
