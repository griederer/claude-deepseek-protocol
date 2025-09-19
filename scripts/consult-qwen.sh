#!/bin/bash

# 🤖 Claude-Qwen Protocol Consultation Helper
#
# This script provides easy access to Qwen 2.5 Coder consultations
# with automatic model selection based on query complexity and system resources

set -e

# Configuration
QWEN_32B="qwen2.5-coder:32b"
QWEN_7B="qwen2.5-coder:7b"
LOG_DIR="docs/ai-consultations"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[QWEN-PROTOCOL]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check available RAM
check_ram() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        local total_ram=$(sysctl -n hw.memsize)
        local total_gb=$((total_ram / 1024 / 1024 / 1024))
        echo $total_gb
    else
        # Linux
        local total_ram=$(grep MemTotal /proc/meminfo | awk '{print $2}')
        local total_gb=$((total_ram / 1024 / 1024))
        echo $total_gb
    fi
}

# Function to select appropriate model
select_model() {
    local query_length=${#1}
    local available_ram=$(check_ram)

    print_status "Query length: $query_length characters"
    print_status "Available RAM: ${available_ram}GB"

    # Auto-select model based on query complexity and available resources
    if [[ $available_ram -ge 32 && $query_length -gt 500 ]]; then
        echo $QWEN_32B
        print_status "Selected: Qwen 2.5 Coder 32B (complex query + sufficient RAM)"
    elif [[ $available_ram -ge 16 ]]; then
        echo $QWEN_7B
        print_status "Selected: Qwen 2.5 Coder 7B (standard configuration)"
    else
        print_warning "Low RAM detected (${available_ram}GB). Consider using 7B model."
        echo $QWEN_7B
    fi
}

# Function to create consultation log
log_consultation() {
    local model=$1
    local query=$2
    local response=$3
    local log_file="$LOG_DIR/consultation_${TIMESTAMP}.md"

    # Create log directory if it doesn't exist
    mkdir -p "$LOG_DIR"

    cat > "$log_file" << EOF
# Qwen 2.5 Coder Consultation - $(date)

## Model Used
$model

## Query
\`\`\`
$query
\`\`\`

## Response
\`\`\`
$response
\`\`\`

## Metadata
- Timestamp: $(date -Iseconds)
- Query Length: ${#query} characters
- Response Length: ${#response} characters
- System: $(uname -s) $(uname -r)
EOF

    print_success "Consultation logged: $log_file"
}

# Function to check if Ollama is running
check_ollama() {
    if ! pgrep -x "ollama" > /dev/null; then
        print_error "Ollama is not running. Please start it with: ollama serve"
        exit 1
    fi
}

# Function to check if model is available
check_model() {
    local model=$1
    if ! ollama list | grep -q "$model"; then
        print_warning "Model $model not found. Would you like to pull it? (y/N)"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            print_status "Pulling $model..."
            ollama pull "$model"
        else
            print_error "Model $model is required. Exiting."
            exit 1
        fi
    fi
}

# Function to display help
show_help() {
    cat << EOF
🤖 Claude-Qwen Protocol Consultation Helper

USAGE:
    $0 [OPTIONS] "your question here"
    $0 [OPTIONS] -f query_file.txt

OPTIONS:
    -m, --model MODEL    Force specific model (32b, 7b, or full name)
    -l, --log           Enable consultation logging (default: enabled)
    -n, --no-log        Disable consultation logging
    -q, --quiet         Suppress status messages
    -f, --file FILE     Read query from file
    -h, --help          Show this help message

EXAMPLES:
    # Simple consultation
    $0 "Review this React component for performance issues"

    # Force 32B model for complex analysis
    $0 -m 32b "Analyze this large codebase architecture"

    # Read query from file
    $0 -f architecture_review.txt

    # Quiet mode with no logging
    $0 -q -n "Quick code review question"

MODELS:
    32b     - qwen2.5-coder:32b (best for complex tasks)
    7b      - qwen2.5-coder:7b  (efficient for standard tasks)

For more information, see: docs/protocols/claude-qwen-protocol.md
EOF
}

# Parse command line arguments
QUERY=""
MODEL=""
ENABLE_LOG=true
QUIET=false
FILE_INPUT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -m|--model)
            case $2 in
                32b) MODEL=$QWEN_32B ;;
                7b) MODEL=$QWEN_7B ;;
                *) MODEL=$2 ;;
            esac
            shift 2
            ;;
        -l|--log)
            ENABLE_LOG=true
            shift
            ;;
        -n|--no-log)
            ENABLE_LOG=false
            shift
            ;;
        -q|--quiet)
            QUIET=true
            shift
            ;;
        -f|--file)
            FILE_INPUT=$2
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        --)
            shift
            break
            ;;
        -*)
            print_error "Unknown option: $1"
            echo "Use -h for help"
            exit 1
            ;;
        *)
            QUERY="$*"
            break
            ;;
    esac
done

# Read query from file if specified
if [[ -n "$FILE_INPUT" ]]; then
    if [[ -f "$FILE_INPUT" ]]; then
        QUERY=$(cat "$FILE_INPUT")
        [[ $QUIET == false ]] && print_status "Query loaded from file: $FILE_INPUT"
    else
        print_error "File not found: $FILE_INPUT"
        exit 1
    fi
fi

# Validate query
if [[ -z "$QUERY" ]]; then
    print_error "No query provided. Use -h for help."
    exit 1
fi

# Main execution
main() {
    [[ $QUIET == false ]] && print_status "Starting Qwen 2.5 Coder consultation..."

    # Check prerequisites
    check_ollama

    # Select model if not specified
    if [[ -z "$MODEL" ]]; then
        MODEL=$(select_model "$QUERY")
    fi

    # Check if model is available
    check_model "$MODEL"

    [[ $QUIET == false ]] && print_status "Consulting $MODEL..."
    [[ $QUIET == false ]] && echo ""

    # Execute consultation
    local response
    response=$(ollama run "$MODEL" "$QUERY" 2>&1)
    local exit_code=$?

    if [[ $exit_code -eq 0 ]]; then
        echo "$response"

        # Log consultation if enabled
        if [[ $ENABLE_LOG == true ]]; then
            log_consultation "$MODEL" "$QUERY" "$response"
        fi

        [[ $QUIET == false ]] && echo ""
        [[ $QUIET == false ]] && print_success "Consultation completed successfully"
    else
        print_error "Consultation failed with exit code: $exit_code"
        print_error "Response: $response"
        exit $exit_code
    fi
}

# Run main function
main