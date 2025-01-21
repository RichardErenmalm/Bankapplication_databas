--Hämtar alla konton av en specifik kund: 
SELECT Konton.Konto_ID, Konton.Kontonamn, Konton.Kontotyp, Konton.Saldo
FROM Konton
JOIN Kunder ON Konton.Kund_ID = Kunder.Kund_ID
WHERE Kunder.Kund_ID = 14;

--Resultat: 8	
--Anna Svensson Sparkonto	Sparkonto	1000.00
--17	Sara Lindqvist Lönekonto	Lönekonto	2300.00
--26	Malin Bergström Lönekonto	Lönekonto	2500.00




--Beräkna det totala saldot på alla konton för en kund.
SELECT SUM(Konton.Saldo) AS TotaltSaldo
FROM Konton
JOIN Kunder ON Konton.Kund_ID = Kunder.Kund_ID
WHERE Kunder.Kund_ID = 14;


--Resultat
--5800.00


--Visa alla transaktioner för ett specifikt konto.
select * from Transaktioner where Konto_ID = 14;


--Resultat:
--11	14	500.00	2025-01-07 13:10:00.000	Insättning
--31	14	150.00	2025-01-27 08:15:00.000	Insättning
--51	14	100.00	2025-02-17 16:30:00.000	Insättning




--Hitta de tre konton med högst saldo
SELECT TOP 3 Konto_ID, Kontonamn, Saldo
FROM Konton
ORDER BY Saldo DESC;


--Resultat:
--18	Anna Svensson Lönekonto	5000.00
--24	Karin Gustafsson Lönekonto	4000.00
--19	Erik Johansson Sparkonto	3000.00




--Beräkna det totala beloppet av insättningar och uttag för ett specifikt konto.
SELECT 
    SUM(CASE WHEN Transaktionstyp = 'Insättning' THEN Belopp ELSE 0 END) AS TotaltInsatt,
    SUM(CASE WHEN Transaktionstyp = 'Uttag' THEN Belopp ELSE 0 END) AS TotaltUttaget
FROM Transaktioner
WHERE Konto_ID = 14;


--Resultat: 
--Totalt insatt: 750.00	 Totalt uttaget: 0.00


--Hitta alla transaktioner som gjorts de senaste 30 dagarna.
SELECT Transaktions_ID, Konto_ID, Belopp, Tid, Transaktionstyp
FROM Transaktioner
WHERE Tid >= DATEADD(DAY, -30, GETDATE());


--Resultat: 
--5	8	200.00	2025-01-01 10:00:00.000	Insättning
--6	9	300.00	2025-01-02 14:00:00.000	Uttag
--7	10	150.00	2025-01-03 12:00:00.000	Insättning
--8	11	100.00	2025-01-04 16:30:00.000	Uttag
--9	12	50.00	2025-01-05 09:45:00.000	Insättning
--10	13	250.00	2025-01-06 11:20:00.000	Uttag
--11	14	500.00	2025-01-07 13:10:00.000	Insättning
--12	15	300.00	2025-01-08 15:55:00.000	Uttag
--13	16	200.00	2025-01-09 17:00:00.000	Insättning
--14	17	400.00	2025-01-10 14:30:00.000	Uttag
--15	18	100.00	2025-01-11 12:00:00.000	Insättning
--16	19	200.00	2025-01-12 13:15:00.000	Uttag
--17	20	100.00	2025-01-13 09:00:00.000	Insättning
--18	21	150.00	2025-01-14 10:10:00.000	Uttag
--19	22	50.00	2025-01-15 11:50:00.000	Insättning
--20	23	200.00	2025-01-16 12:30:00.000	Uttag
--21	24	100.00	2025-01-17 08:00:00.000	Insättning
--22	25	250.00	2025-01-18 17:00:00.000	Uttag
--23	26	200.00	2025-01-19 10:20:00.000	Insättning
--24	27	300.00	2025-01-20 14:40:00.000	Uttag
--25	8	50.00	2025-01-21 16:00:00.000	Insättning
--26	9	100.00	2025-01-22 13:30:00.000	Uttag
--27	10	200.00	2025-01-23 10:10:00.000	Insättning
--28	11	150.00	2025-01-24 15:25:00.000	Uttag
--29	12	300.00	2025-01-25 11:45:00.000	Insättning
--30	13	50.00	2025-01-26 09:30:00.000	Uttag
--31	14	150.00	2025-01-27 08:15:00.000	Insättning
--32	15	200.00	2025-01-28 17:00:00.000	Uttag
--33	16	100.00	2025-01-29 12:00:00.000	Insättning
--34	17	400.00	2025-01-30 10:30:00.000	Uttag
--35	18	250.00	2025-02-01 09:15:00.000	Insättning
--36	19	500.00	2025-02-02 14:00:00.000	Uttag
--37	20	150.00	2025-02-03 13:45:00.000	Insättning
--38	21	300.00	2025-02-04 10:00:00.000	Uttag
--39	22	200.00	2025-02-05 17:30:00.000	Insättning
--40	23	100.00	2025-02-06 08:45:00.000	Uttag
--41	24	200.00	2025-02-07 12:30:00.000	Insättning
--42	25	150.00	2025-02-08 14:00:00.000	Uttag
--43	26	250.00	2025-02-09 10:00:00.000	Insättning
--44	27	50.00	2025-02-10 13:15:00.000	Uttag
--45	8	150.00	2025-02-11 12:45:00.000	Insättning
--46	9	200.00	2025-02-12 11:00:00.000	Uttag
--47	10	300.00	2025-02-13 15:00:00.000	Insättning
--48	11	50.00	2025-02-14 13:30:00.000	Uttag
--49	12	400.00	2025-02-15 09:00:00.000	Insättning
--50	13	150.00	2025-02-16 14:20:00.000	Uttag
--51	14	100.00	2025-02-17 16:30:00.000	Insättning
--52	15	300.00	2025-02-18 13:10:00.000	Uttag