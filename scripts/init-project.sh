#!/bin/bash

# Claude-DeepSeek Protocol Project Initialization Script
# This script sets up the directory structure for a new project following the protocol

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: ./init-project.sh <project-name>"
    echo "Example: ./init-project.sh my-web-app"
    exit 1
fi

echo "🚀 Initializing project: $PROJECT_NAME"

# Create main project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Create protocol directories
mkdir -p docs/{prds,tasks,deepseek-consultations}
mkdir -p src/{components,services,utils}
mkdir -p tests/{unit,integration,e2e}

# Initialize git repository
git init

# Create basic README
cat > README.md << EOF
# $PROJECT_NAME

Project developed using the Claude-DeepSeek Protocol.

## 📋 Protocol Documentation
- [PRDs](docs/prds/) - Product Requirement Documents
- [Tasks](docs/tasks/) - Implementation task lists
- [Consultations](docs/deepseek-consultations/) - DeepSeek consultation logs

## 🚀 Development Flow
This project follows the [Claude-DeepSeek Protocol](https://github.com/griederer/claude-deepseek-protocol) for structured AI-assisted development.

### Phase 1: PRD Creation
- Claude creates initial PRD
- DeepSeek reviews for technical feasibility
- Claude refines based on feedback

### Phase 2: Task Planning
- Claude generates task list from PRD
- DeepSeek optimizes implementation order
- Claude finalizes task breakdown

### Phase 3: Implementation
- For each complex task: Claude → DeepSeek consultation
- Implement with tests
- DeepSeek code review

## 📁 Project Structure
\`\`\`
$PROJECT_NAME/
├── docs/
│   ├── prds/                    # Product Requirements
│   ├── tasks/                   # Task breakdowns
│   └── deepseek-consultations/  # Consultation logs
├── src/
│   ├── components/              # UI Components
│   ├── services/                # Business logic
│   └── utils/                   # Utility functions
└── tests/
    ├── unit/                    # Unit tests
    ├── integration/             # Integration tests
    └── e2e/                     # End-to-end tests
\`\`\`

## 🛠️ Getting Started
1. Review the PRD in \`docs/prds/\`
2. Check the implementation tasks in \`docs/tasks/\`
3. Follow the development protocol for each task

---
**Protocol**: [Claude-DeepSeek Protocol](https://github.com/griederer/claude-deepseek-protocol)
EOF

# Create basic package.json if it's a Node.js project
cat > package.json << EOF
{
  "name": "$PROJECT_NAME",
  "version": "1.0.0",
  "description": "Project developed using Claude-DeepSeek Protocol",
  "main": "index.js",
  "scripts": {
    "test": "jest",
    "lint": "eslint src/",
    "type-check": "tsc --noEmit",
    "dev": "echo 'Add your dev command here'",
    "build": "echo 'Add your build command here'"
  },
  "keywords": ["claude-deepseek-protocol"],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "jest": "^29.0.0",
    "eslint": "^8.0.0",
    "typescript": "^5.0.0"
  }
}
EOF

# Create .gitignore
cat > .gitignore << EOF
node_modules/
dist/
build/
.env
.env.local
.env.development.local
.env.test.local
.env.production.local
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.DS_Store
*.log
coverage/
.nyc_output/
EOF

echo "✅ Project $PROJECT_NAME initialized successfully!"
echo ""
echo "📁 Directory structure created:"
echo "   - docs/ (PRDs, tasks, consultations)"
echo "   - src/ (source code)"
echo "   - tests/ (test files)"
echo ""
echo "🎯 Next steps:"
echo "   1. cd $PROJECT_NAME"
echo "   2. Start with PRD creation following the protocol"
echo "   3. Consult DeepSeek for technical review"
echo "   4. Generate and optimize task list"
echo "   5. Begin implementation"
echo ""
echo "📖 Protocol documentation: https://github.com/griederer/claude-deepseek-protocol"