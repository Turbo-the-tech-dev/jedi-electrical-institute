#!/bin/bash
# Ohm's Law Calculator — Jedi Electrical Institute

echo -e "\n${CYAN}⚡${RESET} ${BOLD}OHM'S LAW CALCULATOR${RESET}"
echo -e "${CYAN}══════════════════════════════════════${RESET}\n"

echo "What do you want to calculate?"
echo "1) Voltage (V = I × R)"
echo "2) Current (I = V / R)"
echo "3) Resistance (R = V / I)"
echo "4) Power (P = V × I)"
echo ""
read -p "Choose (1-4): " choice

case "$choice" in
    1)
        read -p "Current (Amps): " i
        read -p "Resistance (Ohms): " r
        v=$(echo "$i * $r" | bc -l)
        echo -e "\n${GREEN}✓${RESET} Voltage = ${BOLD}$v Volts${RESET}"
        ;;
    2)
        read -p "Voltage (Volts): " v
        read -p "Resistance (Ohms): " r
        i=$(echo "$v / $r" | bc -l)
        echo -e "\n${GREEN}✓${RESET} Current = ${BOLD}$i Amps${RESET}"
        ;;
    3)
        read -p "Voltage (Volts): " v
        read -p "Current (Amps): " i
        r=$(echo "$v / $i" | bc -l)
        echo -e "\n${GREEN}✓${RESET} Resistance = ${BOLD}$r Ohms${RESET}"
        ;;
    4)
        read -p "Voltage (Volts): " v
        read -p "Current (Amps): " i
        p=$(echo "$v * $i" | bc -l)
        echo -e "\n${GREEN}✓${RESET} Power = ${BOLD}$p Watts${RESET}"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

echo -e "\n${CYAN}══════════════════════════════════════${RESET}"
