#!/bin/bash
################################################################################
# AI Tutor — Jedi Electrical Institute
# Live AI-powered electrical education
################################################################################

MODE="${1:-help}"
QUERY="${2:-}"

echo -e "\n${CYAN}🤖${RESET} ${BOLD}JEDI ELECTRICAL AI TUTOR${RESET}"
echo -e "${CYAN}══════════════════════════════════════${RESET}\n"

case "$MODE" in
    nec)
        echo -e "${YELLOW}📖${RESET} NEC Code Lookup: $QUERY"
        echo ""
        if command -v gemini &>/dev/null; then
            gemini ask "Explain NEC 2026 $QUERY in simple terms for an electrical apprentice. Include:
1. What the article covers
2. Key requirements
3. Common mistakes
4. Example calculation if applicable"
        else
            echo "⚠️  Gemini CLI not found. Install with: npm install -g @google/gemini-cli"
        fi
        ;;
    
    calc)
        echo -e "${YELLOW}🧮${RESET} Calculation Help: $QUERY"
        echo ""
        if command -v gemini &>/dev/null; then
            gemini ask "Help with this electrical calculation: $QUERY
Show step-by-step work, formulas used, and final answer with units."
        else
            echo "⚠️  Gemini CLI not available"
        fi
        ;;
    
    quiz)
        LEVEL="${QUERY:-apprentice}"
        echo -e "${YELLOW}📝${RESET} Practice Quiz: $LEVEL level"
        echo ""
        if command -v gemini &>/dev/null; then
            gemini ask "Generate a 5-question electrical quiz for a $LEVEL level student.
Format:
1. Question
   A) Option A
   B) Option B
   C) Option C
   D) Option D

Include answer key at the end with NEC references."
        else
            echo "⚠️  Gemini CLI not available"
        fi
        ;;
    
    bend)
        echo -e "${YELLOW}🔧${RESET} Conduit Bending: $QUERY"
        echo ""
        if command -v gemini &>/dev/null; then
            gemini ask "Explain how to make this conduit bend: $QUERY
Include:
1. Measurements needed
2. Bender type
3. Step-by-step instructions
4. Common mistakes to avoid"
        else
            echo "⚠️  Gemini CLI not available"
        fi
        ;;
    
    code)
        echo -e "${YELLOW}⚖️${RESET} Code Compliance Check: $QUERY"
        echo ""
        if command -v gemini &>/dev/null; then
            gemini ask "Check NEC 2026 compliance for: $QUERY
Is this installation code-compliant? If not, what needs to be corrected?"
        else
            echo "⚠️  Gemini CLI not available"
        fi
        ;;
    
    help|*)
        echo "Usage: ./ai-tutor.sh <mode> <query>"
        echo ""
        echo "Modes:"
        echo "  nec <article>     — NEC code lookup"
        echo "  calc <problem>    — Calculation help"
        echo "  quiz <level>      — Practice quiz (apprentice/journeyman/master)"
        echo "  bend <type>       — Conduit bending instructions"
        echo "  code <scenario>   — Code compliance check"
        echo "  help              — Show this help"
        echo ""
        echo "Examples:"
        echo "  ./ai-tutor.sh nec \"Article 310.16\""
        echo "  ./ai-tutor.sh calc \"voltage drop 120V 20A 100ft\""
        echo "  ./ai-tutor.sh quiz journeyman"
        echo "  ./ai-tutor.sh bend \"90-degree 1/2-inch EMT\""
        ;;
esac

echo ""
echo -e "${CYAN}══════════════════════════════════════${RESET}"
echo -e "${GREEN}✓${RESET} May the Force be with your studies! ⚡"
