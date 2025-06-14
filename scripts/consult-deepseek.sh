#!/bin/bash

# Claude-DeepSeek Protocol Consultation Helper
# This script facilitates consultations with DeepSeek-Coder

QUESTION="$1"
CONSULTATION_TYPE="$2"
OUTPUT_FILE="$3"

if [ -z "$QUESTION" ]; then
    echo "Usage: ./consult-deepseek.sh '<question>' [consultation-type] [output-file]"
    echo ""
    echo "Examples:"
    echo "  ./consult-deepseek.sh 'Review this PRD for technical feasibility' 'prd-review'"
    echo "  ./consult-deepseek.sh 'Optimize this task list' 'task-optimization' 'consultation-log.md'"
    echo ""
    echo "Consultation types:"
    echo "  - prd-review: For PRD technical review"
    echo "  - task-optimization: For task list optimization"
    echo "  - implementation: For implementation guidance"
    echo "  - code-review: For code review"
    echo "  - architecture: For architectural decisions"
    exit 1
fi

# Check if Ollama is running
if ! pgrep -x "ollama" > /dev/null; then
    echo "⚠️  Ollama is not running. Starting Ollama..."
    ollama serve &
    sleep 3
fi

# Check if DeepSeek model is available
if ! ollama list | grep -q "deepseek-coder"; then
    echo "⚠️  DeepSeek-Coder model not found. Installing..."
    ollama pull deepseek-coder:6.7b
fi

echo "🤖 Consulting DeepSeek-Coder..."
echo "📝 Question: $QUESTION"
echo "🔍 Type: ${CONSULTATION_TYPE:-general}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Prepare consultation with context based on type
case "$CONSULTATION_TYPE" in
    "prd-review")
        FULL_QUESTION="As an expert software developer, review this PRD for technical feasibility, architecture recommendations, and implementation considerations:

$QUESTION

Please provide:
- Technical feasibility assessment
- Recommended architecture patterns
- Technology stack suggestions
- Potential implementation challenges
- Performance and scalability considerations
- Testing strategy recommendations

Format your response in clear sections."
        ;;
    "task-optimization")
        FULL_QUESTION="As an expert software developer, optimize this task list for implementation:

$QUESTION

Please suggest:
- Optimal implementation order
- Missing dependencies between tasks
- Additional necessary tasks (tests, configuration, etc.)
- Complexity estimation per task (1-5 scale)
- Potential technical blockers
- Best practices to follow

Focus especially on testing and maintainability."
        ;;
    "implementation")
        FULL_QUESTION="As an expert software developer, provide implementation guidance:

$QUESTION

Please provide:
- Specific implementation approach
- Code patterns and best practices
- Error handling strategies
- Testing approach
- Performance considerations
- Security considerations (if applicable)

Include specific code examples where helpful."
        ;;
    "code-review")
        FULL_QUESTION="As an expert software developer, review this code:

$QUESTION

Please analyze:
- Code quality and style
- Potential improvements
- Performance optimizations
- Security considerations
- Test coverage suggestions
- Maintainability aspects

Provide specific suggestions for improvement."
        ;;
    "architecture")
        FULL_QUESTION="As an expert software architect, provide architectural guidance:

$QUESTION

Please recommend:
- Architectural patterns
- Component structure
- Data flow design
- State management approach
- Scalability considerations
- Testing architecture

Explain the rationale for your recommendations."
        ;;
    *)
        FULL_QUESTION="$QUESTION"
        ;;
esac

# Execute consultation
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
RESPONSE=$(ollama run deepseek-coder:6.7b "$FULL_QUESTION")

# Display response
echo "$RESPONSE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Consultation completed at $TIMESTAMP"

# Save to file if specified
if [ -n "$OUTPUT_FILE" ]; then
    cat >> "$OUTPUT_FILE" << EOF
## Consultation: ${CONSULTATION_TYPE:-General} - $TIMESTAMP

### 🤖 Claude Question:
\`\`\`
$QUESTION
\`\`\`

### 🧠 DeepSeek Response:
\`\`\`
$RESPONSE
\`\`\`

### 📋 Next Steps:
- [ ] Analyze response
- [ ] Make implementation decisions
- [ ] Document decisions made
- [ ] Update relevant files

---

EOF
    echo "📄 Consultation saved to: $OUTPUT_FILE"
fi

echo ""
echo "🎯 Next steps:"
echo "   1. Analyze the response carefully"
echo "   2. Make decisions based on suggestions"
echo "   3. Document your decisions"
echo "   4. Implement following the guidance"