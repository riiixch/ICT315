#!/bin/bash

# กราฟิกเริ่มเกม
show_intro() {
  echo "============================================="
  echo "               🎲 Coin Toss Game 🎲             "
  echo "============================================="
  echo "           ▄▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▄               "
  echo "           █░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░█              "
  echo "           █░▒█▀█▀▀▀▀▀▀▀▀▀▀█▀█░█              "
  echo "           █░▒█░░░░▒░░▒░░░░░█░█░█             "
  echo "           █░▒█▄▄▄▄▄▄▄▄▄▄▄▄▄█▒█░█             "
  echo "           ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀              "
  echo "        🧑 Player vs 🤖 Bot - Heads or Tails?  "
  echo "============================================="
}

# กราฟิกแสดงคะแนน
show_score() {
  echo "============================================="
  echo "       🧑 Player: $player_score | 🤖 Bot: $bot_score"
  echo "============================================="
}

# กราฟิกแสดงหัว
show_heads() {
  echo "============================================="
  echo "                🪙 Heads! 🪙                  "
  echo "           ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄                   "
  echo "         ▄▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▄                 "
  echo "        █░░░░░░░░░░░░░░░░░░░░█                "
  echo "        █░░░░░░░░░░░░░░░░░░░░█                "
  echo "         ▀▄░░░░░░░░░░░░░░░░▄▀                 "
  echo "           ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀                   "
  echo "============================================="
}

# กราฟิกแสดงก้อย
show_tails() {
  echo "============================================="
  echo "                🪙 Tails! 🪙                  "
  echo "           ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄                   "
  echo "         ▄▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▄                 "
  echo "        █░░░░░░░░░░░░░░░░░░░░█                "
  echo "        █░░░░░░░░░░░░░░░░░░░░█                "
  echo "         ▀▄░░░░░░░░░░░░░░░░▄▀                 "
  echo "           ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀                   "
  echo "============================================="
}

# กราฟิกแสดงความแตกต่างระหว่างหัวกับก้อย
show_difference() {
  echo "============================================="
  echo "            🪙 Difference in Coins 🪙        "
  echo "                Heads vs Tails                "
  echo "---------------------------------------------"
  echo "Heads (🪙): Represents success, victory, or     "
  echo "a positive outcome. Great for winning!        "
  echo "---------------------------------------------"
  echo "Tails (🪙): Represents failure, loss, or a      "
  echo "negative outcome. Be careful of your choices!  "
  echo "============================================="
}

# กราฟิกแสดงชัยชนะ
show_win_graphic() {
  echo "============================================="
  echo "           🎉 Congratulations! 🎉             "
  echo "          You won the game, Champion!        "
  echo "============================================="
  echo "    ▄████████▄     ▄████████▄                 "
  echo "   ████▀▀█████    ████▀▀█████                "
  echo "   ████▄▄█████    ████▄▄█████                "
  echo "    ▀████████▀     ▀████████▀                 "
  echo "============================================="
}

# กราฟิกแสดงความพ่ายแพ้
show_lose_graphic() {
  echo "============================================="
  echo "             💀 You Lost! 💀                 "
  echo "           Better luck next time!            "
  echo "============================================="
  echo "    ▄████████▄     ▄████████▄                 "
  echo "   █████▀▀▀███    █████▀▀▀███                "
  echo "   █████▄▄▄███    █████▄▄▄███                "
  echo "    ▀████████▀     ▀████████▀                 "
  echo "============================================="
}

# ฟังก์ชันโยนเหรียญ
toss_coin() {
  if (( RANDOM % 2 == 0 )); then
    show_heads
    echo "Coin toss result: Heads"
    echo "---------------------------------------------"
    echo "🎉 You guessed it right! 🎉"
    echo "---------------------------------------------"
    return 0  # หัว
  else
    show_tails
    echo "Coin toss result: Tails"
    echo "---------------------------------------------"
    echo "🤖 Bot guessed it right! 🤖"
    echo "---------------------------------------------"
    return 1  # ก้อย
  fi
}

# ฟังก์ชันหลักของเกม
play_game() {
  player_score=0
  bot_score=0

  while [[ $player_score -lt 3 && $bot_score -lt 3 ]]; do
    show_score

    read -p "Choose heads or tails (h/t): " player_choice
    player_choice=$(echo "$player_choice" | tr '[:upper:]' '[:lower:]')

    # ตรวจสอบให้แน่ใจว่าผู้เล่นเลือกถูกต้อง
    if [[ $player_choice != "h" && $player_choice != "t" ]]; then
      echo "Invalid choice, please choose 'h' for heads or 't' for tails."
      continue
    fi

    # โยนเหรียญ
    toss_coin_result=$(toss_coin)

    if [[ ($player_choice == "h" && $? -eq 0) || ($player_choice == "t" && $? -eq 1) ]]; then
      ((player_score++))
      echo "You won this round! 🎉"
    else
      ((bot_score++))
      echo "Bot won this round! 🤖"
    fi
  done

  # แสดงความแตกต่างระหว่างหัวกับก้อย
  show_difference

  # ประกาศผู้ชนะ
  if [[ $player_score -eq 3 ]]; then
    show_win_graphic
  else
    show_lose_graphic
  fi
}

# เริ่มเกม
show_intro
play_game