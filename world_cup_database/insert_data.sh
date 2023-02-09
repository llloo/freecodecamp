#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "truncate games, teams;")"

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    # get winner id
    winner_id=$($PSQL "select team_id from teams where name='$winner'")
    # if not found
    if [[ -z $winner_id ]]
    then
      # insert into teams
      insert_winner_result=$($PSQL "insert into teams(name) values('$winner')")
      if [[ $insert_winner_result == "INSERT 0 1" ]]
      then
        winner_id=$($PSQL "select team_id from teams where name='$winner'")
        echo inserted winner team: $winner, $winner_id
      fi
    fi

    # get opponent id
    opponent_id=$($PSQL "select team_id from teams where name='$opponent'")
    # if not found
    if [[ -z $opponent_id ]]
    then
      # insert into teams
      insert_opponent_result=$($PSQL "insert into teams(name) values('$opponent')")
      if [[ $insert_opponent_result == "INSERT 0 1" ]]
      then
        opponent_id=$($PSQL "select team_id from teams where name='$opponent'")
        echo inserted opponent team: $opponent, $opponent_id
      fi
    fi

    insert_game_result=$($PSQL "insert into games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) values($year, '$round', $winner_goals, $opponent_goals, $winner_id, $opponent_id)")
    if [[ $insert_game_result == "INSERT 0 1" ]]
    then
      echo inserted game.
    fi
  fi
done
