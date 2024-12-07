#!/bin/bash

generate_quests() {
    quests=("Deliver_10_items" "Cook_5_dishes" "Kill_20_monsters" "Mine_15_ores" "Build_1_house" "Plant_30_trees" "Collect_10_fruits" "Catch_5_fish" "Find_3_magical_items" "Protect_village_1_day"
            "Explore_1_cave" "Chop_50_logs" "Do_5_side_quests" "Fight_1_boss" "Mine_20_gold" "Travel_to_1_town" "Help_3_friends" "Complete_1_special_quest" "Test_10_weapons" "Play_game_30_minutes")
    days=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")

    for day in ${days[@]}; do
        echo "Quest for $day: "
        random_quests=($(shuf -e "${quests[@]}" -n 5))
        for quest in "${random_quests[@]}"; do
            echo "- $quest  "
        done
        echo
    done
}

generate_quests
