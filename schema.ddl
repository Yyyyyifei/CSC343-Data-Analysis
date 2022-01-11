drop schema if exists projectschema cascade;
create schema projectschema;
set search_path to projectschema;

--a tuple in this relation represent an National Paralympic Committee’s(NPCs) which participate in the Olympic.
--rank is the rank of number of gold metal of this country. name is the name of NPCS, nameCode is the official code for each NPCs. gold, silver, bronze, total present the gold,
--silver, bronze, total medal winning fot this country, rankByTotal is the rank by total number of medal.
CREATE TABLE NPCs (
  rank INT NOT NULL,
  name TEXT NOT NULL,
  nameCode TEXT,
  gode INT NOT NULL,
  silver INT NOT NULL,
  bronze INT NOT NULL,
  total INT NOT NULL,
  rankByTotal INT NOT NULL,
  PRIMARY KEY (nameCode)
);

--a tuple in this relation represent a sport discipline. disciplineName is its name,
--male is the number of male athletes for this discipline, female is the number of
--female athletes for this discipline, total is the add of male and female.
CREATE TABLE Discipline (
  disciplineName TEXT,
  female INT NOT NULL,
  male INT NOT NULL,
  total INT NOT NULL,
  PRIMARY KEY (disciplineName)
);

--a tuple in this relation represent an athlete of a sport event. athleteName is his/her name,
--countryCode is the name code for him/her NPCs. sport is the sports he/she participate in.
--dateOfBirth is his/her date of birth. gender is his/her gender.
CREATE TABLE Athletes (
  athleteName TEXT,
  countryCode TEXT NOT NULL,
  sport TEXT,
  dateOfBirth DATE NOT NULL,
  gendar TEXT NOT NULL,
  PRIMARY KEY (athleteName, sport),
  FOREIGN KEY (countryCode) REFERENCES NPCs(nameCode),
  FOREIGN KEY (sport) REFERENCES Discipline(disciplineName)
);

--a tuple in this relation represent a team of a sport event. teamName is its name,
--countryCode is the name code for its NPCs. sport is the sports they participate in.
--event is the specific event of a sport they participate in.
CREATE TABLE Teams (
  teamName TEXT,
  countryCode TEXT NOT NULL,
  sport TEXT,
  event TEXT,
  PRIMARY KEY (teamName, sport, event),
  FOREIGN KEY (countryCode) REFERENCES NPCs(nameCode),
  FOREIGN KEY (sport) REFERENCES Discipline(disciplineName)
);

--a tuple in this relation represent a coach of a sport event. coachName is his/her name,
--countryCode is the name code for him/her NPCs. sport is the sports he/she participate in.
--event is the specific event of a sport he/she participate in.
CREATE TABLE Coaches (
  coachName TEXT,
  countryCode TEXT NOT NULL,
  sport TEXT,
  event TEXT,
  PRIMARY KEY (coachName, sport, event),
  FOREIGN KEY (countryCode) REFERENCES NPCs(nameCode),
  FOREIGN KEY (sport) REFERENCES Discipline(disciplineName)
);

--a tuple in this relation represent a medal of a sport event.  sport is the sports this medal belong.
--event is the specific event of a sport this medal belong, medal is the sort for this medal,
--name is the name of athlete or team who win the medal,
--countryCode is the country code of athlete or team who win the medal.
CREATE TABLE Medals (
  countryCode TEXT NOT NULL,
  name TEXT NOT NULL,
  sport TEXT,
  event TEXT,
  medal TEXT,
  PRIMARY KEY (name, sport, event, medal),
  FOREIGN KEY (countryCode) REFERENCES NPCs(nameCode),
  FOREIGN KEY (sport) REFERENCES Discipline(disciplineName)
);



