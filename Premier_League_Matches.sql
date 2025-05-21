Create database football;
use football;

select * from matches;

ALTER TABLE matches
DROP COLUMN `*Additional Stats`;

Alter table matches
change column `Home Team` Home_Team varchar(100);

Alter table matches
change column `Away Team` Away_Team varchar(100);

select * from matches;

# 1. How many times each result type (Home win, Away win, Draw) occurred in the matches?

select result ,count(*) Count_of_Victory 
from matches
group by result;

# 2. Which three matches had the highest attendance?

select Home_Team, Away_Team, attendance
from matches
order by attendance desc
limit 3;

# 3. What is the total number of goals scored by each team as both home and away teams?

SELECT home_team AS team, SUM(homescore) AS goals
FROM matches
GROUP BY home_team

UNION ALL

SELECT away_team AS team, SUM(awayscore) AS goals
FROM matches
GROUP BY away_team;

# 4. Which matches had a significant difference (greater than 1) between actual goals and expected goals (xG) for either the home or away team?

select homescore, homexg, awayscore, awayxg
from matches
where abs(homescore - homexg) > 1 or 
abs(awayscore - awayxg) > 1;

# 5. Which referees have officiated the most matches, and how many matches has each referee officiated?

select referee, count(*) No_of_matches from matches
group by referee
order by no_of_matches desc;

# 6. Which stadiums have hosted the most matches, and how many matches were played at each stadium?

select stadium, count(*) No_of_matches from matches
group by stadium
order by No_of_matches desc;

# 7. In which years from 2022 to 2025 were the most Home matches won, and how many away wins occurred in each year?

select  year(date) match_year,count(*) No_of_wins 
from matches
where result = 'H' and year(date) in(2022,2023,2024,2025) 
group by  match_year
order by no_of_wins desc;

# 8. In which years from 2022 to 2025 were the most away matches won, and how many away wins occurred in each year?

select year(date) match_year, count(*) No_of_wins
from matches
where result = 'A' and year(date) in (2022,2023,2024,2025)
group by match_year
order by no_of_wins desc;

# 9. Which teams have the highest average home score, and what is the average home score for each team?

select home_team,avg(homescore) Avg_Score 
from matches
group by home_team
order by avg_score desc;

# 10. "Which teams have the highest average away score, and what is the average away score for each team?

select away_team, avg(awayscore) Avg_score 
from matches
group by away_team
order by avg_score desc;