# 🤖 Claude-DeepSeek Development Protocol

A structured development methodology that combines Claude Code's coordination capabilities with DeepSeek-Coder's technical expertise for building robust web applications.

## 🎯 Overview

This protocol establishes a systematic approach for collaborative AI development, ensuring:
- **Iterative Collaboration**: Claude and DeepSeek complement each other at every phase
- **Informed Decisions**: All technical decisions are based on joint analysis
- **Consistent Quality**: Every suggestion is evaluated before implementation
- **Complete Transparency**: Every consultation and decision is documented

## 🚀 Quick Start

1. **Install Prerequisites**
   ```bash
   # Install Ollama
   brew install ollama
   
   # Download DeepSeek-Coder
   ollama pull deepseek-coder:6.7b
   
   # Start Ollama service
   ollama serve
   ```

2. **Initialize Project Structure**
   ```bash
   mkdir your-project
   cd your-project
   mkdir -p docs/{protocols,prds,tasks,deepseek-consultations}
   ```

3. **Start Development Process**
   - Follow the [Complete Protocol](docs/protocols/claude-deepseek-protocol.md)
   - Use [Quick Reference](docs/protocols/quick-reference.md) for fast lookups

## 📁 Repository Structure

```
claude-deepseek-protocol/
├── README.md                          # This file
├── docs/
│   ├── protocols/
│   │   ├── claude-deepseek-protocol.md    # Complete protocol documentation
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
│   ├── consult-deepseek.sh              # DeepSeek consultation helper
│   └── validate-implementation.sh        # Implementation validation script
└── LICENSE
```

## 🔄 Development Flow

### Phase 1: PRD Creation
1. **Claude** → Initial analysis + draft PRD
2. **DeepSeek** → Technical review (architecture, stack, patterns)
3. **Claude** → Analysis of suggestions
4. **DeepSeek** → Final iteration (resolve conflicts)
5. **Claude** → Optimized final PRD

### Phase 2: Task Generation
1. **Claude** → Initial task list
2. **DeepSeek** → Optimization (order, dependencies, tests)
3. **Claude** → Refined final list

### Phase 3: Implementation
For each complex task:
- **Claude** → DeepSeek (specific implementation)
- **Implement** → **DeepSeek** (code review)

## 🛠️ Key Features

- **Complete Documentation** of every consultation
- **Clear Criteria** for when to consult
- **Specific Templates** for different consultation types  
- **Mandatory Testing** for every functionality
- **Success Metrics** for the protocol

## 📖 Documentation

- [Complete Protocol](docs/protocols/claude-deepseek-protocol.md) - Full methodology
- [Quick Reference](docs/protocols/quick-reference.md) - Fast lookup guide
- [Templates](docs/templates/) - Ready-to-use templates
- [Examples](docs/examples/) - Real-world examples

## 🚀 Getting Started

Ready to start your first project? Check out the [Complete Protocol Guide](docs/protocols/claude-deepseek-protocol.md) to begin.

## 📈 Success Metrics

- **Development Time**: Reduced overall development time
- **Code Quality**: Improved test coverage and quality
- **Post-Implementation Bugs**: Reduced bug count
- **Maintainability**: Easier code maintenance

## 🤝 Contributing

This protocol evolves with each project. Improvements and refinements are welcome!

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

---

**Built for collaborative AI development** 🤖✨