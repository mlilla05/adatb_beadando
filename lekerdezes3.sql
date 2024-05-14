SELECT fog.foglalas_ID AS 'Foglalás azonosító',
        fog.fodrasz_ID AS 'Fodrász azonosító',
        f.vezeteknev + ' ' + f.keresztnev AS 'Fodrász neve',
        SUM(CAST(sz.idotartam_perc AS INT)) 
        OVER(PARTITION BY fog.fodrasz_ID ORDER BY fog.foglalas_ID RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
        AS 'Munkaidő percben'
FROM foglalas fog JOIN fodrasz f ON fog.fodrasz_ID = f.fodrasz_ID
                    JOIN szolgaltatas sz ON fog.szolgaltatas_ID = sz.szolgaltatas_ID
WHERE (f.vezeteknev + ' ' + f.keresztnev) = 'Kiss Eszter'
