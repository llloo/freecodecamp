#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # if arg is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_INFO=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements left join properties using(atomic_number) left join types using(type_id) where elements.atomic_number=$1")
  else
    ELEMENT_INFO=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements left join properties using(atomic_number) left join types using(type_id) where elements.symbol='$1' or elements.name='$1'")
  fi

  if [[ ! -z $ELEMENT_INFO ]]
  then
    echo "$ELEMENT_INFO" | while read ACOMIC_NUMBER BAR ELEMENT_NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS
    do
      echo "The element with atomic number $ACOMIC_NUMBER is $ELEMENT_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  else
    echo "I could not find that element in the database."
  fi
fi
