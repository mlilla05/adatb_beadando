SELECT DISTINCT u.vezeteknev + ' ' + u.keresztnev AS 'Ügyfél neve',
        sz.szolgaltatas_neve AS 'Szolgáltatás'
FROM foglalas fog JOIN ugyfel u ON fog.ugyfel_ID = u.ugyfel_ID
                    JOIN szolgaltatas sz ON fog.szolgaltatas_ID = sz.szolgaltatas_ID
WHERE sz.ar_Ft = (
                        SELECT MIN(CAST(ar_Ft AS INT))
                        FROM szolgaltatas
                    )
