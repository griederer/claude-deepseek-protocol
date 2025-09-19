# 🤖 Claude-Qwen Development Protocol

A structured development methodology that combines Claude Code's coordination capabilities with Qwen 2.5 Coder's technical expertise for building robust web applications.

## 🎯 Overview

This protocol establishes a systematic approach for collaborative AI development, ensuring:
- **Iterative Collaboration**: Claude and Qwen complement each other at every phase
- **Informed Decisions**: All technical decisions are based on joint analysis
- **Consistent Quality**: Every suggestion is evaluated before implementation
- **Complete Transparency**: Every consultation and decision is documented

## 🚀 Quick Start

1. **Install Prerequisites**
   ```bash
   # Install Ollama
   brew install ollama

   # Download Qwen 2.5 Coder (Recommended - Best coding model 2025)
   ollama pull qwen2.5-coder:32b  # For high-end hardware (32GB+ RAM)
   ollama pull qwen2.5-coder:7b   # For standard hardware (8-16GB RAM)

   # Alternative: DeepSeek-Coder (Legacy support)
   ollama pull deepseek-coder:33b

   # Start Ollama service
   ollama serve
   ```

2. **Initialize Project Structure**
   ```bash
   mkdir your-project
   cd your-project
   mkdir -p docs/{protocols,prds,tasks,ai-consultations}
   ```

3. **Start Development Process**
   - Follow the [Complete Protocol](docs/protocols/claude-qwen-protocol.md)
   - Use [Quick Reference](docs/protocols/quick-reference.md) for fast lookups

## 📁 Repository Structure

```
claude-qwen-protocol/
├── README.md                          # This file
├── docs/
│   ├── protocols/
│   │   ├── claude-qwen-protocol.md       # Complete protocol documentation
│   │   ├── claude-deepseek-protocol.md   # Legacy DeepSeek protocol
│   │   └── quick-reference.md             # Quick reference guide
│   ├── templates/
│   │   ├── prd-template.md               # PRD template
│   │   ├── tasks-template.md             # Tasks template
│   │   └── consultation-template.md      # Consultation log template
│   └── examples/
│       ├── sample-prd.md                 # Example PRD
│       ├── sample-tasks.md               # Example task list
│       └── sample-consultation.md        # Example consultation log
├── scripts/
│   ├── init-project.sh                   # Project initialization script
│   ├── consult-qwen.sh                   # Qwen consultation helper
│   ├── consult-deepseek.sh              # DeepSeek consultation helper (legacy)
│   └── validate-implementation.sh        # Implementation validation script
└── LICENSE
```

## 🔄 Development Flow

### Phase 1: PRD Creation
1. **Claude** → Initial analysis + draft PRD
2. **Qwen 2.5 Coder** → Technical review (architecture, stack, patterns)
3. **Claude** → Analysis of suggestions
4. **Qwen 2.5 Coder** → Final iteration (resolve conflicts)
5. **Claude** → Optimized final PRD

### Phase 2: Task Generation
1. **Claude** → Initial task list
2. **Qwen 2.5 Coder** → Optimization (order, dependencies, tests)
3. **Claude** → Refined final list

### Phase 3: Implementation
For each complex task:
- **Claude** → Qwen (specific implementation)
- **Implement** → **Qwen** (code review)

## 🛠️ Key Features

- **Complete Documentation** of every consultation
- **Clear Criteria** for when to consult
- **Specific Templates** for different consultation types
- **Mandatory Testing** for every functionality
- **Success Metrics** for the protocol

## 🏆 Model Comparison (2025 Update)

### **Qwen 2.5 Coder** (Recommended)
- **HumanEval**: 88.4% (beats GPT-4's 87.1%)
- **Context**: 64K tokens (excellent for large codebases)
- **Languages**: 92 programming languages
- **Performance**: Superior speed and efficiency
- **Resource**: 6.3GB RAM (7B) / 19GB RAM (32B)

### **DeepSeek-Coder** (Legacy)
- **HumanEval**: ~81% (good but surpassed)
- **Languages**: 338 programming languages
- **Performance**: Slower, inconsistent practical results
- **Status**: Maintained for compatibility

### **Recommendation**: Use Qwen 2.5 Coder for new projects, DeepSeek for existing workflows.

## 📖 Documentation

- [Complete Protocol](docs/protocols/claude-qwen-protocol.md) - Full methodology
- [Legacy DeepSeek Protocol](docs/protocols/claude-deepseek-protocol.md) - Original methodology
- [Quick Reference](docs/protocols/quick-reference.md) - Fast lookup guide
- [Templates](docs/templates/) - Ready-to-use templates
- [Examples](docs/examples/) - Real-world examples

## 🚀 Getting Started

Ready to start your first project? Check out the [Complete Protocol Guide](docs/protocols/claude-qwen-protocol.md) to begin.

## 📈 Success Metrics

- **Development Time**: Reduced overall development time
- **Code Quality**: Improved test coverage and quality
- **Post-Implementation Bugs**: Reduced bug count
- **Maintainability**: Easier code maintenance

## 🔄 Migration from DeepSeek

Existing users can easily migrate:

```bash
# Install Qwen 2.5 Coder
ollama pull qwen2.5-coder:32b

# Update consultation commands
# Old: ollama run deepseek-coder:6.7b "your question"
# New: ollama run qwen2.5-coder:32b "your question"
```

All protocols remain the same - only the model changes!

## 🤝 Contributing

This protocol evolves with each project. Improvements and refinements are welcome!

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

---

**Built for collaborative AI development with the best 2025 models** 🤖✨