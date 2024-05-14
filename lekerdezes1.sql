SELECT IIF(GROUPING_ID(f.fizetesi_eszkoz) = 1, 'Végösszeg', f.fizetesi_eszkoz) AS 'Fizetési eszköz',
        COUNT(*) AS 'Db',
        SUM(CAST(sz.ar_Ft AS INT)) AS 'Összeg (Ft)'
FROM fizetes f JOIN foglalas fog ON fog.fizetes_id = f.fizetes_id
                JOIN szolgaltatas sz ON sz.szolgaltatas_id = fog.szolgaltatas_id
GROUP by ROLLUP(f.fizetesi_eszkoz)
