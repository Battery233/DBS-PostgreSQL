select P.invid, sum(P.amount)-I.amount as reinmurse
from invoices I, payments P
where I.invid = P.invid
group by P.invid, I.amount
having sum(P.amount)>I.amount
;
