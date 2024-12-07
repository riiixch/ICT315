#!/bin/bash

calculate_profit_tax() {
    read -p "Enter cost price : " cost
    read -p "Enter selling price : " selling_price
    read -p "Enter tax percentage : " tax_percentage

    profit=$(echo "$selling_price - $cost" | bc)
    tax=$(echo "$profit * $tax_percentage / 100" | bc)
    final_price=$(echo "$profit - $tax" | bc)

    echo "Profit: $profit"
    echo "Tax: $tax"
    echo "Final profit after tax: $final_price"
}

calculate_profit_tax
