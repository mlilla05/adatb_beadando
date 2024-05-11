SELECT DISTINCT u.vezetéknév + ' ' + u.keresztnév AS 'Ügyfél neve',
        sz.szolgáltatás_neve AS 'Szolgáltatás'
FROM foglalas fog JOIN ugyfel u ON fog.ügyfél_id = u.ügyfél_id
                    JOIN szolgaltatas sz ON fog.szolgáltatás_id = sz.szolgáltatás_id
WHERE sz.ár_Ft = (
                        SELECT MIN(CAST(ár_Ft AS INT))
                        FROM szolgaltatas
                    )
