Stacks
======

Chapter 17

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/oQcmDdVBV84?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Objectives

In this lecture, you will:

- Learn about stacks.

- Examine various stack operations.

- Learn how to implement a stack as an array.

- Learn how to implement a stack as a linked list.

- Learn how to use a stack to solve problems like removing recursion.

## Introduction

**Stack**: a data structure in which elements are added and removed from one
end only.

- Addition and deletion occurs only at the top of the stack.

- Last in, first out (LIFO) data structure

- Operations:

  - Push: to add an element onto the stack

  - Pop: to remove an element from the stack

| Coins  | Trays  | Boxes  | Books  |
|---|---|---|---|
| ![stack of coins](/images/stacks/stack-example-coins.svg "Coins"){style="max-width:80px"} | ![stack of trays](/images/stacks/stack-example-trays.svg "Trays"){style="min-width:150px"} | ![stack of boxes](/images/stacks/stack-example-boxes.png "Boxes"){style="max-width:120px"} | ![stack of books](/images/stacks/stack-example-books.svg "Books"){style="max-width:160px"} |

: Examples of Real-Life Stacks

### Stack Example

*See the lecture video above for the full example.*

### Stack Interface

![UML class diagram for `Stack` interface](/images/stacks/uml_stack_interface.svg "UML class diagram for `Stack` interface"){.light-only}
![UML class diagram for `Stack` interface](/images/stacks/uml_stack_interface-dark.svg "UML class diagram for `Stack` interface"){.dark-only}

## Array Stack

### Array-Based Stack Implementation

- The first element goes in the first array position, the second in the
  second position, etc.

- The top of the stack is an index of the last element added to the
  stack.

- Stack elements may be stored in an array, which is a random-access
  data structure.

  - The stack element is accessed only through the top.

- To track the top position, use a variable.

- Can dynamically allocate an array.

- Enables the user to specify the size of the array.

- The `size` attribute will hold the number of elements currently in the
  array.

- Therefore, we will use `size - 1` as the top of the stack.

- The `capacity` attribute will hold the maximum number of elements of
  the array before it needs to be resized.

*See the lecture video above for the full example.*

### Empty Array-Based Stack

*See the lecture video above for the full example.*

## Linked Stack

### Linked Implementation of a Stack

- Array only allows a fixed number of elements.

- If the number of elements to be pushed exceeds the array size, the
  program may terminate.

- Linked lists can dynamically organize data.

- In a linked representation, `mpHead` is a pointer to the memory
  address of the top element in the stack.  
  (`mpHead` may be named `mpStackTop`.)

*See the lecture video above for the full example.*

### Push

*See the lecture video above for the full example.*

### Pop

*See the lecture video above for the full example.*

## Postfix Notation

### Infix Notation

***Infix notation***: usual notation for writing arithmetic expressions

- Operator is written between the operands.

- Example: $a + b$.

- Evaluates from left to right.

- Operators have precedence.

- Parentheses can be used to override precedence.

### Prefix Notation (Polish Notation)

***Prefix (Polish) notation***: operators are written before the
operands

- Introduced by the Polish mathematician Jan Lukasiewicz in the early
  1920s.

- Parentheses can be omitted.

- Example: $a + b$ becomes $+\ a\ b$.

### Postfix Notation (Reverse Polish Notation)

***Postfix notation***: operators follow the operands (postfix
operators)

- Proposed by Australian philosopher and early computer scientist,
  Charles L. Hamblin, in the late 1950s.

- Advantage: operators appear in the order required for computation.

- Example: $a + b \cdot c$ becomes $a\ b\ c\ \cdot\ +$

- Example: $(a + b) \cdot c$ becomes $a\ b + c\ \cdot$

### Postfix Notation Examples

### Postfix Expressions Calculator

Postfix notation has important applications in computer science.

Many compilers first translate arithmetic expressions into postfix
notation and then translate this expression into machine code.

Evaluation algorithm:

- Scan expression from left to right.

- When an operator is found, back up to get operands, perform the
  operation, and continue.

### Postfix Expressions Calculator

Expression: $6\ 3 + 2\ *\ =$

*See the lecture video above for the full example.*

Symbols can be numbers or anything else:

- $+$, $-$, $*$, and $/$ are operators, require two operands.

  - Pop stack twice and evaluate the expression.

  - If the stack has less than two elements, then error.

- If the symbol is $=$, the expression ends.

  - Pop and print the answer from the stack.

  - If the stack has more than one element, then error.

- If the symbol is anything undefined, the expression contains an
  illegal operator.

Start to the function:

```C++
bool evaluatePostfixExpression(ifstream &input, double& result)
{
  Stack<double> stack;
  char nextSymbol;
  double value;

  // ...
  nextSymbol = input.peek();
  // ...
}
```

## SLList in Reverse

### Iterating Over a Linked List in Reverse

- To print a list backward non-recursively, first get to the last node
  of the list.

  - Problem: Links go in only one direction.

  - Solution: Save a pointer to each node in a stack.  
	Uses the LIFO principle.

- Since the number of nodes is usually not known, use the linked
  implementation of a stack.

### Iterating Over a Linked List in Reverse

*See the lecture video above for the full example.*

## Summary

- ***Stack***: items are added/deleted from one end.

  - Last In, First Out (LIFO) data structure

  - Operations: push, pop, initialize, destroy, check for empty/full
	stack

  - Can be implemented as an array or linked list.

  - Middle elements should not be accessed directly.

- ***Postfix notation***: operators are written after the operands (no
  parentheses needed).
