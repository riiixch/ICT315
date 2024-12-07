#!/bin/bash

# ฟังก์ชันสำหรับแสดงเมนูหลัก
main_menu() {
    echo "===== ระบบการจองห้องประชุม ====="
    echo "1. แสดงสถาปัตยกรรมของเครื่องที่กำลังใช้งาน"
    echo "2. แสดงปฏิทินของเดือนนี้"
    echo "3. แสดงปฏิทินของเดือนเมษายน ปี 2025"
    echo "4. แสดงปฏิทินของปี 2024"
    echo "5. แสดงปฏิทินของเดือนที่ผ่านมา เดือนปัจจุบัน และเดือนหน้า ของปี 2024"
    echo "6. แสดงรายละเอียดของ CPU ที่ใช้งาน"
    echo "7. แสดงวันที่และเวลาของระบบ"
    echo "8. กำหนดวันที่และเวลาของระบบเป็น วันอาทิตย์ที่ 10 ธันวาคม 2024 เวลา 9:35:10 น"
    echo "9. ระบบการจองห้องประชุม"
    echo "N. ออกจากโปรแกรม"
    read -p "กรุณาเลือกเมนู: " choice
}

# ฟังก์ชันแสดงปฏิทินแบบตาราง
display_calendar() {
    local year=$1
    local month=$2

    # แสดงชื่อเดือนและปี
    echo "            $(date -d "$year-$month-01" +"%B %Y")"
    echo "   Mon  Tue  Wen  Thu  Fri  Sat  Sun"

    # หาวันที่เริ่มต้นของเดือน
    local start_day=$(date -d "$year-$month-01" +%u)
    local days_in_month=$(date -d "$year-$month-01 +1 month -1 day" +%d)

    # ช่องว่างก่อนวันที่ 1
    for ((i=1; i<start_day; i++)); do
        echo -n "     "
    done

    # แสดงวันที่ของเดือน
    for ((day=1; day<=days_in_month; day++)); do
        printf "%5d" "$day"
        if (( (day + start_day - 1) % 7 == 0 )); then
            echo
        fi
    done
    echo # ขึ้นบรรทัดใหม่เมื่อจบเดือน
}

# ฟังก์ชันแสดงปฏิทินของเดือนนี้
display_current_month() {
    local year=$(date +%Y)
    local month=$(date +%m)
    display_calendar "$year" "$month"
}

# ฟังก์ชันแสดงปฏิทินของเดือนเมษายน ปี 2025
display_april_2025() {
    display_calendar 2025 04
}

# ฟังก์ชันแสดงปฏิทินของปี 2024
display_year_2024() {
    for month in {01..12}; do
        display_calendar 2024 "$month"
        echo # เพิ่มบรรทัดว่างระหว่างเดือน
    done
}

# ฟังก์ชันแสดงปฏิทินของเดือนที่ผ่านมา เดือนปัจจุบัน และเดือนหน้า ของปี 2024
display_three_months_2024() {
    display_calendar 2024 06
    display_calendar 2024 07
    display_calendar 2024 08
}

# ฟังก์ชันการจองห้องประชุม
declare -A bookings

book_room() {
    read -p "ชื่อผู้จอง: " name
    read -p "วันที่ (YYYY-MM-DD): " date
    read -p "เวลา (HH:MM): " time
    bookings["$date $time"]="$name"
    echo "จองห้องประชุมเรียบร้อยแล้ว"
}

cancel_booking() {
    read -p "วันที่ (YYYY-MM-DD): " date
    read -p "เวลา (HH:MM): " time
    key="$date $time"
    if [[ -n "${bookings[$key]}" ]]; then
        unset bookings["$key"]
        echo "ยกเลิกการจองเรียบร้อยแล้ว"
    else
        echo "ไม่พบการจองในช่วงเวลานี้"
    fi
}

check_booking() {
    read -p "วันที่ (YYYY-MM-DD): " date
    read -p "เวลา (HH:MM): " time
    key="$date $time"
    if [[ -n "${bookings[$key]}" ]]; then
        echo "ผู้จอง: ${bookings[$key]}"
    else
        echo "ไม่มีการจองในช่วงเวลานี้"
    fi
}

view_bookings() {
    echo "===== รายการการจองทั้งหมด ====="
    for key in "${!bookings[@]}"; do
        echo "เวลา: $key - ผู้จอง: ${bookings[$key]}"
    done
}

# เริ่มโปรแกรม
while true; do
    main_menu
    case "$choice" in
        1) uname -m ;;
        2) display_current_month ;;
        3) display_april_2025 ;;
        4) display_year_2024 ;;
        5) display_three_months_2024 ;;
        6) lscpu ;;
        7)
            echo "DATE: $(date +'%Y-%m-%d')"
            echo "TIME: $(date +'%H:%M:%S')"
            ;;
        8)
            sudo date -s "2024-12-10 09:35:10"
            echo "ตั้งวันที่และเวลาเรียบร้อยแล้ว"
            ;;
        9)
            while true; do
                echo "===== ระบบการจองห้องประชุม ====="
                echo "1. จองห้องประชุม"
                echo "2. ยกเลิกการจอง"
                echo "3. ตรวจสอบการจอง"
                echo "4. ดูรายการการจองทั้งหมด"
                echo "N. กลับสู่เมนูหลัก"
                read -p "เลือกฟังก์ชัน: " booking_choice
                case "$booking_choice" in
                    1) book_room ;;
                    2) cancel_booking ;;
                    3) check_booking ;;
                    4) view_bookings ;;
                    N|n) break ;;
                    *) echo "ตัวเลือกไม่ถูกต้อง" ;;
                esac
            done
            ;;
        N|n) echo "ออกจากโปรแกรม"; exit 0 ;;
        *) echo "ตัวเลือกไม่ถูกต้อง" ;;
    esac
done
