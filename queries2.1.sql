SELECT g1.rank, g1.rankbytotal, g1.nameCode, maletotal/femaletotal as gendardivide
FROM (SELECT rank, rankbytotal, nameCode, count(athleteName) as maletotal FROM NPCs, Athletes WHERE nameCode = countryCode and gendar = 'Male' GROUP BY nameCode) as g1, (SELECT rank, rankbytotal, nameCode, count(athleteName) as femaletotal FROM NPCs, Athletes WHERE 
nameCode = countryCode and gendar = 'Female' GROUP BY nameCode) as g2
WHERE g1.rank < 20 and g1.rank = g2.rank;
