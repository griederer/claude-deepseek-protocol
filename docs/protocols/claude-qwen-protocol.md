# 🤖 Claude-Qwen Development Protocol

## 📋 Overview

This protocol establishes a systematic collaboration methodology between Claude Code and Qwen 2.5 Coder for building robust web applications. It combines Claude's coordination and analysis capabilities with Qwen's superior technical expertise to create a structured development workflow.

### 🎯 Core Philosophy

1. **Iterative Collaboration**: Claude and Qwen complement each other at every phase
2. **Informed Decisions**: All technical decisions are based on joint analysis
3. **Consistent Quality**: Every suggestion is evaluated before implementation
4. **Complete Transparency**: Every consultation and decision is documented

## 🔄 Collaboration Flow: Claude ↔ Qwen 2.5 Coder

### Phase 1: PRD Creation

#### 1.1 Claude - Initial Analysis
```
Process:
1. Gather user requirements
2. Ask clarifying questions
3. Create initial PRD draft
4. Identify areas requiring specific technical expertise
```

#### 1.2 Qwen 2.5 Coder - Technical Review
```
Qwen Consultation:
"Review this PRD for a web application:
[Complete PRD]

Please analyze:
- Technical feasibility of each requirement
- Best architecture practices applicable
- Potential implementation challenges
- Technology stack suggestions
- Performance and scalability considerations
- Recommended design patterns

Format your response in clear sections."
```

#### 1.3 Claude - Qwen Response Analysis
```
Process:
1. Evaluate each Qwen suggestion
2. Identify conflicts or inconsistencies
3. Prepare list of points for second consultation
4. Document preliminary decisions
```

#### 1.4 Qwen 2.5 Coder - Final Iteration
```
Follow-up Consultation:
"Based on your previous analysis, I have these specific questions:
[List of specific points]

Additionally, I found these possible inconsistencies:
[Conflict points if any]

Could you clarify and provide final recommendations?"
```

#### 1.5 Claude - Final PRD
```
Process:
1. Integrate all validated suggestions
2. Create optimized final PRD
3. Document technical decisions made
4. Save to `/docs/prds/prd-[feature-name].md`
5. Create consultation log in `/docs/ai-consultations/prd-[feature-name]-consultation.md`
```

### Phase 2: Task Generation

#### 2.1 Claude - Initial Task List
```
Process:
1. Generate tasks based on final PRD
2. Identify complex tasks requiring technical consultation
3. Create preliminary task structure
```

#### 2.2 Qwen 2.5 Coder - Implementation Optimization
```
Qwen Consultation:
"To implement this PRD, I've created this task list:
[Task list]

Please suggest:
- Optimal implementation order
- Dependencies between tasks I might have missed
- Additional necessary tasks (tests, configuration, etc.)
- Complexity estimation per task (1-5)
- Potential technical blockers

Focus especially on testing and best practices."
```

#### 2.3 Claude - Final Tasks
```
Process:
1. Refine task list with Qwen suggestions
2. Ensure each task includes tests
3. Verify logical implementation order
4. Save to `/docs/tasks/tasks-[feature-name].md`
```

### Phase 3: Implementation

#### 3.1 Implementation Consultations
```
For each complex task, Claude consults:
"I'm implementing the task: [task description]

Context:
- Existing files: [list]
- Technology stack: [stack]
- Constraints: [constraints]

I need:
- Specific recommended implementation
- Code patterns to follow
- Edge cases to consider
- Corresponding test structure

Provide specific code and explanations."
```

#### 3.2 Code Review
```
After implementing, Claude consults:
"I've implemented this functionality:
[implemented code]

Please review:
- Code quality
- Possible improvements
- Uncovered edge cases
- Performance optimizations
- Best practices compliance

Is there anything I should refactor before continuing?"
```

## 📝 Consultation Templates

### Architecture Consultation
```
Consultation: Architecture for [feature]

Context:
- Application type: [web app/mobile/desktop]
- Current stack: [technologies]
- Requirements: [list]
- Constraints: [limitations]

I need:
- Recommended architectural pattern
- Directory structure
- Responsibility separation
- State management
- Testing strategy
```

### Implementation Consultation
```
Consultation: Implementation of [specific functionality]

Current code:
[existing code if applicable]

Requirements:
- [requirement 1]
- [requirement 2]

I need:
- Complete implementation
- Error handling
- Unit tests
- Inline documentation
```

### Performance Optimization Consultation
```
Consultation: Optimization of [component/function]

Current code:
[code to optimize]

Identified problems:
- [problem 1]
- [problem 2]

I need:
- Optimized version
- Explanation of improvements
- Expected performance metrics
- Tests to validate optimization
```

### Large Codebase Analysis
```
Consultation: Large codebase analysis for [feature]

Context:
- Codebase size: [LOC/files]
- Tech stack: [technologies]
- Current architecture: [description]

With your 64K token context window, please analyze:
- Integration points for new feature
- Potential conflicts with existing code
- Refactoring opportunities
- Breaking change considerations
```

## 📊 Consultation Documentation

### Consultation Log Structure
```markdown
# Qwen 2.5 Coder Consultations - [Feature Name]

## Consultation 1: [Topic] - [Date]
### Question:
[complete question sent]

### Qwen Response:
[complete response]

### Claude Decision:
[what was decided to implement and why]

### Affected Files:
- [list of modified files]

---
```

## 🔧 Protocol Commands

### Initialize Protocol
```bash
# Claude executes at the start of each project
mkdir -p docs/{protocols,prds,tasks,ai-consultations}
```

### Consult Qwen 2.5 Coder
```bash
# Primary command - Use 32B for complex tasks
ollama run qwen2.5-coder:32b "[specific question]"

# Alternative for resource constraints - Use 7B
ollama run qwen2.5-coder:7b "[specific question]"

# Legacy support - DeepSeek for existing workflows
ollama run deepseek-coder:33b "[specific question]"
```

### Validate Implementation
```bash
# Commands Claude executes after each implementation
npm test
npm run lint
npm run type-check
```

## 🎯 Decision Criteria

### When to Consult Qwen:
- ✅ Architecture decisions
- ✅ Complex implementations
- ✅ Performance optimizations
- ✅ Specific design patterns
- ✅ Critical code review
- ✅ Testing strategies
- ✅ Large codebase analysis (leverage 64K context)
- ✅ Multi-language integration (92 languages supported)

### When NOT to Consult:
- ❌ Simple administrative tasks
- ❌ Text/content changes
- ❌ Basic configuration
- ❌ Simple debugging
- ❌ Trivial CSS styling

### Criteria for Accepting Suggestions:
1. **Requirement Alignment**: Does it meet PRD objectives?
2. **Maintainability**: Is it easy to maintain and extend?
3. **Performance**: Does it improve or maintain performance?
4. **Testability**: Is it easy to test?
5. **Consistency**: Is it consistent with the rest of the codebase?
6. **Modern Best Practices**: Does it follow 2025 coding standards?

## 🚨 Emergency Protocols

### If Qwen gives inconsistent responses:
1. Reformulate the question with more context
2. Break the consultation into more specific questions
3. Consult about specific inconsistency points
4. Try alternative model (32B ↔ 7B) for comparison
5. Document the inconsistency and decide based on best practices

### If there are conflicting suggestions:
1. Evaluate each option against decision criteria
2. Consult Qwen about the specific conflict
3. Prioritize consistency with existing codebase
4. Consider performance implications (Qwen excels at optimization)
5. Document the decision and rationale

### Performance Issues with Model:
1. Switch from 32B to 7B if response time is critical
2. Break complex queries into simpler parts
3. Use caching for repeated consultation patterns
4. Monitor system resources and adjust accordingly

## 📈 Protocol Success Metrics

### Process KPIs:
- **Development Time**: Is total time reduced compared to DeepSeek?
- **Code Quality**: Is test coverage and quality improved?
- **Post-Implementation Bugs**: Are bugs reduced?
- **Maintainability**: Is code easier to maintain?
- **Context Utilization**: Are we leveraging the 64K context effectively?

### Model Performance Metrics:
- **Response Accuracy**: Quality of Qwen's suggestions vs. DeepSeek
- **Context Understanding**: How well Qwen handles large codebases
- **Speed**: Token generation speed comparison
- **Resource Usage**: Memory and CPU utilization

### Protocol Review:
- Evaluate effectiveness every 5 implemented features
- Compare against DeepSeek baseline metrics
- Adjust consultations based on Qwen's strengths
- Document protocol improvements and model preferences

## 🔄 Migration from DeepSeek

### Immediate Benefits:
- **Better Code Quality**: 88.4% vs 81% HumanEval score
- **Faster Responses**: Optimized inference speed
- **Better Context**: 64K tokens vs limited context
- **More Languages**: 92 vs limited language support

### Transition Strategy:
1. Run parallel consultations for first 3 features
2. Compare response quality and implementation success
3. Gradually phase out DeepSeek consultations
4. Update all templates and scripts to use Qwen
5. Document performance improvements

---

**Note**: This protocol leverages Qwen 2.5 Coder's superior performance in 2025. The methodology remains the same while benefiting from significant improvements in code quality, speed, and context understanding.