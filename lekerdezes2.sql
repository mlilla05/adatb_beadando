SELECT DISTINCT TOP 1 f.vezeteknev + ' ' + f.keresztnev AS 'Fodrász neve',
                (SUM(CAST(sz.idotartam_perc AS INT)) OVER(PARTITION BY f.fodrasz_id)) / 60 AS 'Munkaidő órában'
FROM foglalas fog JOIN fodrasz f ON fog.fodrasz_id = f.fodrasz_id
					JOIN szolgaltatas sz ON fog.szolgaltatas_id = sz.szolgaltatas_id
ORDER BY 2 DESC
