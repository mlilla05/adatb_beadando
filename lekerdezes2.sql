SELECT DISTINCT TOP 1 f.vezeteknev + ' ' + f.keresztnev AS 'Fodrász neve',
                (SUM(CAST(sz.idotartam_perc AS INT)) OVER(PARTITION BY f.fodrasz_ID)) / 60 AS 'Munkaidő órában'
FROM foglalas fog JOIN fodrasz f ON fog.fodrasz_ID = f.fodrasz_ID
					JOIN szolgaltatas sz ON fog.szolgaltatas_ID = sz.szolgaltatas_ID
ORDER BY 2 DESC
