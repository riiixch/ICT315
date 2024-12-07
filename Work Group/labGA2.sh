#!/bin/bash

draw_card() {
    local suits=("Hearts" "Diamonds" "Clubs" "Spades")
    local values=("2" "3" "4" "5" "6" "7" "8" "9" "10" "J" "Q" "K" "A")
    local suit=${suits[$RANDOM % ${#suits[@]}]}
    local value=${values[$RANDOM % ${#values[@]}]}
    echo "$value"
}

calculate_score() {
    local score=0
    local ace_count=0
    for card in "$@"; do
        case $card in
            "J" | "Q" | "K") score=$((score + 10)) ;;
            "A") ace_count=$((ace_count + 1)) ;;
            *) score=$((score + card)) ;;
        esac
    done

    for ((i=0; i<ace_count; i++)); do
        if ((score <= 10)); then
            score=$((score + 10))
        else
            score=$((score + 1))
        fi
    done
    echo $score
}

show_hand() {
    echo "Your hand: $*"
}

play_blackjack() {
    echo "Welcome to Black Jack!"

    player_cards=($(draw_card) $(draw_card))
    dealer_cards=($(draw_card) $(draw_card))

    show_hand "${player_cards[@]}"
    player_score=$(calculate_score "${player_cards[@]}")
    echo "Your score: $player_score"

    echo "Dealer's hand: ${dealer_cards[0]} and [Hidden]"

    while ((player_score < 21)); do
        read -p "Do you want to (H)it or (S)tand? " action
        if [[ $action == "H" || $action == "h" ]]; then
            card=$(draw_card)
            player_cards+=("$card")
            echo "You drew: $card"
            player_score=$(calculate_score "${player_cards[@]}")
            show_hand "${player_cards[@]}"
            echo "Your score: $player_score"
        elif [[ $action == "S" || $action == "s" ]]; then
            break
        else
            echo "Invalid choice, please choose (H)it or (S)tand."
        fi
    done

    if ((player_score > 21)); then
        echo "You busted with $player_score. Dealer wins!"
        return
    fi

    echo "Dealer's hand: ${dealer_cards[@]}"
    dealer_score=$(calculate_score "${dealer_cards[@]}")
    while ((dealer_score < 17)); do
        card=$(draw_card)
        dealer_cards+=("$card")
        echo "Dealer drew: $card"
        dealer_score=$(calculate_score "${dealer_cards[@]}")
    done

    echo "Dealer's score: $dealer_score"

    if ((dealer_score > 21)); then
        echo "Dealer busted with $dealer_score. You win!"
    elif ((player_score > dealer_score)); then
        echo "You win with $player_score against the dealer's $dealer_score!"
    elif ((player_score < dealer_score)); then
        echo "Dealer wins with $dealer_score against your $player_score."
    else
        echo "It's a tie!"
    fi
}

play_blackjack
