select P.pcode, sum(D.qty) as quantity
from products P, Details D
where P.pcode = D.pcode
group by P.pcode
having sum(D.qty)>10
;
