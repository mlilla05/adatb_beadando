SELECT DISTINCT u.vezetéknév + ' ' + u.keresztnév AS 'Ügyfél neve',
    	COUNT(*) OVER(PARTITION BY u.ügyfél_id) AS 'Foglalások száma',
    	SUM(CAST(sz.ár_Ft AS INT)) OVER(PARTITION BY u.ügyfél_id) AS 'Fizetett összeg'
FROM ugyfel u JOIN foglalas fog ON u.ügyfél_id = fog.ügyfél_id
				JOIN fizetes fiz ON fog.fizetés_id = fiz.fizetés_id
                JOIN szolgaltatas sz ON fog.szolgáltatás_id = sz.szolgáltatás_id
ORDER BY 3 DESC
