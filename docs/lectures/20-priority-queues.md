Priority Queues
===============

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/s2uOFB5AqLo?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Introduction

- A stack is first in, last out.

- A queue is first in, first out.

- A priority queue is a *highest-priority first-out* container.

- The “highest-priority” element is removed first.
  Priority is determined from the elements’ values,
  usually largest to smallest or vice versa.

- The definition of “largest” is up to the programmer (for example, you
  might define it by implementing a
  [Compare](https://en.cppreference.com/w/cpp/named_req/Compare)
  function object.)

- If there are several “largest” elements, the implementer must decide
  which to remove first.

  - Remove any “largest” element (don’t care which).

  - Remove the first one added.


### Popular Priority Queue Uses

-   **Task scheduling** in operating systems (highest-priority processes run first).

-   [**Dijkstra's algorithm** for shortest paths](22-graphs-adjacency-matrices#shortest-path-in-a-weighted-graph) (select the next closest node).

-   **A* search** and other **graph traversal** techniques (best candidate expansion).

-   **Event-driven simulation** (next event by earliest time).

-   **Huffman coding** and **compression** (combine nodes by lowest frequency).

## A Priority Queue ADT

Here is one possible ADT:

- `PriorityQueue()`: a constructor

- `void add(const Type &val)`: inserts `val` into the queue

- `Type& pop()`: removes and returns the highest-priority element

- `const Type& top() const`: returns (but does not remove) the
  highest-priority element

- `bool isEmpty() const`: returns true IFF empty

- `unsigned int size() const`: returns the element count

- `void clear()`: discards all elements

## Performance

### Evaluating Implementations

- When choosing a data structure, consider  
  ***usage patterns***.

  - If data is loaded once and searched thousands of  
    times, make searching fast by sorting the array.

  - If we load a huge data and expect to do only a few searches, we
    probably ***don’t*** want to spend time sorting.

- For almost all uses of a queue (including a priority queue), we
  eventually remove everything.

- Hence, when we analyze a priority queue, neither ‘add’ nor “remove” is
  more important — we must look at the timing for “add + remove”.

### Array Implementations: Unsorted

A priority queue could be implemented as an ***unsorted***  
array (with a count of elements).

- Adding an element would take $O(1)$ time. (Why?)

- Removing an element would take $O(n)$ time. (Why?)

- Hence, adding and removing an element takes $O(n)$ time.

- This is an inefficient representation.

### Array Implementations: Sorted

A priority queue could be implemented as a ***sorted*** array (again,
with a count of elements).

- Adding an element would take $O(n)$ time. (Why?)

- Removing an element would take $O(1)$ time. (Why?)

- Hence, adding and removing an element takes $O(n)$ time.

- Again, this is inefficient.

### Linked-List Implementations

A priority queue could be implemented linked list that is…

- ***Unsorted***:

  - Adding an element would take $O(1)$ time (Why?)

  - Removing an element would take $O(n)$ time (Why?)

- ***Sorted***:

  - Adding an element would take $O(n)$ time (Why?)

  - Removing an element would take $O(1)$ time (Why?)

- As with array representations, adding and removing an element takes
  $O(n)$ time.

- Again, these are inefficient implementations.

### Binary Search Tree Implementations

- A priority queue could be represented as an  
  unbalanced ***binary search tree***.

  - Insertion times would range from to

  - Removal times would range from to

- A priority queue could be represented as a ***balanced*** binary
  search tree.

  - Insertion and removal could destroy the balance.

  - We need an algorithm to rebalance the binary tree.

  - Good rebalancing algorithms require only $O(\log n)$ time but are
    complicated.

### Heap Implementation

A priority queue can be implemented as a ***heap***, which are…

- Balanced

- Left-Justified, and have

- The ***Heap Property***: values are least as large as its children.  
  (Or smaller if smaller values represent higher priorities.)

Heap: All nodes have the heap property.

## Array Representation of a Heap

![Mapping of a binary heap into the array representation.](/images/priority-queues/heap_to_array.svg "Mapping of a binary heap into the array representation."){.light-only}

![Mapping of a binary heap into the array representation.](/images/priority-queues/heap_to_array-dark.svg "Mapping of a binary heap into the array representation."){.dark-only}

- Left child of node $i$ is at $2i + 1$; right child is at $2i + 2$.  
  If the result is larger than the last index, there is no such child.

- Parent of node $i$ is $\frac{1}{2}(i - 1)$, unless $i$ == $0$.

### Adding Element to the Heap

1.  Increase `lastIndex` and put the new value there.

2.  Reheap the newly added element by ***sifting up***.

    - (a.k.a., ***up-heap bubbling*** or ***percolating up***).

    - Sifting up requires $O(\log n)$ time.

### Removing Element from the Heap

1.  Remove the element at location 0.

2.  Move the element at location `lastIndex` to location 0, and
    decrement `lastIndex`.

3.  Reheap the new root node (the one now at location 0) by ***sifting
    down***.

    - (a.k.a., ***down-heap bubbling*** or ***percolating down***).

    - Sifting down requires $O(\log n)$ time.

## Using the C++ STL Heap

This is surprising not that bad.

- A heap is a vector that has been “heapified.”

  - Use the `make_heap()` function to “heapifiy” a vector.

- Further pushes/pops should be done via heap functions.

  - `push_back` + `push_heap` / `pop_heap`.

Some example code will help.

### C++ STL Heap: Create

```C++
std::vector<int> v1 {20, 30, 40, 25, 15}; // Initial a vector
std::make_heap(v1.begin(), v1.end());     // Convert into a heap

std::cout << "The max value is "  << v1.front() << '\n';
```

  

### C++ STL Heap: Push

```C++
v1.push_back(50); // Add a new element to the vector
std::push_heap(v1.begin(), v1.end()); // reorder the elements

std::cout << "The maximum after push is " << v1.front() << '\n';
```

  

### C++ STL Heap: Pop

```C++
std::pop_heap(v1.begin(), v1.end());  // remove the maximum

// Displaying the maximum element of the heap
std::cout << "The maximum after pop is " << v1.front() << '\n';
```

  

### C++ STL Heap Functions in `<algorithm>`

- [`make_heap()`](https://en.cppreference.com/w/cpp/algorithm/make_heap):
  function to “heapifiy” a vector.

- `push_back()` +
  [`push_heap()`](https://en.cppreference.com/w/cpp/algorithm/push_heap):
  push to the heap.

- [`pop_heap()`](https://en.cppreference.com/w/cpp/algorithm/pop_heap):
  function to remove the first element and reheap.

- `front()`: get the top element (first in the heap/queue).

- [`sort_heap()`](https://en.cppreference.com/w/cpp/algorithm/make_heap):
  perform heapsort (the vector is no longer a heap afterward).

- [`is_heap()`](https://en.cppreference.com/w/cpp/algorithm/is_heap):
  quick test to see if you are still a heap.

- [`is_heap_until()`](https://en.cppreference.com/w/cpp/algorithm/is_heap_until):
  returns an iterator of what part of the vector is a heap.

## Considerations

- A ***priority queue*** is a data structure that is designed to return
  elements in order of priority.

- Efficiency is usually measured as the sum of the time it takes to add
  and remove elements.

- Simple implementations take $O(n)$ time.

- A heap implementation takes $O(\log n)$ time.

- Thus, for any sort of heavy-duty use, a heap implementation is better.

### My Recommendation

- If you need a priority queue, define it as an ADT.

- Start with a simple implementation.

- Keep the implementation hidden so you can change it later.

- If appropriate, consider the
  [`std::priority_queue`](https://en.cppreference.com/w/cpp/container/priority_queue)
  class, which is part of the C++ STL.

## Lab 20: Priority Queues

Let’s look at the lab based on today’s lecture.
