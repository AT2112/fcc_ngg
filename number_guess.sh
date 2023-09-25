#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

MAIN() {
    echo 'Enter your username:'
    read LOGIN

    USERNAME=$($PSQL "SELECT username FROM users WHERE username='$LOGIN';")

    if [[ -z $USERNAME ]]
    then
        REGISTRATION
    else
        GREETING
        GAME
    fi
}

REGISTRATION() {
    USERNAME=$LOGIN
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 0);")
    GAME
}

GREETING() {
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME';")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
}

GAME() {
    MIN=1
    MAX=1000
    RANGE=$((MAX - MIN + 1))
    RANDOM_NUMBER=$((RANDOM % RANGE + MIN))
    echo "Guess the secret number between 1 and 1000:"
    GUESS_COUNT=1
    while [ $GUESS!=$RANDOM_NUMBER ]
    do
        read GUESS
        if [[ ! $GUESS =~ ^[0-9]+$ ]]
        then
            echo 'That is not an integer, guess again:'
        else
            if [[ $GUESS > $RANDOM_NUMBER ]]
            then
                ((GUESS_COUNT++))
                echo "It's lower than that, guess again:"

            elif [[ $GUESS < $RANDOM_NUMBER ]]
            then
                ((GUESS_COUNT++))
                echo "It's higher than that, guess again:"
            else
                echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
                break
            fi
        fi
    done

    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME';")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME';")
    
    if [[ -z $BEST_GAME ]]
    then
        BEST_GAME=$($PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE username = '$USERNAME';")
    else
        if [[ $GUESS_COUNT < $BEST_GAME ]]
        then
            UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE username = '$USERNAME';")
        fi
    fi
}

MAIN
