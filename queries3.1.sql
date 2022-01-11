SELECT g1.rank, g1.rankbytotal, g1.nameCode, ytotal/ototal as agedivide
FROM (SELECT rank, rankbytotal, nameCode, count(athleteName) as ytotal FROM NPCs, Athletes WHERE nameCode = countryCode and dateOfBirth > '1990-01-01' GROUP BY nameCode) as g1, (SELECT rank, rankbytotal, nameCode, count(athleteName) as ototal FROM NPCs, Athletes WHERE 
nameCode = countryCode and dateOfBirth < '1990-01-01' GROUP BY nameCode) as g2
WHERE g1.rank < 20 and g1.rank = g2.rank;
