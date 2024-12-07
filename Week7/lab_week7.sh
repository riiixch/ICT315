#!/bin/bash
#file: lab_week7.sh

echo "===================="
echo "ข้อที่ 1. โปรแกรมคานวณสูตรคูณแม่ 2-12"
echo "ข้อที่ 2. โปรแกรมรับชาระค่าเทอม"
echo "ข้อที่ 3. เรียงเลข 1-5"
echo "ข้อที่ 4. เรียงเลข 5-1"
echo "ข้อที่ 5. เรียงเลข 12345"
echo "ข้อที่ 6. เรียงเลข 6-10"
echo "===================="

read -p "โจทย์ข้อที่: " lab

lab1() {
    for (( i = 2; i <= 12; i++ )) {
        echo "=====[ สูตรคูรแม่ $i ]====="
        for (( j = 1; j<= 12; j++ )) {
            echo "$i x $j =" $(($i * $j))
        }

        echo ""
    }
}

lab2() {
    echo "===================="
    read -p "จำนวนนักศึกษา: " count

    names=()
    trems1=()
    trems2=()

    caltrem=0

    for (( i = 0; i < $count; i++ )) {
        echo "===================="
        read -p "ชื่อ-นามสกุล: " name
        read -p "ค่าเทอม ภาคที่ 1: " trem1
        read -p "ค่าเทอม ภาคที่ 2: " trem2

        names+=("$name")
        trems1+=($trem1)
        trems2+=($trem2)

        caltrem=$(($caltrem + $trem1))
        caltrem=$(($caltrem + $trem2))
    }

    echo "===================="
    echo "จำนวนนักศึกษา:" $count
    echo "===================="

    for (( i = 0; i < $count; i++ )) {
        echo "ชื่อ-นามสกุล:" ${names[i]}
        echo "ค่าเทอม ภาคที่ 1:" ${trems1[i]}
        echo "ค่าเทอม ภาคที่ 2:" ${trems2[i]}
    }

    echo "===================="
    echo "จำนวนนักศึกษาที่ชำระค่าเทอม" $count "คน"
    echo "รวมเป็นเงิน" $caltrem "บาท"
    echo "===================="
}

lab3() {
    echo "===================="
    for (( i = 1; i <= 5; i++ )) {
        for (( j = 1; j <= i; j++ )) {
            echo -n $i
        }

        echo ""
    }
}

lab4() {
    echo "===================="
    for (( i = 5; i >= 1; i-- )) {
        for (( j = 1; j <= i; j++ )) {
            echo -n $i
        }

        echo ""
    }
}

lab5() {
    echo "===================="
    for (( i = 5; i >= 1; i-- )) {
        for (( j = 1; j <= i; j++ )) {
            echo -n $j
        }

        echo ""
    }
}

lab6() {
    echo "===================="
    n=0
    for (( i = 5; i >= 1; i-- )) {
        for (( j = 1; j <= i; j++ )) {
            echo -n $(($j + $i + $n))" "
        }

        n=$(($n + 1))
        echo ""
    }
}

if [ $lab == 1 ]
then
    lab1
elif [ $lab == 2 ]
then
    lab2
elif [ $lab == 3 ]
then
    lab3
elif [ $lab == 4 ]
then
    lab4
elif [ $lab == 5 ]
then
    lab5
elif [ $lab == 6 ]
then
    lab6
else
    echo "ไม่พบโจทย์ที่ต้องการหา"
fi