#!/bin/bash

show_calendar() {
    local year=$1
    for month in {1..12}
    do
        cal $month $year
    done
}

read -p "Please enter the year for which you want to view the calendar : " year

show_calendar $year
