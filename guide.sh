#!/bin/bash

#ด้านบนต้องมี #!/bin/bash เปิดเสมอ

#การใช้ if, if else, if elif

#if [[ เงื่อนไข ]]
#then
#   โค้ดที่ต้องการให้ทำงาน เมื่อตรงเงื่อนไข
#fi

#if [[ เงื่อนไข ]]
#then
#   โค้ดที่ต้องการให้ทำงาน เมื่อตรงเงื่อนไข
#else
#   โค้ดที่ต้องการให้ทำงาน เมื่อไม่ตรงเงื่อนไข
#fi

#if [[ เงื่อนไขที่ 1 ]]
#then
#   โค้ดที่ต้องการให้ทำงาน เมื่อตรงเงื่อนไขที่ 1
#elif [[ เงื่อนไขที่ 2 ]]
#then
#   โค้ดที่ต้องการให้ทำงาน เมื่อตรงเงื่อนไขที่ 2
#else
#   โค้ดที่ต้องการให้ทำงาน เมื่อไม่ตรงเงื่อนไขใด ๆ เลย
#fi

#เกร็ดข้อควรรู้
#if [[ เงื่อนไข ]]    <<< ใช้สำหรับการเทียบค่า String หรือ Text (ข้อความ)
#if (( เงื่อนไข ))    <<< ใช้สำหรับการเทียบค่า Integer หรือ Number (ตัวเลข)

#ตัวอย่าง if

echo "if example"

point=80

if (( $point >= 80 ))
then
    echo "Pass"
else
    echo "Not pass"
fi

name="jack"

if [[ $name == "rich" ]]
then
    echo "Hi' rich"
elif [[ $name == "jack" ]]
then
    echo "Hi' jack"
else
    echo "Hi' user"
fi

#การใช้ Array
#declare -A names   <<< การประกาศตัวแปร names เป็น Array แบบมี Key
#names=()           <<< การประกาศตัวแปร names เป็น Array แบบไม่มี Key (ใช้ Index ในการระบุตำแหน่งแทน ***Index ใน Array เริ่มต้นจาก 0)

#เพิ่มข้อมูลลงใน Array
#names["key"]="value"   <<< การเพิ่มข้อมูลลงใน Array แบบมี Key บ่งบอก
#names+=("value")       <<< การเพิ่มข้อมูลลงใน Array แบบไม่มี Key บ่งบอก

#ลบข้อมูลออกจาก Array
#unset names["key"]         <<< การลบข้อมูลออกจาก Array แบบมี Key
#unset names[Index Number]  <<< การลบข้อมูลออกจาก Array แบบไม่มี Key (เราต้องรู้ตำแหน่งลำดับข้อมูลหรือ Index ที่เราต้องการลบออกจาก Array ***Index ใน Array เริ่มต้นจาก 0)

#วิธีการเรียกใช้งาน Array ในรูปแบบต่าง ๆ
#${names[@]}    <<< เป็นการเรียกดูข้อมูลทั้งหมดใน Array
#${#names[@]}   <<< เป็นการข้อดูจำนวนข้อมูลที่มีทั้งหมดใน Array

#ตัวอย่าง Array

echo "array example"

names=()

names+=("rich")
echo "Number of array : ${#names[@]} | data: ${names[@]}"

names+=("jack")
echo "Number of array : ${#names[@]} | data: ${names[@]}"

unset names[0]
echo "Number of array : ${#names[@]} | data: ${names[@]}"

declare -A friends

friends["rich"]="rich"
friends["jack"]="jack"

#