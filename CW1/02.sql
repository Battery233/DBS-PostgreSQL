select I.invid,I.issued, O.ordid, O.odate
from Invoices I, Orders O
where I.ordid = O.ordid AND I.issued<O.odate
;
