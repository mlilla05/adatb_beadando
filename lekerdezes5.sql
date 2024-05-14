SELECT sz.szolgaltatas_neve AS 'Szolgáltatás neve'
FROM szolgaltatas sz LEFT JOIN foglalas f ON sz.szolgaltatas_ID = f.szolgaltatas_ID
WHERE f.szolgaltatas_ID IS NULL 

