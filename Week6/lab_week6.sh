#!/bin/bash
#file: lab_week6.sh

echo "===================="
echo "ข้อที่ 1. แสดงเลขคู่ 0-20"
echo "ข้อที่ 2. แสดงตัวเลข"
echo "ข้อที่ 3. สูตรคูณ (x12)"
echo "ข้อที่ 4. ทายเลข 0-10"
echo "===================="

read -p "โจทย์ข้อที่: " lab

if [ $lab -eq 1 ]
then
    echo "===================="

    num=0

    while [ $num -le 20 ]

    do
        echo "Number: $num"

        ((num = $num+2))
    done
elif [ $lab -eq 2 ]
then
    echo "===================="
    echo "ข้อที่ 2.1. แสดงตัวเลข 3, 6, 9, 12, 15, 18, 21"
    echo "ข้อที่ 2.2. แสดงตัวเลข 40, 35, 30, 25, 20, 15, 10"
    echo "ข้อที่ 2.3. แสดงตัวเลข 1, 3, 4, 6, 7, 8, 9, 10"
    echo "===================="

    read -p "โจทย์ข้อที่ 2." lab2

    if [ $lab2 -eq 1 ]
    then
        echo "===================="

        num=3

        while [ $num -le 21 ]

        do
            echo "Number: $num"

            ((num = $num+3))
        done
    elif [ $lab2 -eq 2 ]
    then
        echo "===================="

        num=40

        while [ $num -ge 10 ]

        do
            echo "Number: $num"

            ((num = $num-5))
        done
    elif [ $lab2 -eq 3 ]
    then
        echo "===================="

        num=1

        while [ $num -le 10 ]

        do
            if [ $num -eq 2 ]
            then
                ((num = $num+1))
                continue
            elif [ $num -eq 5 ]
            then
                ((num = $num+1))
                continue
            fi

            echo "Number: $num"

            ((num = $num+1))
        done
    else
        echo "ไม่พบโจทย์ที่ต้องการหา"
    fi
elif [ $lab -eq 3 ]
then
    echo "===================="

    read -p "ป้อนตัวเลขที่ต้องการคูณ (1-12): " num

    x=1

    while [ $x -le 12 ]

    do
        echo "$num x $x = $(($num * $x))"

        ((x = $x+1))
    done
elif [ $lab -eq 4 ]
then
    echo "===================="

    while [ True ]

    do
        read -p "ป้อนตัวเลข 0-10 แบบสุ่ม: " num

        if [ $num -eq 7 ]
        then
            echo "++++++++++++++++++++"
            echo "Your is the winner."
            echo "++++++++++++++++++++"
            break
        fi

        echo "Number : $num"
    done
else
    echo "ไม่พบโจทย์ที่ต้องการหา"
fi