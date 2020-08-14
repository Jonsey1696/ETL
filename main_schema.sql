-- Create the fixed_players where we drop the 'FC' in club column
Create table fixed_players as
	select *, 
		case 
			when club like '%FC%' then substring(club,4) else club end as club_shorten
	from players;
-- Create fixed_matches where we drop the 'FC' in 'winner' and 'loser'
create table fixed_matches as
	select date,winner,loser,
		case
		when winner like '%FC%' then substring(winner,1,length(winner)-3) else winner end as winner_shorten,
		case
		when loser like '%FC%' then substring(loser,1,length(loser)-3) else loser end as loser_shorten
	from new_matches;
-- Create a fixed_clubs table
create table fixed_clubs as 
	select *, 
		case 
			when club_name like '%FC%' then substring(club_name,1,length(club_name)-3) else club_name end as club_shorten
	from clubs;
	
-- Create team_rating table, where we sum up the player_rating for each team
CREATE TABLE team_rating as
SELECT fc.club_shorten,sum(fp.rating) as team_rating
FROM fixed_clubs as fc,
	fixed_players as fp
where fc.club_shorten=fp.club_shorten	
group by fc.club_shorten;

-- Create a view table 'rating_table' to test out our hypothesis.
create view rating_table as	
	select fm.date,fm.winner_shorten, fm.loser_shorten, tr_w.team_rating as winner_rating, tr_l.team_rating as loser_rating 
	from fixed_matches as fm 
	inner join team_rating as tr_w
	on fm.winner_shorten = tr_w.club_shorten
	inner join team_rating as tr_l
	on fm.loser_shorten = tr_l.club_shorten;


