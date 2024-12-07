#!/bin/bash

clear

lab_1() {
    clear
    read -p "กรุณากรอกชื่อจริง-นาทสกุล: " name

    clean_name=$(echo "$name" | sed -e 's/^นาย//' -e 's/^นางสาว//' -e 's/^นาง//')

    echo "ผลการแปลง: $clean_name"
}

lab_2() {
    clear
    declare -A topuptel

    while true;
    do
        clear
        echo "=========================="
        echo "1. เติมเงิน"
        echo "2. สรุปรายการเติมเงิน"
        echo "0. ออกจากโปรแกรม"
        echo "=========================="
        read -p "กรุณาเลือกการทำงาน: " funct

        case $funct in
            1)
                clear
                read -p "กรุณากรอกเบอร์โทรศัพท์: " telnum
                clear
                echo "=========================="
                echo "เบอร์โทรศัพ: " $telnum
                echo "=========================="
                echo "1. DTAC"
                echo "2. AIS"
                echo "3. TRUE"
                echo "=========================="
                read -p "กรุณาเลือกเครือข่าย: " network

                topup() {
                    clear
                    echo "=========================="
                    echo "เบอร์โทรศัพ: " $telnum
                    echo "เครือข่าย: " $network
                    echo "=========================="
                    echo "1. 50 บาท"
                    echo "2. 100 บาท"
                    echo "3. 300 บาท"
                    echo "4. 500 บาท"
                    echo "5. 1,000 บาท"
                    echo "=========================="
                    read -p "กรุณาเลือกจำนวนเงินที่ต้องการเติม: " amount

                    case $amount in
                        1)
                            topuptel["$telnum"]="$telnum,$network,50"
                            ;;
                        2)
                            topuptel["$telnum"]="$telnum,$network,100"
                            ;;
                        3)
                            topuptel["$telnum"]="$telnum,$network,300"
                            ;;
                        4)
                            topuptel["$telnum"]="$telnum,$network,500"
                            ;;
                        5)
                            topuptel["$telnum"]="$telnum,$network,1,000"
                            ;;
                        *)
                            echo "ตัวเลือกไม่ถูกต้อง"
                            ;;
                    esac
                }

                case $network in
                    1)
                        clear
                        network="DTAC"
                        topup
                        ;;
                    2)
                        clear
                        network="AIS"
                        topup
                        ;;
                    3)
                        clear
                        network="TRUE"
                        topup
                        ;;
                    *)
                        echo "ตัวเลือกไม่ถูกต้อง"
                        ;;
                esac
                ;;
            2)
                clear
                echo "=========================="
                echo "สรุปรายการเติมเงิน"
                echo "=========================="
                for topuptelId in "${!topuptel[@]}"; do
                    IFS=',' read -r telnum network amount <<< "${topuptel[$topuptelId]}"
                    echo "เบอร์ $telnum | เครือข่าย $network | จำนวนเงิน $amount บาท"
                done
                echo "=========================="
                exit 0
                ;;
            0)
                clear
                echo "ออกจากโปรแกรม"
                exit 0
                ;;
            *)
                echo "ตัวเลือกไม่ถูกต้อง"
                ;;
        esac
    done
}

lab_3() {
    clear
    echo "=========================="
    echo "1. บวก (+)"
    echo "2. ลบ (-)"
    echo "3. คูณ (x)"
    echo "4. หาร (÷)"
    echo "=========================="
    read -p "เลือกตัวเลือกที่ต้องการดำเนินการ: " choise

    inputnum() {
        read -p "กรุณากรอกเลขตัวที่ 1: " num1
        read -p "กรุณากรอกเลขตัวที่ 2: " num2
    }

    case $choise in
        1)
            inputnum
            clear
            result=$(($num1 + $num2))
            echo "=========================="
            echo "$num1 + $num2 = $result"
            echo "=========================="
            ;;
        2)
            inputnum
            clear
            result=$(($num1 - $num2))
            echo "=========================="
            echo "$num1 - $num2 = $result"
            echo "=========================="
            ;;
        3)
            inputnum
            clear
            result=$(($num1 * $num2))
            echo "=========================="
            echo "$num1 x $num2 = $result"
            echo "=========================="
            ;;
        4)
            inputnum
            clear
            result=$(($num1 / $num2))
            echo "=========================="
            echo "$num1 ÷ $num2 = $result"
            echo "=========================="
            ;;
        *)
            echo "ตัวเลือกไม่ถูกต้อง"
            ;;
    esac
}

echo "=========================="
echo "1. โปรแกรมตัดคำนำหน้าชื่อ"
echo "2. โปรแกรมเลือกเครือข่ายเติมเงินโทรศัพท์"
echo "3. โปรแกรมเครื่องคิดเลข"
echo "=========================="
read -p "เลือกข้อที่ต้องการ: " lab

case $lab in
    1)
        echo "=========================="
        echo "โปรแกรมตัดคำนำหน้าชื่อ"
        echo "=========================="
        lab_1
        ;;
    2)
        echo "=========================="
        echo "โปรแกรมเลือกเครือข่ายเติมเงินโทรศัพท์"
        echo "=========================="
        lab_2
        ;;
    3)
        echo "=========================="
        echo "โปรแกรมเครื่องคิดเลข"
        echo "=========================="
        lab_3
        ;;
    *)
        echo "ตัวเลือกไม่ถูกต้อง"
        ;;
esac