-- 1. List the names of all NFL teams'
SELECT name FROM teams;
--          name         
-- ----------------------
--  Buffalo Bills
--  Miami Dolphins
--  New England Patriots
--  New York Jets
--  Baltimore Ravens
--  Cincinnati Bengals
--  Cleveland Browns
--  Pittsburgh Steelers
--  Houston Texans
--  Indianapolis Colts
--  Jacksonville Jaguars
--  Tennessee Titans
--  Denver Broncos
--  Kansas City Chiefs
--  Oakland Raiders
--  San Diego Chargers
--  Dallas Cowboys
--  New York Giants
--  Philadelphia Eagles
--  Washington Redskins
--  Chicago Bears
--  Detroit Lions
--  Green Bay Packers
--  Minnesota Vikings
--  Atlanta Falcons
--  Carolina Panthers
--  New Orleans Saints
--  Tampa Bay Buccaneers
--  Arizona Cardinals
--  St. Louis Rams
--  San Francisco 49ers
--  Seattle Seahawks

-- 2. List the stadium name and head coach of all NFC teams

SELECT stadium, head_coach
FROM teams
WHERE conference = 'AFC';

--         stadium         |   head_coach   
-- ------------------------+----------------
--  Ralph Wilson Stadium   | Doug Marrone
--  Sun Life Stadium       | Joe Philbin
--  Gillette Stadium       | Bill Belichick
--  MetLife Stadium        | Rex Ryan
--  M&T Bank Stadium       | John Harbaugh
--  Paul Brown Stadium     | Marvin Lewis
--  FirstEnergy Stadium    | Mike Pettine
--  Heinz Field            | Mike Tomlin
--  NRG Stadium            | Bill OBrien
--  Lucas Oil Stadium      | Chuck Pagano
--  EverBank Field         | Gus Bradley
--  LP Field               | Ken Whisenhunt
--  Sports Authority Field | John Fox
--  Arrowhead Stadium      | Andy Reid
--  O.co Coliseum          | Tony Sparano
--  Qualcomm Stadium       | Mike McCoy

-- 3. List the head coaches of the AFC South

SELECT head_coach
FROM teams
WHERE conference = 'AFC'
	AND division = 'South';

--    head_coach   
-- ----------------
--  Bill OBrien
--  Chuck Pagano
--  Gus Bradley
--  Ken Whisenhunt


-- 4. The total number of players in the NFL

 SELECT count(id)  FROM players;

--  count 
-- -------
--   1532

-- 5. The team names and head coaches of the NFC North and AFC East

SELECT name, head_coach
FROM teams
WHERE 
	(conference = 'AFC' AND division = 'South')
	OR
	(conference = 'NFC' AND division = 'North');

--          name         |   head_coach   
-- ----------------------+----------------
--  Houston Texans       | Bill OBrien
--  Indianapolis Colts   | Chuck Pagano
--  Jacksonville Jaguars | Gus Bradley
--  Tennessee Titans     | Ken Whisenhunt
--  Chicago Bears        | Marc Trestman
--  Detroit Lions        | Jim Caldwell
--  Green Bay Packers    | Mike McCarthy
--  Minnesota Vikings    | Mike Zimmer


-- 6. The 50 players with the highest salaries

SELECT * FROM players
ORDER BY salary DESC 
LIMIT 50;

--   id  |          name           | position |  salary  | team_id 
-- ------+-------------------------+----------+----------+---------
--  2121 | Peyton Manning          | QB       | 18000000 |      13
--  2787 | Drew Brees              | QB       | 15760000 |      27
--  1966 | Dwight Freeney          | DE       | 14035000 |      10
--  2122 | Elvis Dumervil          | DE       | 14000000 |      13
--  2402 | Michael Vick            | QB       | 12500000 |      19
--  2922 | Sam Bradford            | QB       | 12000000 |      30
--  2641 | Jared Allen             | DE       | 11619850 |      24
--  2687 | Matt Ryan               | QB       | 11500000 |      25
--  2553 | Matthew Stafford        | QB       | 11500000 |      22
--  2179 | Tamba Hali              | DE       | 11250000 |      14
--  1592 | Jake Long               | T        | 11200000 |       2
--  2403 | Nnamdi Asomugha         | CB       | 11000000 |      19
--  2454 | Trent Williams          | T        | 11000000 |      20
--  2830 | Vincent Jackson         | WR       | 11000000 |      28
--  2554 | Cliff Avril             | DE       | 10600000 |      22
--  2880 | Calais Campbell         | DE       | 10600000 |      29
--  1821 | Joe Thomas              | T        | 10500000 |       7
--  2688 | Brent Grimes            | CB       | 10431000 |      25
--  1967 | Peyton Manning (buyout) | QB       | 10400000 |      10
--  2923 | Chris Long              | DE       | 10310000 |      30
--  2263 | Philip Rivers           | QB       | 10200000 |      16
--  2924 | Jason Smith             | T        | 10000000 |      30
--  1695 | David Harris            | LB       |  9900000 |       4
--  1636 | Wes Welker              | WR       |  9515000 |       3
--  2831 | Davin Joseph            | G        |  9500000 |      28
--  2180 | Dwayne Bowe             | WR       |  9443000 |      14
--  2404 | Asante Samuel           | CB       |  9400000 |      19
--  2505 | Brandon Marshall        | WR       |  9300000 |      21
--  2555 | Ndamukong Suh           | DT       |  9250000 |      22
--  2305 | Tony Romo               | QB       |  9000000 |      17
--  2506 | Julius Peppers          | DE       |  8900000 |      21
--  2306 | Anthony Spencer         | LB       |  8800000 |      17
--  1593 | Karlos Dansby           | LB       |  8800000 |       2
--  2733 | Jordan Gross            | T        |  8500000 |      26
--  2181 | Tyson Jackson           | DE       |  8005000 |      14
--  2642 | Adrian Peterson         | RB       |  8000000 |      24
--  2123 | Champ Bailey            | CB       |  8000000 |      13
--  2073 | Chris Johnson           | RB       |  8000000 |      12
--  2589 | Aaron Rodgers           | QB       |  8000000 |      23
--  2405 | Jason Peters            | T        |  7900000 |      19
--  2832 | Eric Wright             | CB       |  7750000 |      28
--  2734 | Steve Smith             | WR       |  7750000 |      26
--  1696 | Santonio Holmes         | WR       |  7750000 |       4
--  2507 | Jay Cutler              | QB       |  7700000 |      21
--  2508 | Matt Forte              | RB       |  7700000 |      21
--  1749 | Ray Rice                | RB       |  7700000 |       5
--  2509 | Brian Urlacher          | LB       |  7500000 |      21
--  1921 | Johnathan Joseph        | CB       |  7250000 |       9
--  1968 | Gary Brackett           | LB       |  7200000 |      10
--  1750 | Ed Reed                 | S        |  7200000 |       5

-- 7. The average salary of all NFL players

SELECT avg(salary)
FROM players;

--          avg          
-- ----------------------
--  1579692.539817232376

-- 8. The names and positions of players with a salary above 10_000_000

SELECT name, position, salary
FROM players
WHERE salary > 10000000
ORDER BY salary DESC;

--           name           | position |  salary  
-- -------------------------+----------+----------
--  Peyton Manning          | QB       | 18000000
--  Drew Brees              | QB       | 15760000
--  Dwight Freeney          | DE       | 14035000
--  Elvis Dumervil          | DE       | 14000000
--  Michael Vick            | QB       | 12500000
--  Sam Bradford            | QB       | 12000000
--  Jared Allen             | DE       | 11619850
--  Matthew Stafford        | QB       | 11500000
--  Matt Ryan               | QB       | 11500000
--  Tamba Hali              | DE       | 11250000
--  Jake Long               | T        | 11200000
--  Trent Williams          | T        | 11000000
--  Nnamdi Asomugha         | CB       | 11000000
--  Vincent Jackson         | WR       | 11000000
--  Cliff Avril             | DE       | 10600000
--  Calais Campbell         | DE       | 10600000
--  Joe Thomas              | T        | 10500000
--  Brent Grimes            | CB       | 10431000
--  Peyton Manning (buyout) | QB       | 10400000
--  Chris Long              | DE       | 10310000
--  Philip Rivers           | QB       | 10200000

-- 9. The player with the highest salary in the NFL

SELECT name, salary
FROM players
WHERE salary = (
	SELECT max(salary)
	FROM players
);

--       name      |  salary  
-- ----------------+----------
--  Peyton Manning | 18000000


-- 10. The name and position of the first 100 players with the lowest salaries

SELECT name, position
FROM players
ORDER BY salary ASC 
LIMIT 100;

--           name          | position 
-- ------------------------+----------
--  Phillip Dillard        | 
--  Eric Kettani           | RB
--  Austin Sylvester       | RB
--  Greg Orton             | WR
--  Jerrod Johnson         | QB
--  McLeod Bethel-Thompson | QB
--  Jonathan Crompton      | QB
--  Travon Bellamy         | CB
--  Caleb King             | RB
--  Mike Mohamed           | LB
--  Kyle Nelson            | LS
--  John Malecki           | G
--  Nathan Bussey          | LB
--  Robert James           | LB
--  Markell Carter         | DE
--  Aaron Lavarias         | DT
--  Mark Dell              | WR
--  Ronald Johnson         | WR
--  Doug Worthington       | DT
--  Derrick Jones          | WR
--  Sealver Siliga         | DT
--  Chase Beeler           | C
--  Kenny Wiggins          | T
--  Konrad Reuland         | TE
--  Michael Wilhoite       | LB
--  Garrett Chisolm        | G
--  Juamorris Stewart      | WR
--  Chad Spann             | RB
--  Trevis Turner          | T
--  Justin Medlock         | KR
--  Armon Binns            | WR
--  Derek Hall             | T
--  Shaky Smithson         | WR
--  Armando Allen          | RB
--  DAndre Goodwin         | WR
--  Jeremy Beal            | DE
--  Brett Brackett         | TE
--  Shaun Draughn          | RB
--  John Clay              | RB
--  Tristan Davis          | RB
--  Curtis Holcomb         | CB
--  Jimmy Young            | WR
--  Kevin Cone             | WR
--  Cory Nelms             | CB
--  Ben Guidugli           | TE
--  David Gilreath         | WR
--  Dontavia Bogan         | WR
--  Joe Hastings           | WR
--  Marshall McFadden      | LB
--  Kade Weston            | DT
--  Kyle Hix               | T
--  Mark LeGree            | S
--  Mike Hartline          | QB
--  Jameson Konz           | WR
--  Tyler Beiler           | 
--  Mike Blanc             | DT
--  Corbin Bryant          | DT
--  Michael Jasper         | DT
--  Mike Rivera            | LB
--  Pat Devlin             | QB
--  Jerome Messam          | RB
--  Jamie McCoy            | TE
--  Lestar Jean            | WR
--  Malcolm Williams       | CB
--  Ricky Sapp             | DE
--  Rashad Carmichael      | CB
--  Alex Silvestro         | DT
--  Adam Weber             | QB
--  Adam Grant             | T
--  Jammie Kirlew          | DE
--  Joe Reitz              | T
--  Brandon Browner        | CB
--  Jeff Byers             | C
--  Jed Collins            | TE
--  Aaron Berry            | CB
--  Logan Payne            | WR
--  Marcus Sherels         | CB
--  T.J. Conley            | PR
--  Cameron Sheffield      | LB
--  Kyle Bosworth          | LB
--  Garrett McIntyre       | DT
--  John Estes             | C
--  Thomas Austin          | G
--  Emmanuel Stephens      | DT
--  Markus White           | DE
--  Ricardo Matthews       | DT
--  Quinten Lawrence       | WR
--  Bilal Powell           | RB
--  Taylor Boggs           | C
--  Kamar Aiken            | WR
--  Dexter Jackson         | WR
--  Justin Rogers          | CB
--  Johnny White           | RB
--  Eron Riley             | WR
--  Tracy Wilson           | CB
--  DaNorris Searcy        | S
--  Chris White            | LB
--  Sterling Moore         | CB
--  Chris Hairston         | T
--  Andrew Hawkins         | WR


-- 11. The average salary for a DE in the nfl

SELECT avg(salary)
FROM players
WHERE position = 'DE';

--          avg          
-- ----------------------
--  2161326.377049180328


-- 12. The names of all the players on the Buffalo Bills

SELECT name 
FROM players
WHERE team_id = (
	SELECT id 
	FROM teams 
	WHERE name = 'Buffalo Bills');

--         name        
-- --------------------
--  Mario Williams
--  Drayton Florence
--  Shawne Merriman
--  Dwan Edwards
--  Chris Kelsay
--  Kyle Williams
--  Nick Barnett
--  Spencer Johnson
--  Ryan Fitzpatrick
--  Steve Johnson
--  Tyler Thigpen
--  Lee Evans (Buyout)
--  Brad Smith
--  Fred Jackson
--  Scott Chandler
--  George Wilson
--  Erik Pears
--  Leodis McKelvin
--  Brian Moorman
--  Terrence McGee
--  Marcell Dareus
--  Chad Rinehart
--  Kraig Urbik
--  Rian Lindell
--  Kirk Morrison
--  Corey McIntyre
--  C.J. Spiller
--  Garrison Sanborn
--  Eric Wood
--  Lionel Dotson
--  Ruvell Martin
--  Andy Levitre
--  Jairus Byrd
--  Jarron Gilbert
--  Kyle Moore
--  Aaron Williams
--  Donald Jones
--  Fendi Onobun
--  Kellen Heard
--  Mike Caussin
--  Naaman Roosevelt
--  Alex Carrington
--  Arthur Moats
--  Colin Brown
--  Cordaro Howard
--  Dan Batten
--  David Nelson
--  Marcus Easley
--  Sam Young
--  Torell Troup
--  Kelvin Sheppard
--  Lee Smith
--  Chris Hairston
--  Chris White
--  DaNorris Searcy
--  Johnny White
--  Justin Rogers
--  Kamar Aiken
--  Michael Jasper


-- 13. The total salary of all players on the New York Giants
SELECT avg(salary) 
FROM players
WHERE team_id = (
	SELECT id 
	FROM teams 
	WHERE name = 'New York Giants');

--          avg          
-- ----------------------
--  1483589.320000000000


-- 14. The player with the lowest salary on the Green Bay Packers

SELECT name
FROM players
WHERE team_id = (
	SELECT id 
	FROM teams 
	WHERE name = 'Green Bay Packers')
ORDER BY salary ASC
LIMIT 1;

--       name      
-- ----------------
--  Shaky Smithson