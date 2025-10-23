Binary Heaps and Heapsort
=========================

Chapter 10 of [Open Data Structures](https://opendatastructures.org/ods-cpp.pdf)

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/1wbi1UP5OY8?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Intro

### Why study Heapsort?

- Heapsort is a well-known, traditional sorting  
  algorithm you are expected to know.

- Heapsort is ***always*** $O(n \log n)$.

- Learn about binary *search* trees to:

  - Quicksort is usually $O(n \log n)$ but $O(n^2)$ in the worst case.

  - Quicksort is sometimes faster, but Heapsort is better in
    time-critical applications.

  - Merge Sort is also $O(n \log n)$, but requires additional memory to
    sort an array.

- Can improve our Priority Queue design (in certain situations).

### What is a “heap”?

- There are two definitions of ***heap***.

  1.  ***Memory***: A large area of memory from which the programmer can
      allocate blocks as needed, and deallocate them (or allow them to
      be garbage collected) when no longer needed.

  2.  ***Data Structure***: A balanced, left-justified binary tree in
      which no node has a value greater than its parent (binary heap).

- These two definitions have little in common.

- Heapsort uses the second definition.

### Two Properties of a Binary Heap

The heap data structure is a binary tree that maintains two properties, which we will discuss.

1.  **Shape Property**: Left Justified and, therefore, Balanced

2.  **Heap Property**: The relationship between elements

### Balanced Binary Trees

- Recall:

  - The ***depth of a node*** is its distance from the root.

  - The ***depth of a tree*** is the depth of the deepest node.

- A binary tree of depth $n$ is ***balanced*** if all the nodes at
  depths 0 through $n-2$ have two children.

### Left-Justified Binary Trees

A binary tree is ***left-justified*** if:

- Balanced (All levels, except possibly at depth $n$ (deepest), are filled.)

- All leaves at depth $n$ are to the left (without any missing).  
  (All leaves at depth $n - 1$ are to the right of all the nodes at
  depth $n$.)

### The Heap Property

- A node has the ***heap property*** if the value in the node  
  is at least as large as its children’s values.

- All leaves automatically have the heap property.

- A binary tree is a ***heap*** if all nodes in it have the heap
  property.

![Example Heap](/images/heaps/example-heap-1.svg "Example heap"){.light-only}

![Example Heap](/images/heaps/example-heap-1-dark.svg "Example heap"){.dark-only}

### Shift Up

If a node is without the heap property, exchange  
its value with the larger child’s value.

- This is sometimes called ***sifting up*** or bubble up.

- Notice that the child may have ***lost*** the heap property during
  shifting.

### Plan of Attack

We will discover:  

1.  How to turn a binary tree into a heap.

2.  After particular changes, how to turn a binary tree ***back*** into
    a heap.

3.  How to use these ideas to sort an ***array***.  
    (This is the cool part.)

## Inserting into a Heap

- A single-node tree is automatically a heap.

- We construct a heap by adding nodes one at a time:

  - Add the node just to the right of the rightmost node in the deepest
    level.

  - If the deepest level is full, start a new level.

- Example:  

- Problem: Each time we add a node, we may destroy  
  the heap property of its parent node.

- Solution: ***Sift up*** (a.k.a., bubble up).

- But each time we sift up, the value of the topmost node in the sift
  may increase, and this may destroy the heap property of its parent
  node.

- We repeat the sifting up process, moving up in the tree, until either:

  - We reach a node whose value doesn’t need to be swapped (because the
    parent is larger than both children), or

  - We reach the root.

Insert 8, 10, 5, 11, 6, 14, and 12.

### A Sample Heap

Here is a sample ***heapified*** binary tree.

- Heapified does ***not*** mean sorted.

- Heapifying does ***not*** change the shape of the binary tree.

- This binary tree was always balanced and left-justified.

## Remove

### Removing the Root

- The largest number is now in the root.

- Suppose we ***discard*** the root.

- Problem: The tree becomes ***unbalanced*** and
  ***un-left-justified***.

- Solution: Make the rightmost leaf the new root.

### Re-Heap by Sifting Down

- Our tree is balanced and left-justified, but no longer a heap.

- Only the root lacks the heap property.

- We ***sift down*** (or trickle down) the root.

- Now, only one child may have lost the heap property.

### Re-Heap (Sift-Down)

- Now, the left child of the root (currently 11) lacks the heap
  property.

- We can sift down this node.

- Now, only one of its children may have lost the heap property.

## Re-Heap (Sift-Down)

- Now, the right child of the left child of the root (currently 11)
  lacks the heap property.

- We can sift down this node.

- It is a leaf, so there are children to lost the heap property.

- Every node again has the heap property.

- The largest value is at the root.

- Repeating until the tree is empty will produce produces a sequence
  ordered from largest to smallest.

## Sorting

What do heaps have to do with sorting an array?

- Because the binary tree is balanced and left-justified, it can be
  represented as an array!

- All our operations on binary trees can be represented as operations on
  arrays.

### Mapping into an Array

- The left child of index, $i$, is at $2 \times i + 1$

- The right child of index, $i$, is at $2 \times i + 2$

![Example Heap for Array Mapping](/images/heaps/example-heap-2.svg "Example Heap for Array Mapping"){.light-only}

![Example Heap for Array Mapping](/images/heaps/example-heap-2-dark.svg "Example Heap for Array Mapping"){.dark-only}


![Array Representation of the Example Heap](/images/heaps/example-heap-2-array.svg "Array Representation of the Example Heap"){.light-only}

![Array Representation of the Example Heap](/images/heaps/example-heap-2-array-dark.svg "Array Representation of the Example Heap"){.dark-only}

- Ex: Children of $3$ ($19$) are $7$ ($18$) and $8$ ($14$).

- Given a child, what is it’s parent’s index?

### Removing and Replacing the Root

- The “root” is the first element in the array.

- The “deepest rightmost node” is the last element.

- Remove the root by swapping the first and last values.

- …pretend that the last element in the array no  
  longer exists — the “last index” is 11 (9).

### Reheap and Repeat

- Re-heap the root node (index 0, containing 11).

- Again, remove and replace the root node.

- Remember, though, that the “last” array index is changed.

- Repeat until the last becomes first, and the array is sorted!

## Implementation

*We implemented and tested a binary heap class in the lecture.*

## Analysis

### Step 1, Heapify the Array

The sorting algorithm starts by ***heapifying the array***.

- We add each of $n$ nodes.

  - Each node must be sifted up, possibly as far as the root.  
    Because the binary tree is perfectly balanced, sifting up a single
    node takes $O(\log n)$ time.

  - Because we iterate $n$ times, heapifying takes $n \times O(\log n)$
    time, that is, $O(n \log n)$ time.

### Step 2, Remove

- Here’s the rest of the algorithm:

  Algorithm Pseudocode (Part 2)

  ```plain
  While the array isn’t empty:
  {
    Remove and replace the root.
    Reheap the new root node.
  }
  ```

- We do the while loop $n$ times (actually, $n-1$ times), because we
  remove one of the $n$ nodes each time.

- Removing and replacing the root takes $O(1)$ time.

- Therefore, the total time is $n$ times however long it takes the
  reheap method.

### Step 3, Reheap

- To reheap the root node, we must follow ***one path*** from the root
  to a leaf node (and we might stop before we reach a leaf).

- The binary tree is perfectly balanced.

- Therefore, this path is $O(\log n)$ long.

  - And we only do $O(1)$ operations at each node.

  - Therefore, a reheap takes $O(\log n)$ time.

- Since we reheap inside a while loop that we do $n$ times, the total
  time for the while loop is $n \times O(\log n)$, or $O(n \log n)$.

### Performance of All Steps

Heapify the array.

```text
While the array isn’t empty:
{
  Remove and replace the root.
  Reheap the new root node.
}
```

- We have seen that heapifying takes $O(n \log n)$ time.

- The while loop takes $O(n \log n)$ time.

- Therefore, the total time is $O(n \log n) + O(n \log n)$.

- Which is $O(n \log n)$ time (average- and worst-case).

## Summary of Benefits

- ***Efficient Operations***: Insertion and deletion are $O(\log n)$.
  Retrieval of the minimum (or maximum) element is $O(1)$.

- ***Space Efficiency***: Binary heaps can be implemented using arrays,
  removing the need for pointers.

- ***Ease of Implementation***: With arrays, the algorithms for
  insertion, deletion, and heapifying are intuitive.

- ***Heap Sort***: An always $O(n \log{n})$ in-place sorting algorithm
  (i.e., $O(1)$ additional space and with predictable performance).

- ***Priority Queue***: Many algorithms require elements with higher (or
  lower) priority to be processed first.

## Visual Comparison of Sorting Algorithms

[Sorting Algorithms
Animations](https://www.toptal.com/developers/sorting-algorithms)

## Lab 16: Binary Heap and Heapsort

Let’s take a look at the lab based on today’s lecture.
