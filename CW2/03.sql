select invid
from invoices,orders,details,products          
where invoices.ordid = orders.ordid AND orders.ordid=details.ordid AND products.pcode=details.pcode
group by orders.ordid,invid
having invoices.amount/sum(qty*price) >1.18 AND invoices.amount/sum(qty*price)<1.22
;
