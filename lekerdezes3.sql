SELECT fog.foglalás_id AS 'Foglalás azonosító',
        fog.fodrász_id AS 'Fodrász azonosító',
        f.vezetéknév + ' ' + f.keresztnév AS 'Fodrász neve',
        SUM(CAST(sz.időtartam_perc AS INT)) 
        OVER(PARTITION BY fog.fodrász_id ORDER BY fog.foglalás_id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
        AS 'Munkaidő percben'
FROM foglalas fog JOIN fodrasz f ON fog.fodrász_id = f.fodrász_id
                    JOIN szolgaltatas sz ON fog.szolgáltatás_id = sz.szolgáltatás_id
WHERE (f.vezetéknév + ' ' + f.keresztnév) = 'Kiss Eszter'