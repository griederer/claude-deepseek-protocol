#!/bin/bash

# Claude-DeepSeek Protocol Implementation Validation Script
# Runs comprehensive validation after implementation

PROJECT_DIR=${1:-.}
cd "$PROJECT_DIR"

echo "🔍 Running implementation validation..."
echo "📁 Project directory: $(pwd)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Initialize counters
TOTAL_CHECKS=0
PASSED_CHECKS=0
FAILED_CHECKS=0

# Function to run check and track results
run_check() {
    local check_name="$1"
    local check_command="$2"
    local is_critical="$3"
    
    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
    
    echo "🧪 $check_name"
    
    if eval "$check_command" > /dev/null 2>&1; then
        echo "   ✅ PASSED"
        PASSED_CHECKS=$((PASSED_CHECKS + 1))
        return 0
    else
        echo "   ❌ FAILED"
        FAILED_CHECKS=$((FAILED_CHECKS + 1))
        
        if [ "$is_critical" = "true" ]; then
            echo "   🚨 CRITICAL FAILURE - Implementation may be incomplete"
        fi
        
        # Show error details
        echo "   📋 Error details:"
        eval "$check_command" 2>&1 | sed 's/^/      /'
        return 1
    fi
}

# Check if package.json exists
if [ -f "package.json" ]; then
    HAS_NPM=true
    echo "📦 Node.js project detected"
else
    HAS_NPM=false
    echo "📦 Non-Node.js project detected"
fi

# 1. Test Execution
echo ""
echo "🧪 Running Tests..."
echo "─────────────────────"

if [ "$HAS_NPM" = true ]; then
    if npm list jest > /dev/null 2>&1; then
        run_check "Unit Tests (Jest)" "npm test" true
    elif npm list vitest > /dev/null 2>&1; then
        run_check "Unit Tests (Vitest)" "npm run test" true
    else
        echo "🧪 Unit Tests"
        echo "   ⚠️  SKIPPED - No test framework detected"
        TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
    fi
    
    # Check for test files
    if find . -name "*.test.*" -o -name "*.spec.*" | grep -q .; then
        run_check "Test Files Present" "find . -name '*.test.*' -o -name '*.spec.*' | grep -q ." false
    else
        echo "🧪 Test Files Present"
        echo "   ⚠️  WARNING - No test files found"
        TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
    fi
else
    echo "🧪 Tests"
    echo "   ⚠️  SKIPPED - Non-Node.js project"
fi

# 2. Code Quality Checks
echo ""
echo "📝 Code Quality Checks..."
echo "──────────────────────────"

if [ "$HAS_NPM" = true ]; then
    # ESLint
    if npm list eslint > /dev/null 2>&1; then
        run_check "ESLint" "npm run lint" false
    elif which eslint > /dev/null 2>&1; then
        run_check "ESLint" "eslint src/" false
    else
        echo "📝 ESLint"
        echo "   ⚠️  SKIPPED - ESLint not configured"
    fi
    
    # TypeScript type checking
    if npm list typescript > /dev/null 2>&1; then
        if [ -f "tsconfig.json" ]; then
            run_check "TypeScript Type Check" "npx tsc --noEmit" true
        else
            echo "📝 TypeScript Type Check"
            echo "   ⚠️  SKIPPED - No tsconfig.json found"
        fi
    else
        echo "📝 TypeScript Type Check"
        echo "   ⚠️  SKIPPED - TypeScript not installed"
    fi
    
    # Prettier
    if npm list prettier > /dev/null 2>&1; then
        run_check "Code Formatting (Prettier)" "npx prettier --check ." false
    else
        echo "📝 Code Formatting"
        echo "   ⚠️  SKIPPED - Prettier not configured"
    fi
fi

# 3. Build Process
echo ""
echo "🏗️  Build Process..."
echo "──────────────────────"

if [ "$HAS_NPM" = true ]; then
    if grep -q '"build"' package.json; then
        run_check "Build Process" "npm run build" true
    else
        echo "🏗️  Build Process"
        echo "   ⚠️  SKIPPED - No build script configured"
    fi
fi

# 4. Documentation Checks
echo ""
echo "📚 Documentation Checks..."
echo "───────────────────────────"

run_check "README.md exists" "[ -f README.md ]" false
run_check "PRD documentation exists" "[ -d docs/prds ] && [ -n \"\$(ls -A docs/prds 2>/dev/null)\" ]" true
run_check "Task documentation exists" "[ -d docs/tasks ] && [ -n \"\$(ls -A docs/tasks 2>/dev/null)\" ]" true
run_check "DeepSeek consultations documented" "[ -d docs/deepseek-consultations ] && [ -n \"\$(ls -A docs/deepseek-consultations 2>/dev/null)\" ]" false

# 5. Git Status
echo ""
echo "🔄 Git Status..."
echo "─────────────────"

if [ -d ".git" ]; then
    run_check "Git repository initialized" "[ -d .git ]" false
    
    # Check for uncommitted changes
    if git diff --quiet && git diff --cached --quiet; then
        echo "🔄 Working directory clean"
        echo "   ✅ CLEAN"
        PASSED_CHECKS=$((PASSED_CHECKS + 1))
    else
        echo "🔄 Working directory clean"
        echo "   ⚠️  UNCOMMITTED CHANGES"
        echo "   📋 Uncommitted files:"
        git status --porcelain | sed 's/^/      /'
    fi
    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
else
    echo "🔄 Git repository"
    echo "   ⚠️  SKIPPED - Not a git repository"
fi

# 6. Security Checks
echo ""
echo "🔒 Security Checks..."
echo "──────────────────────"

if [ "$HAS_NPM" = true ]; then
    run_check "npm audit" "npm audit --audit-level moderate" false
    
    # Check for .env files in git
    if git ls-files | grep -q "\.env$"; then
        echo "🔒 Environment files in git"
        echo "   ❌ SECURITY RISK - .env files should not be committed"
        FAILED_CHECKS=$((FAILED_CHECKS + 1))
    else
        echo "🔒 Environment files in git"
        echo "   ✅ SECURE"
        PASSED_CHECKS=$((PASSED_CHECKS + 1))
    fi
    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
fi

# Summary
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Validation Summary"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Total Checks: $TOTAL_CHECKS"
echo "✅ Passed: $PASSED_CHECKS"
echo "❌ Failed: $FAILED_CHECKS"

if [ $FAILED_CHECKS -eq 0 ]; then
    echo ""
    echo "🎉 ALL VALIDATIONS PASSED!"
    echo "✨ Implementation is ready for deployment"
    exit 0
elif [ $FAILED_CHECKS -le 2 ]; then
    echo ""
    echo "⚠️  MINOR ISSUES DETECTED"
    echo "🔧 Please address the failed checks above"
    exit 1
else
    echo ""
    echo "🚨 SIGNIFICANT ISSUES DETECTED"
    echo "🔧 Multiple validations failed - review implementation"
    exit 2
fi