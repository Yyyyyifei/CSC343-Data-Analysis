SELECT rank, rankbytotal, nameCode, count(coachName) FROM NPCs, Coaches
WHERE countryCode = nameCode and rank < 20
GROUP BY nameCode
ORDER BY count(coachName) DESC;
