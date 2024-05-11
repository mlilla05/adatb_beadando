SELECT DISTINCT TOP 1 f.vezetéknév + ' ' + f.keresztnév AS 'Fodrász neve',
                (SUM(CAST(sz.időtartam_perc AS INT)) OVER(PARTITION BY f.fodrász_id)) / 60 AS 'Munkaidő órában'
FROM foglalas fog JOIN fodrasz f ON fog.fodrász_id = f.fodrász_id
					JOIN szolgaltatas sz ON fog.szolgáltatás_id = sz.szolgáltatás_id
ORDER BY 2 DESC