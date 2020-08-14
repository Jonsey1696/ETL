# Extract - Transform - Load Project

## Group members:
+ Steven White
+ Ryan Jones
+ Phu Phan

## Tools we used:
+ Jupyter notebook: for script editing.
+ Pandas, Python: for creating DataFrame and importing data.
+ PostgreSQL: for storing and querying data.

## Project Objective:

Hypothesis:
If a team is made up of players with high ratings; that team should win more in each match.

Based on the hypothesis, we found the data from two sources : GitHub and Kaggle. We looked at English Premier League matches during 2018.  Using the player database, we were able to sum up the player ratings for all teams, and then join the player data and the match data to assign team ratings to the winning team and the losing team.

## Extract/Load

We used Pandas to read in the URL for the clubs and matches dataset. We cleaned up and create the DataFrame for each dataset : club_df, matches_df and players_df.  Using pandas we had to take score which was a list of dictionaries and break them into two individual columns team 1 score and team 2 score.  From that we were able to identify the winning team and the losing team.

We used jupyter notebook to load the dataframes into a database in PGAdmin.  We used Postgres because we wanted a relational database where we could join tables on team name.

Once in PGAdmin, we used queries to create a team rating based on the sum of each player on every team.  We also joined the team ratings with the matches table to determine the team rating of the winning team and the losing team.

After finising the extracting and transforming the data, we load them into PostgreSQL database, so we can query out the desired data, to test our hypothesis.


In order to run the queries, do the following steps:

1. Create soccer database in PGAdmin
2. Run the player_list.ipynb
3. Run the etl_project.ipynb  (remember to put in your own postgrestgres password) 
4. run the main_schema.sql



## Data Sources:
- Clubs and matches data source:
https://github.com/openfootball/football.json
- Players data source:
https://www.kaggle.com/antoinekrajnc/soccer-players-statistics/data




