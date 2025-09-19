# 🚀 Quick Reference - Claude-Qwen Protocol

## 📋 Basic Flow

### 1️⃣ PRD
Claude → Qwen 2.5 → Claude → Qwen 2.5 → Claude (Final PRD)

### 2️⃣ Tasks
Claude → Qwen 2.5 → Claude (Final List)

### 3️⃣ Implementation
For each complex task: Claude → Qwen 2.5 → Implement → Review with Qwen 2.5

## 🤖 Key Commands

### Consult Qwen 2.5 Coder (Recommended):
```bash
# Best performance - for complex tasks
ollama run qwen2.5-coder:32b "your question here"

# Resource efficient - for standard tasks
ollama run qwen2.5-coder:7b "your question here"
```

### Legacy DeepSeek Support:
```bash
ollama run deepseek-coder:33b "your question here"
```

### Validate after implementing:
```bash
npm test && npm run lint && npm run type-check
```

## 📝 Quick Templates

### PRD Review:
```
"Review this PRD: [PRD]
Analyze: technical feasibility, architecture, technology stack, performance, design patterns, scalability"
```

### Implementation:
```
"Implement: [task]
Context: [files, stack, constraints]
Include: code, tests, edge cases, best practices, error handling"
```

### Code Review:
```
"Review this code: [code]
Analyze: quality, improvements, optimizations, best practices, security, maintainability"
```

### Large Codebase Analysis:
```
"Analyze this large codebase for [feature integration]:
Context: [architecture overview]
Files: [relevant file list]
Requirements: [feature requirements]
With 64K context, provide: integration strategy, potential conflicts, optimization opportunities"
```

## ✅ Implementation Checklist

- [ ] PRD reviewed with Qwen 2.5 Coder
- [ ] Tasks optimized with Qwen 2.5 Coder
- [ ] Tests included for each feature
- [ ] Code reviewed with Qwen 2.5 Coder
- [ ] Large codebase analysis leveraged (64K context)
- [ ] Consultation documentation updated
- [ ] Technical validation executed

## 🎯 Decision Criteria

### **Consult Qwen 2.5 when:**
- Architecture decisions
- Complex implementations
- Performance optimizations
- Design patterns
- Critical code review
- Multi-language integration (92 languages)
- Large codebase analysis (64K context)
- Modern framework implementation

### **Use 32B model for:**
- Complex architecture decisions
- Large codebase analysis
- Performance-critical implementations
- Multi-step reasoning tasks

### **Use 7B model for:**
- Quick code reviews
- Simple implementations
- Standard debugging
- Resource-constrained environments

### **DON'T consult for:**
- Administrative tasks
- Text/content changes
- Basic configuration
- Trivial styling
- Simple debugging

## 🏆 Model Performance (2025)

### **Qwen 2.5 Coder Advantages:**
- **HumanEval**: 88.4% (beats GPT-4's 87.1%)
- **Context**: 64K tokens (excellent for large codebases)
- **Speed**: Superior inference performance
- **Languages**: 92 programming languages
- **Resource**: 6.3GB (7B) / 19GB (32B)

### **When to use DeepSeek (Legacy):**
- Existing workflows with DeepSeek dependencies
- Need for 338+ programming languages
- Team already trained on DeepSeek protocols

## 🔄 Migration Quick Commands

```bash
# Install both models for comparison
ollama pull qwen2.5-coder:32b
ollama pull qwen2.5-coder:7b

# Update existing consultation scripts
# Replace: ollama run deepseek-coder:6.7b
# With:    ollama run qwen2.5-coder:32b
```

---
**Protocol locations:**
- **New**: `/docs/protocols/claude-qwen-protocol.md`
- **Legacy**: `/docs/protocols/claude-deepseek-protocol.md`