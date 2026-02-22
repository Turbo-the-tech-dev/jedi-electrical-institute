#!/bin/bash
# Voltage Drop Calculator — Single & Three-Phase

echo -e "\n${CYAN}⚡${RESET} ${BOLD}VOLTAGE DROP CALCULATOR${RESET}"
echo -e "${CYAN}══════════════════════════════════════${RESET}\n"

read -p "System type (1=Single-phase, 2=Three-phase): " system
read -p "Voltage (Volts): " voltage
read -p "Current (Amps): " current
read -p "One-way length (feet): " length
read -p "Wire gauge (AWG number, e.g., 12 for 12AWG): " awg

# Approximate resistance per 1000ft (copper at 75°C)
case "$awg" in
    14) r_per_1000=3.14 ;;
    12) r_per_1000=1.98 ;;
    10) r_per_1000=1.24 ;;
    8)  r_per_1000=0.778 ;;
    6)  r_per_1000=0.491 ;;
    4)  r_per_1000=0.308 ;;
    3)  r_per_1000=0.245 ;;
    2)  r_per_1000=0.194 ;;
    1)  r_per_1000=0.154 ;;
    *)  r_per_1000=0.1 ;;
esac

# Calculate resistance
r_total=$(echo "$r_per_1000 * $length * 2 / 1000" | bc -l)

if [ "$system" = "2" ]; then
    # Three-phase: VD = 1.732 × I × R
    vd=$(echo "1.732 * $current * $r_total" | bc -l)
    phase="Three-Phase (√3)"
else
    # Single-phase: VD = 2 × I × R
    vd=$(echo "2 * $current * $r_total" | bc -l)
    phase="Single-Phase"
fi

vd_percent=$(echo "$vd / $voltage * 100" | bc -l)

echo -e "\n${GREEN}✓${RESET} Results for ${BOLD}$phase${RESET}:"
echo -e "  Voltage Drop: ${BOLD}$vd Volts${RESET}"
echo -e "  Percentage: ${BOLD}$vd_percent%${RESET}"

if (( $(echo "$vd_percent > 3" | bc -l) )); then
    echo -e "\n${RED}⚠️  WARNING: Voltage drop exceeds 3% (NEC recommendation)${RESET}"
    echo "   Consider using larger wire gauge"
else
    echo -e "\n${GREEN}✓${RESET} Voltage drop is within NEC recommended limits"
fi

echo -e "\n${CYAN}══════════════════════════════════════${RESET}"
