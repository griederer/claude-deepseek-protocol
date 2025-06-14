# 🤖 Claude-DeepSeek Development Protocol

## 📋 Overview

This protocol establishes a systematic collaboration methodology between Claude Code and DeepSeek-Coder for building robust web applications. It combines Claude's coordination and analysis capabilities with DeepSeek's technical expertise to create a structured development workflow.

### 🎯 Core Philosophy

1. **Iterative Collaboration**: Claude and DeepSeek complement each other at every phase
2. **Informed Decisions**: All technical decisions are based on joint analysis
3. **Consistent Quality**: Every suggestion is evaluated before implementation
4. **Complete Transparency**: Every consultation and decision is documented

## 🔄 Collaboration Flow: Claude ↔ DeepSeek

### Phase 1: PRD Creation

#### 1.1 Claude - Initial Analysis
```
Process:
1. Gather user requirements
2. Ask clarifying questions
3. Create initial PRD draft
4. Identify areas requiring specific technical expertise
```

#### 1.2 DeepSeek - Technical Review
```
DeepSeek Consultation:
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

#### 1.3 Claude - DeepSeek Response Analysis
```
Process:
1. Evaluate each DeepSeek suggestion
2. Identify conflicts or inconsistencies
3. Prepare list of points for second consultation
4. Document preliminary decisions
```

#### 1.4 DeepSeek - Final Iteration
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
5. Create consultation log in `/docs/deepseek-consultations/prd-[feature-name]-consultation.md`
```

### Phase 2: Task Generation

#### 2.1 Claude - Initial Task List
```
Process:
1. Generate tasks based on final PRD
2. Identify complex tasks requiring technical consultation
3. Create preliminary task structure
```

#### 2.2 DeepSeek - Implementation Optimization
```
DeepSeek Consultation:
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
1. Refine task list with DeepSeek suggestions
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

### Optimization Consultation
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

## 📊 Consultation Documentation

### Consultation Log Structure
```markdown
# DeepSeek Consultations - [Feature Name]

## Consultation 1: [Topic] - [Date]
### Question:
[complete question sent]

### DeepSeek Response:
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
mkdir -p docs/{protocols,prds,tasks,deepseek-consultations}
```

### Consult DeepSeek
```bash
# Command Claude uses for consultations
ollama run deepseek-coder:6.7b "[specific question]"
```

### Validate Implementation
```bash
# Commands Claude executes after each implementation
npm test
npm run lint
npm run type-check
```

## 🎯 Decision Criteria

### When to Consult DeepSeek:
- ✅ Architecture decisions
- ✅ Complex implementations
- ✅ Performance optimizations  
- ✅ Specific design patterns
- ✅ Critical code review
- ✅ Testing strategies

### When NOT to Consult:
- ❌ Simple administrative tasks
- ❌ Text/content changes
- ❌ Basic configuration
- ❌ Simple debugging

### Criteria for Accepting Suggestions:
1. **Requirement Alignment**: Does it meet PRD objectives?
2. **Maintainability**: Is it easy to maintain and extend?
3. **Performance**: Does it improve or maintain performance?
4. **Testability**: Is it easy to test?
5. **Consistency**: Is it consistent with the rest of the codebase?

## 🚨 Emergency Protocols

### If DeepSeek gives inconsistent responses:
1. Reformulate the question with more context
2. Break the consultation into more specific questions
3. Consult about specific inconsistency points
4. Document the inconsistency and decide based on best practices

### If there are conflicting suggestions:
1. Evaluate each option against decision criteria
2. Consult DeepSeek about the specific conflict
3. Prioritize consistency with existing codebase
4. Document the decision and rationale

## 📈 Protocol Success Metrics

### Process KPIs:
- **Development Time**: Is total time reduced?
- **Code Quality**: Is test coverage and quality improved?
- **Post-Implementation Bugs**: Are bugs reduced?
- **Maintainability**: Is code easier to maintain?

### Protocol Review:
- Evaluate effectiveness every 5 implemented features
- Adjust consultations based on results
- Document protocol improvements

---

**Note**: This protocol evolves. Each project may require specific adjustments. The key is maintaining iterative collaboration and transparent documentation.