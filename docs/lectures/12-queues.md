Queues and Midterm Expectations
===============================

Chapter 17

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/bDu25jrpqJA?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Objectives

In this lecture, you will:

- Learn about queues.

- Examine various queue operations.

- Learn how to implement a queue as an array.

- Learn how to implement a queue as a linked list.

- Discover how to use queues to solve simulation problems.

## Introduction

***Queue***: a data structure in which elements are  
added from one end (the *back*) and  
removed from the other end (the *front*).

- First In, First Out (FIFO) data structure

- Operations: enqueue, dequeue, front, initialize, destroy, check for
  empty/full queue

- Can be implemented as an array or linked list.

- Middle elements should not be accessed directly.

- Example: Waiting in line in a bank.

![UML class diagram for `Queue` interface](/images/queues/uml_queue_interface.svg "UML class diagram for `Queue` interface"){.light-only}

![UML class diagram for `Queue` interface](/images/queues/uml_queue_interface-dark.svg "UML class diagram for `Queue` interface"){.dark-only}

## Array-Based Queue Implementation

Need *at least* four (member) variables:

1.  Array to store queue elements

2.  `frontIndex` to track the first element.

3.  `rearIndex` to track the last element

4.  `capacity` to specify the maximum size of the queue.

### Enqueue Array-Based Implementation

To add an element to the queue:

```C++
++mRearIndex; // (Incomplete!) Advance to the next position.
mpList[mIndexRear] = value; // Add element to position
```

Example: Enqueue the values A, B, and C.

*See the lecture video above for the full example.*

### Dequeue in Array-Based Implementation

To remove an element to the queue:

```C++
++mFrontIndex; // (Incomplete!) Advance to the next position.
```

Example: Dequeue one value.

*See the lecture video above for the full example.*

### Problem: Unusable Space

As we add and remove elements, `mRearIndex` and `mFrontIndex` only
increase, leaving unusable space at the beginning of the array.

Example state after a sequence of 10 enqueues and 8 dequeues.

***Slow Solution***: When the queue overflows at the rear
(`mRearIndex == mCapacity`) and if there is room at the beginning
(`mFrontIndex > 0`),  
shift all elements towards the first array position.

***Problem***: Too slow for large queues.

### Solution: Circular Array

***Better Solution***: Assume that the array is circular (it wraps
around to the beginning).

![Circular Array Representation](/images/queues/circular_array.svg "Circular Array Representation"){.light-only}

![Circular Array Representation](/images/queues/circular_array-dark.svg "Circular Array Representation"){.dark-only}

Example: Enqueue Z

### Circular Array: Full or Empty?

Problem: Differentiating between empty queues and full queues.  
Example: Dequeue the only remaining value.

*See the lecture video above for the full example.*

Problem: Differentiating between empty queues and full queues.  
Example: Enqueue into the last available space.

*See the lecture video above for the full example.*

- Problem: In the previous two examples, notice that the state of
  `frontIndex` and `rearIndex` is the same for full and empty queues.

- How can we tell the difference?

#### Solution 1: Keep track of the size.

- Initialize the size to `0`.

- Incremented when a new element is added to the queue.

- Decremented when an element is removed.

- Very useful if the user (of the queue) frequently needs to know the
  number of elements in the queue.

```C++
template <typename Type>
bool QueueArray<Type>::isEmpty() const {
  return mSize == 0;
}

template <typename Type>
bool QueueArray<Type>::isFull() const {
  return mSize == mCapacity;
}

template <typename Type>
QueueArray<Type>::QueueArray(const int capacity)
  : mCapacity{capacity},
	mSize{0}, // no elements in queue yet
	mFrontIndex{0},
	mRearIndex{capacity - 1},
	mpList{new Type[capacity]}
{
}
```

#### Solution 2: Let `indexRear` indicate the position right *after* the last element.

- `indexFront` still indicates the index of the first element.

- Queue empty if `indexFront == indexRear`.

- Slot indicated by `indexFront - 1` is reserved (cannot be added to in
  a push).

- The queue is full if the next available space is the reserved slot
  indicated by queueFront.  
  `(indexRear + 1) % capacity == indexFront`

Using a reserved slot in the array.

*See the lecture video above for the full example.*

## Linked-List Based Queue Implementation

- Array implementation has issues:

  - Array size is fixed: only a finite number of queue elements can be
	stored in it.

  - Requires array to be treated in a specific way, together with
	`frontIndex` and `rearIndex`.

- Linked implementation of a queue simplifies many issues.  

- The queue is never full because memory is allocated dynamically

We can use the same code as our linked-list implementation with head and
tail pointers.

- Only append new values (no prepend or insert).

- Only remove from the head.

- The head always points to the front of the queue.

- The queue is empty if the head is null.

### Enqueue (Push)

*See the lecture video above for the full example.*

### Dequeue (Pop)

*See the lecture video above for the full example.*

## Simulation

### Application of Queues: Simulation

***Simulation***: a technique in which one system models the behavior of
another system.

- Computer models are used to study the behavior of real systems.

- ***Queuing systems***: computer simulations using queues as the data
  structure.

- Example: queues of objects are waiting to be served.

### Designing a Queuing System

- ***Server***: an object that provides the service.

- ***Customer***: an object receiving the service.

- ***Transaction time***: the service time (i.e., the time it takes to
  serve a customer).

- ***Model***: a system that consists of a list of servers and a waiting
  queue holding the customers to be served.

  - The customer at the front of the queue waits for the next available
	server.

What we need to know:

- Number of servers

- Expected arrival time of a customer

- The time between the arrival of customers

- Number of events affecting the system

The performance of the system depends on:

- How many servers are available

- A customer’s wait time for service

- How often a customer arrives

If it takes too long to serve a customer and customers arrive
frequently, then more servers are needed.

- The system can be modeled as a time-driven simulation.

- ***Time-driven simulation***: the clock is a counter

  - The passage of one unit of time can be implemented by incrementing a
	counter by 1.

  - Simulation is run for a fixed amount of time.


![UML class diagram for the `Customer` class](/images/queues/uml_customer_class.svg "UML class diagram for the `Customer` class")

![UML class diagram for the `Server` class](/images/queues/uml_server_class.svg "UML class diagram for the `Server` class")

ServerList: a set of servers.  
At any given time, a server is either free or busy.

![UML class diagram for the `ServerList` class](/images/queues/uml_serverlist_class.svg "UML class diagram for the `ServerList` class")

### Waiting Customers Queue

- When a customer arrives, he/she goes to the end of the queue.

- When a server becomes available, the customer at the front of the
  queue leaves to conduct the transaction.

- After each time unit, the waiting time of each customer in the queue
  is incremented by 1.

- Can use our Queue class but must add an operation to increment waiting
  time.

### Algorithm for the main loop

For each time unit (of the clock) from 1 to the end of the simulated
time:

1.  Updated the server list to decrement the transaction time of each
	busy server by one time unit.

2.  If the customer’s queue is nonempty, increment the waiting time of
	each customer by one time unit.

3.  If a customer arrives, increment the customer count by 1 and add the
	new customer to the queue.

4.  While a server is free and the customer’s queue is nonempty, remove
	the customer from the front of the queue and send the customer to
	the free server.

## Summary

- ***Postfix notation***: operators are written after the operands (no
  parentheses needed).

- ***Queue***: items are added at one end and removed from the other end
  (FIFO).

  - First In, First Out (FIFO) data structure

  - Operations: add, remove, initialize, destroy, check if the queue is
	empty/full

  - Can be implemented as an array or linked list.

  - Middle elements should not be accessed directly.

  - Is a restricted version of an array or linked list.

## Lab 12: Stacks and Queues

Let’s take a look at Lab 12.

## Midterm Exam Expectations

See the [Midterm Exam Study Guide](/guides/midterm-study-guide) for more information.