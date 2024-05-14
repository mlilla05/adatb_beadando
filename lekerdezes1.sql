SELECT IIF(GROUPING_ID(f.fizetesi_eszkoz) = 1, 'Végösszeg', f.fizetesi_eszkoz) AS 'Fizetési eszköz',
        COUNT(*) AS 'Db',
        SUM(CAST(sz.ar_Ft AS INT)) AS 'Összeg (Ft)'
FROM fizetes f JOIN foglalas fog ON fog.fizetes_ID = f.fizetes_ID
                JOIN szolgaltatas sz ON sz.szolgaltatas_ID = fog.szolgaltatas_ID
GROUP by ROLLUP(f.fizetesi_eszkoz)
