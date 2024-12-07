#!/bin/bash

# ประกาศตัวแปรอาเรย์ books สำหรับเก็บข้อมูลหนังสือ โดยจะประกอบด้วยรหัสหนังสือ ชื่อหนังสือ และสถานะ
declare -A books

# ฟังก์ชันเพิ่มหนังสือใหม่
add_book() {
    echo "เพิ่มหนังสือใหม่"
    read -p "รหัสหนังสือ: " book_id
    read -p "ชื่อหนังสือ: " book_name
    # เพิ่มหนังสือเข้าอาเรย์ books โดยตั้งสถานะเป็น available
    books["$book_id"]="$book_name,available"
    echo "หนังสือ '$book_name' ถูกเพิ่มเข้าระบบสำเร็จ"
}

# ฟังก์ชันแสดงรายการหนังสือทั้งหมด
display_books() {
    echo "รายการหนังสือทั้งหมด:"
    for book_id in "${!books[@]}"; do
        IFS=',' read -r book_name status <<< "${books[$book_id]}"
        echo "รหัส: $book_id | ชื่อ: $book_name | สถานะ: $status"
    done
}

# ฟังก์ชันยืมหนังสือ
borrow_book() {
    read -p "รหัสหนังสือที่ต้องการยืม: " book_id
    if [[ -n "${books[$book_id]}" ]]; then
        IFS=',' read -r book_name status <<< "${books[$book_id]}"
        if [[ "$status" == "available" ]]; then
            books["$book_id"]="$book_name,borrowed"
            echo "หนังสือ '$book_name' ถูกยืมเรียบร้อยแล้ว"
        else
            echo "หนังสือ '$book_name' ถูกยืมไปแล้ว"
        fi
    else
        echo "ไม่พบหนังสือในระบบ"
    fi
}

# ฟังก์ชันคืนหนังสือ
return_book() {
    read -p "รหัสหนังสือที่ต้องการคืน: " book_id
    if [[ -n "${books[$book_id]}" ]]; then
        IFS=',' read -r book_name status <<< "${books[$book_id]}"
        if [[ "$status" == "borrowed" ]]; then
            books["$book_id"]="$book_name,available"
            echo "หนังสือ '$book_name' ถูกคืนเรียบร้อยแล้ว"
        else
            echo "หนังสือ '$book_name' อยู่ในสถานะพร้อมให้ยืมแล้ว"
        fi
    else
        echo "ไม่พบหนังสือในระบบ"
    fi
}

# ฟังก์ชันแสดงเมนูหลัก
main_menu() {
    while true; do
        echo "=========================="
        echo "ระบบยืมคืนหนังสือ"
        echo "1. เพิ่มหนังสือ"
        echo "2. แสดงรายการหนังสือ"
        echo "3. ยืมหนังสือ"
        echo "4. คืนหนังสือ"
        echo "5. ออกจากโปรแกรม"
        read -p "เลือกตัวเลือก: " choice

        case $choice in
            1)
                add_book
                ;;
            2)
                display_books
                ;;
            3)
                borrow_book
                ;;
            4)
                return_book
                ;;
            5)
                echo "ออกจากโปรแกรม"
                exit 0
                ;;
            *)
                echo "ตัวเลือกไม่ถูกต้อง"
                ;;
        esac
    done
}

# เรียกใช้เมนูหลักเพื่อเริ่มโปรแกรม
main_menu
