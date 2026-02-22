#!/bin/bash
# Conduit Fill Calculator — NEC Chapter 9

echo -e "\n${CYAN}⚡${RESET} ${BOLD}CONDUIT FILL CALCULATOR${RESET}"
echo -e "${CYAN}══════════════════════════════════════${RESET}\n"

echo "Conduit size:"
echo "1) 1/2 inch"
echo "2) 3/4 inch"
echo "3) 1 inch"
echo "4) 1-1/4 inch"
echo "5) 1-1/2 inch"
echo "6) 2 inch"
echo ""
read -p "Choose (1-6): " size

echo ""
echo "Wire gauge:"
echo "1) 14 AWG"
echo "2) 12 AWG"
echo "3) 10 AWG"
echo "4) 8 AWG"
echo "5) 6 AWG"
echo ""
read -p "Choose (1-5): " wire

# Approximate conduit fill (40% fill, THHN wires)
case "${size}-${wire}" in
    1-1) max=9 ;;  1/2" - 14AWG
    1-2) max=6 ;;
    1-3) max=4 ;;
    2-1) max=16 ;;
    2-2) max=10 ;;
    2-3) max=6 ;;
    3-1) max=28 ;;
    3-2) max=18 ;;
    3-3) max=11 ;;
    *) max=10 ;;
esac

read -p "Number of conductors: " count

echo -e "\n${GREEN}✓${RESET} Maximum conductors (40% fill): ${BOLD}$max${RESET}"
echo -e "Your count: ${BOLD}$count${RESET}"

if [ "$count" -gt "$max" ]; then
    echo -e "\n${RED}⚠️  OVERFILLED!${RESET} Reduce conductors or use larger conduit"
else
    echo -e "\n${GREEN}✓${RESET} Conduit fill is within NEC limits"
fi

echo -e "\n${CYAN}══════════════════════════════════════${RESET}"
