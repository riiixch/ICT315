#!/bin/bash

ConvertBE() {
    read -p "Input B.E. want convert : " num

    echo "B.E. (ค.ศ.) : $num"
    echo "A.D. (พ.ศ.) :" $(($num+543))
}

ConvertAD() {
    read -p "Input A.D. want convert : " num

    echo "A.D. (พ.ศ.) : $num"
    echo "B.E. (ค.ศ.) :" $(($num-543))
}

    echo "++++++++++++++++++++"
    echo "Press 1. Convert B.E. to A.D. (แปลง ค.ศ. เป็น พ.ศ.)"
    echo "Press 2. Convert A.D. to B.E. (แปลง พ.ศ. เป็น ค.ศ.)"
    echo "Press 5. Exit the program."
    echo "++++++++++++++++++++"

while true
do
    echo "===================="
    read -p "Select feature : " fea
    echo "===================="

    case $fea in
        1)ConvertBE;;
        2)ConvertAD;;
        5)break;;
        *)break;;
    esac
done