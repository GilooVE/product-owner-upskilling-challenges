---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
select * from sites;

-- Get all sites sorted by name
select * from sites order by name;

-- Gett all activity names sorted by name
select name from activities order by name;

-- Get all "Sport" activities
select * from activities where category = 'Sport';
-- Expected result: 8 rows

-- Get all Escape Games in Nantes
select * from activities where category ='Adventure' and city = 'Nantes' and name like '%Escape Game%';
-- Expected result: 3 rows

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
select count(*) from activities;
-- Expected result: 44

-- Count all "Adventure" activities
select count(*) from activities where category ='Adventure';
-- Expected result: 13

-- Count the number of activities per category
select count(*) from activities group by category;
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Cultural    6
-- Food        6
-- Sport       8
-- Visits      5
-- Workshops   6

-- Get the 3 category names with the biggest number of activities
select count(*) as total
from activities
group by category
order by total desc limit 3;
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Sport       8
-- Cultural    6

---------------------------------------
-- [JOINS]
---------------------------------------
-- Get all employee names working from site ile de Nantes sorted by first name
select employees.first_name, employees.last_name
from employees
inner join sites on sites.id=employees.site_id
where sites.city = 'Nantes'
order by employees.last_name;
-- Expected result: 53 rows

-- Get all the activity names where you have been to, sorted by name
select activities.name
from activities
inner join team_building_sessions on team_building_sessions.activity_id = activities.id
left outer join participations on participations.team_building_session_id = team_building_sessions.id
inner join employees on employees.id = participations.employee_id
where employees.last_name = 'Van Elslande'
order by activities.name
-- Expected result: well, it depends on who you are :)

-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
select distinct teams.name
from teams
left outer join team_building_sessions on team_building_sessions.team_id = teams.id
left outer join activities on activities.id = team_building_sessions.activity_id
where activities.category='Adventure'
order by teams.name ;
-- Expected result:
-- name
-- --------------------
-- Business Development
-- Product Owner
-- R&D

-- Get the team names and total number of team building sessions done, sorted by top teams
select teams.name, count(team_building_sessions.id) as total_sessions
from teams
inner join team_building_sessions on team_building_sessions.team_id=teams.id
group by teams.name
order by total_sessions desc

-- Expected result:
-- name        total_sessions
-- ----------  --------------
-- R&D         7
-- Marketing   4
-- Business D  3
-- Product Ow  3
-- Finance &   2
-- UI / UX     2
-- Customer S  1

-- Get all the employee names, team names and site names that have never attended a team building session
select employees.first_name, employees.last_name, teams.name as team, sites.name as site, team_building_sessions.id
from employees
left join teams on teams.id = employees.team_id
left join team_building_sessions on team_building_sessions.team_id = teams.id
left join sites on sites.id = employees.site_id
where team_building_sessions.id is Null

-- Expected result:
-- first_name  last_name   team        site
-- ----------  ----------  ----------  -----------
-- Harmony     Florin      Channels    Paris 13ème
-- Julia       Ivanets     Channels    Paris 13ème
-- Pierre      Pellan      Channels    Paris 13ème

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to leASt expensive
select teams.name, sum(team_building_sessions.price) as total_price
from team_building_sessions
inner join teams on teams.id = team_building_sessions.team_id
group by teams.id
order by total_price desc

-- Expected result:
-- name          total_price
-- ------------  -----------
-- Finance & RH  1620
-- Business Dev  1446
-- R&D           1140
-- Marketing     445
-- Customer Suc  360
-- Product Owne  267
-- UI / UX       240

-- Get the site names and total number of team building sessions done, sorted by top sites
select sites.name, count(distinct team_building_sessions.date) as total_sessions
from sites
left outer join employees on employees.site_id = sites.id
left outer join participations on participations.employee_id = employees.id
left outer join team_building_sessions on team_building_sessions.id = participations.team_building_session_id
group by sites.name
order by total_sessions desc

-- Expected result:
-- name           total_sessions
-- -------------  --------------
-- Ile de Nantes  12
-- Paris 13ème    10
