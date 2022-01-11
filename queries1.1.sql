SELECT rank, rankbytotal, nameCode, count(athleteName) FROM NPCs, Athletes
WHERE countryCode = nameCode and rank < 20
GROUP BY nameCode
ORDER BY count(athleteName) DESC;
