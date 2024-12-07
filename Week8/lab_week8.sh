#!/bin/bash
#file: lab_week8.sh

echo "===================="
echo "โปรแกรมรับค่าตัวเลข เพื่อนำไปค้นหาเลขคู่-คี่"
echo "ตัวอย่าง : 5 3 14 27 49 13 22"
echo "===================="

read -p "กรุณาป้อนค่าตัวเลข: " -a numbers

odd=()
twin=()

numsum=0
oddsum=0
twinsum=0

for i in "${numbers[@]}";
do
    if [ $(($i%2)) == 0 ]
    then
        twin+=($i)
    else
        odd+=($i)
    fi

    numsum=$((numsum+i))
done

echo "===================="
echo -n "เลขคู่ : "

for i in "${twin[@]}";
do
    echo -n $i" "

    twinsum=$((twinsum+i))
done

echo ""

echo -n "เลขคี่ : "

for i in "${odd[@]}";
do
    echo -n $i" "

    oddsum=$((oddsum+i))
done

echo ""
echo "===================="

echo "ผลรวมทั้งหมด:" $numsum
echo "ผลรวมเลขคู่:" $twinsum
echo "ผลรวมเลขคี่:" $oddsum

echo "===================="