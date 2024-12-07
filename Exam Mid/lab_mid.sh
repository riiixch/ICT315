#!/bin/bash
#file: lab_mid.sh

echo "===================="
echo "ข้อที่ 1. เรียงเลข 50 - 15"
echo "ข้อที่ 2. ***"
echo "ข้อที่ 3. คิดราคา"
echo "===================="

lab1() {
    for (( i = 50; i >= 15; i = i - 5 )) {
        if [ $i == 25 ]
        then
            echo "Good luck"
        elif [ $i == 40 ]
        then
            echo -n ""
        else
            echo "Number :" $i
        fi
    }
}

lab2() {
    for (( i = 1; i <= 10; i++ )) {
        for (( j = 1; j < i; j++ )) {
            echo -n "*"
        }

        echo ""
    }

    for (( i = 10; i >= 1; i-- )) {
        for (( j = 1; j < i; j++ )) {
            echo -n "*"
        }

        echo ""
    }
}

lab3() {
    menu=()

    menu+=("น้ำดื่ม - 10 บาท")
    menu+=("ขนมปัง - 25 บาท")
    menu+=("ข้าวกล่อง - 50 บาท")
    menu+=("นมกล่อง - 18 บาท")

    name=()

    name+=("น้ำดื่ม")
    name+=("ขนมปัง")
    name+=("ข้าวกล่อง")
    name+=("นมกล่อง")

    price=()

    price+=(10)
    price+=(25)
    price+=(50)
    price+=(18)

    count=()

    count+=(0)
    count+=(0)
    count+=(0)
    count+=(0)

    total=0

    echo "===================="
    echo "รายการสินค้า :"
    for i in "${!menu[@]}";
    do
        echo $((i+1)). ${menu[i]}
    done
    echo "0. ออกจาระบบ"
    echo "===================="

    while [ True ]
    
    do
        read -p "เลือกหมายเลขสินค้า: " sel

        if [ -z $sel ]
        then
            echo "===================="
            for i in "${!count[@]}";
            do
                j=${count[i]}
                if [ $j > 0 ]
                then
                    cprice=${price[i]}
                    ccount=${count[i]}
                    ctotal=$((cprice*ccount))
                    total=$((total+ctotal))
                    
                    echo "คุณได้ซื้อ" ${name[i]} "จำนวน" ${count[i]} "ชิ้น เป็นราคา" $ctotal "บาท"
                else
                    echo -n ""
                fi
            done
            echo "===================="
            echo "ราคารวมสินค้าทั้งหมด :" $total
            echo "===================="
            break
        elif [ "$sel" -ge 1 ] && [ "$sel" -le 4 ];
        then
            i=$((sel-1))

            count[i]=$((count[i] + 1))
            
            echo "คุณได้เลือก" ${name[i]} "ราคา" ${price[i]} "บาท"
        elif [ $sel == 0 ]
        then
            echo "===================="
            for i in "${!count[@]}";
            do
                j=${count[i]}
                if [ $j > 0 ]
                then
                    cprice=${price[i]}
                    ccount=${count[i]}
                    ctotal=$((cprice*ccount))
                    total=$((total+ctotal))

                    echo "คุณได้ซื้อ" ${name[i]} "จำนวน" ${count[i]} "ชิ้น เป็นราคา" $ctotal "บาท"
                else
                    echo -n ""
                fi
            done
            echo "===================="
            echo "ราคารวมสินค้าทั้งหมด :" $total
            echo "===================="
            break
        else
            echo "===================="
            for i in "${!count[@]}";
            do
                j=${count[i]}
                if [ $j > 0 ]
                then
                    cprice=${price[i]}
                    ccount=${count[i]}
                    ctotal=$((cprice*ccount))
                    total=$((total+ctotal))
                    
                    echo "คุณได้ซื้อ" ${name[i]} "จำนวน" ${count[i]} "ชิ้น เป็นราคา" $ctotal "บาท"
                else
                    echo -n ""
                fi
            done
            echo "===================="
            echo "ราคารวมสินค้าทั้งหมด :" $total
            echo "===================="
            break
        fi
    done
}

read -p "โจทย์ข้อที่: " lab

if [ -z $lab ]
then
    echo "ไม่พบโจทย์ที่ต้องการหา"
elif [ $lab == 1 ]
then
    lab1
elif [ $lab == 2 ]
then
    lab2
elif [ $lab == 3 ]
then
    lab3
else
    echo "ไม่พบโจทย์ที่ต้องการหา"
fi
