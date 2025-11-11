# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### Compare and contrast One Hot and Binary encodings
One Hot has a D-Flip-Flop for every state, while binary numbers uses log2(N states) DFF's. 

### Which method did your team find easier, and why?
One Hot, because it didn't require K-maps to build the combinatorial logic.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
One Hot encoding can get complicated when there are a large number of states, but is ultimately easier when only working with a few.
Binary encodings may work better for larger numbers of state, but do not always produce correct and real results. 
