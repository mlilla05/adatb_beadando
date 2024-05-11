SELECT IIF(GROUPING_ID(f.fizetési_eszköz) = 1, 'Végösszeg', f.fizetési_eszköz) AS 'Fizetési eszköz',
        COUNT(*) AS 'Db',
        SUM(CAST(sz.ár_Ft AS INT)) AS 'Összeg (Ft)'
FROM fizetes f JOIN foglalas fog ON fog.fizetés_id = f.fizetés_id
                JOIN szolgaltatas sz ON sz.szolgáltatás_id = fog.szolgáltatás_id
GROUP by ROLLUP(f.fizetési_eszköz)
