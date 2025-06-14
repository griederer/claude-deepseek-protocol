# 🚀 Quick Reference - Claude-DeepSeek Protocol

## 📋 Basic Flow

### 1️⃣ PRD
Claude → DeepSeek → Claude → DeepSeek → Claude (Final PRD)

### 2️⃣ Tasks  
Claude → DeepSeek → Claude (Final List)

### 3️⃣ Implementation
For each complex task: Claude → DeepSeek → Implement → Review with DeepSeek

## 🤖 Key Commands

### Consult DeepSeek:
```bash
ollama run deepseek-coder:6.7b "your question here"
```

### Validate after implementing:
```bash
npm test && npm run lint && npm run type-check
```

## 📝 Quick Templates

### PRD Review:
```
"Review this PRD: [PRD]
Analyze: technical feasibility, architecture, technology stack, performance, design patterns"
```

### Implementation:
```
"Implement: [task]
Context: [files, stack, constraints]
Include: code, tests, edge cases, best practices"
```

### Code Review:
```
"Review this code: [code]
Analyze: quality, improvements, optimizations, best practices"
```

## ✅ Implementation Checklist

- [ ] PRD reviewed with DeepSeek
- [ ] Tasks optimized with DeepSeek  
- [ ] Tests included for each feature
- [ ] Code reviewed with DeepSeek
- [ ] Consultation documentation updated
- [ ] Technical validation executed

## 🎯 Decision Criteria

**Consult DeepSeek when:**
- Architecture
- Complex implementations
- Performance
- Design patterns
- Critical code review

**DON'T consult for:**
- Administrative tasks
- Text changes
- Basic configuration
- Simple debugging

---
**Complete protocol location:** `/docs/protocols/claude-deepseek-protocol.md`