SET SEARCH_PATH TO projectschema;
\COPY NPCs from NPC_final.csv with csv;
\COPY Discipline from discipline_final.csv with csv;

DROP TABLE IF EXISTS ath_ori CASCADE;
DROP TABLE IF EXISTS coach_ori CASCADE;
DROP TABLE IF EXISTS medal_ori CASCADE;
DROP TABLE IF EXISTS team_ori CASCADE;

CREATE TABLE ath_ori (
  athleteName TEXT,
  country TEXT NOT NULL,
  countryCode TEXT NOT NULL,
  sport TEXT,
  sportCode TEXT NOT NULL,
  dateOfBirth DATE NOT NULL,
  gendar TEXT NOT NULL,
  PRIMARY KEY (athleteName, sport)
);

\COPY ath_ori from athletes_final.csv with csv;

insert into Athletes
(SELECT athleteName, countryCode, sport, dateOfBirth, gendar FROM ath_ori, NPCs WHERE countryCode = nameCode);

CREATE TABLE team_ori (
  teamName TEXT,
  country TEXT NOT NULL,
  countryCode TEXT NOT NULL,
  sport TEXT,
  sportCode TEXT NOT NULL,
  event TEXT,
  PRIMARY KEY (teamName, sport, event)
);

\COPY team_ori from team_final.csv with csv;

insert into Teams
(SELECT teamName, countryCode, sport, event FROM team_ori, NPCs WHERE countryCode = nameCode);

CREATE TABLE coach_ori (
  coachName TEXT,
  country TEXT NOT NULL,
  countryCode TEXT NOT NULL,
  sport TEXT,
  sportCode TEXT NOT NULL,
  event TEXT,
  PRIMARY KEY (coachName, sport, event)
);

\COPY coach_ori from coach_final.csv with csv;

insert into Coaches
(SELECT coachName, countryCode, sport, event FROM coach_ori, NPCs WHERE countryCode = nameCode);

CREATE TABLE medal_ori (
  country TEXT NOT NULL,
  countryCode TEXT NOT NULL,
  name TEXT NOT NULL,
  sport TEXT,
  sportCode TEXT NOT NULL,
  event TEXT,
  medal TEXT,
  PRIMARY KEY (name, sport, event, medal)
);

\COPY medal_ori from medal_final.csv with csv;

insert into Medals
(SELECT countryCode, name, sport, event, medal FROM medal_ori);



