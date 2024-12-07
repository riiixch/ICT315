#!/bin/bash

clear

lab_1() {
    clear
    read -p "กรุณากรอกชื่อจริง-นาทสกุล: " name

    clean_name=$(echo "$name" | sed -e 's/^นาย//' -e 's/^นางสาว//' -e 's/^นาง//')

    echo "ผลการแปลง: $clean_name"
}

lab_2() {
    read -p "กรุณาใส่ชื่อ: " firstname
    read -p "กรุณาใส่นามสกุล: " lastname
    
    uppercase_firstname=$(echo "$firstname" | tr '[:lower:]' '[:upper:]')
    uppercase_lastname=$(echo "$lastname" | tr '[:lower:]' '[:upper:]')
    
    echo "ชื่อและนามสกุลในตัวพิมพ์ใหญ่: $uppercase_firstname $uppercase_lastname"
}

lab_3() {
    read -p "กรุณาใส่ชื่อไฟล์ภาพ (เช่น image.jpg): " filename

    name_without_extension="${filename%.*}"

    echo "ชื่อไฟล์ที่ไม่มีนามสกุล: $name_without_extension"
}

lab_4() {
    echo "===================="
    read -p "กรุณาใส่ชื่อไฟล์ที่ต้องการค้นหา: " file
    read -p "กรุณาใส่ข้อความที่ต้องการค้นหาในไฟล์: " text
    echo "===================="

    if [[ ! -f $file ]]
    then
        echo "ไม่พบชื่อไฟล์: $file"
        echo "===================="
    elif grep -q "$text" $file
    then
        echo "พบข้อความ: $text"
        echo "===================="
        grep -i "$text" $file
        echo "===================="
    else
        echo "ไม่พบข้อความ: $text"
        echo "===================="
    fi
}

echo "=========================="
echo "1. โปรแกรมตัดคำนำหน้าชื่อ"
echo "2. โปรแกรมอัพเป็นพิมพ์ตัวใหญ่"
echo "3. โปรแกรมตัดนามสกุลไฟล์"
echo "4. โปรแกรมค้นหาคำในไฟล์"
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
        echo "โปรแกรมอัพเป็นพิมพ์ตัวใหญ่"
        echo "=========================="
        lab_2
        ;;
    3)
        echo "=========================="
        echo "โปรแกรมตัดนามสกุลไฟล์"
        echo "=========================="
        lab_3
        ;;
    4)
        echo "=========================="
        echo "โปรแกรมค้นหาคำในไฟล์"
        echo "=========================="
        lab_4
        ;;
    *)
        echo "ตัวเลือกไม่ถูกต้อง"
        ;;
esac