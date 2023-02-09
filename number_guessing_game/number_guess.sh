#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align -t -c"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "insert into users(name) values('$USERNAME')")
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
else
  MIN_GUESS_NUMBER=$($PSQL "select min(played_number) from games where user_id=$USER_ID")
  GAMES_PLAYED_NUMBER=$($PSQL "select count(*) from games where user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED_NUMBER games, and your best game took $MIN_GUESS_NUMBER guesses."
fi

SECRET_NUMBER=$(($RANDOM % 1000 + 1))
echo "Guess the secret number between 1 and 1000: "

PLAYED_NUMBER=0

while read GUESS_NUMBER
do
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS_NUMBER > $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS_NUMBER < $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    PLAYED_NUMBER=$((PLAYED_NUMBER+1))
    break
  fi
  PLAYED_NUMBER=$((PLAYED_NUMBER+1))
done

echo "You guessed it in $PLAYED_NUMBER tries. The secret number was $SECRET_NUMBER. Nice job!"
INSERT_GAME_RESULT=$($PSQL "insert into games(user_id, played_number) values($USER_ID, $PLAYED_NUMBER)")
