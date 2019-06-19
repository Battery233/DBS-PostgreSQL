select P.pcode, P.price
from products P, Details D
where P.pcode = D.pcode
group by P.pcode
having avg(D.qty)>=8
;
