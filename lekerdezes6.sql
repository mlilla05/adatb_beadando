SELECT DISTINCT u.vezeteknev + ' ' + u.keresztnev AS 'Ügyfél neve',
    	COUNT(*) OVER(PARTITION BY u.ugyfel_ID) AS 'Foglalások száma',
    	SUM(CAST(sz.ar_Ft AS INT)) OVER(PARTITION BY u.ugyfel_ID) AS 'Fizetett összeg'
FROM ugyfel u JOIN foglalas fog ON u.ugyfel_ID = fog.ugyfel_ID
				JOIN fizetes fiz ON fog.fizetes_id = fiz.fizetes_id
                JOIN szolgaltatas sz ON fog.szolgaltatas_ID = sz.szolgaltatas_ID
ORDER BY 3 DESC
