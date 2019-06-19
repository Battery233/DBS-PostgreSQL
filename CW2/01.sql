select distinct C.country, COALESCE(L.CountryCount,0)
From customers C left join (select C.country, count(C.country) as CountryCount from customers C, orders O where O.ocust=C.custid AND O.odate<'20170101' AND O.odate >'20151231'
group by C.country) AS L on C.country = L.country
;
