Selection, Bubble, and Insertion Sort
=====================================

Chapter 18

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/KfYfuiDj9Iw?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import selectionSortDiagram from '/images/search-quadratic-sort/selection_sort_example.svg'
import bubbleSortDiagram from '/images/search-quadratic-sort/bubble_sort_example.svg'
import insertionSortDiagram from '/images/search-quadratic-sort/insertion_sort_example.svg'
</script>

## Introduction

- To compare the performance of commonly used sorting algorithms, one
  must provide some analysis of these algorithms.

- These sorting algorithms can be applied to either array-based lists or
  linked lists.

## Selection Sort

- The ***Selection Sort Algorithm***: repeatedly select the smallest 
  element from an unsorted portion of a list and moves it to the front..

- Steps for a selection sort:

  - Find the smallest element in the unsorted portion of the list

  - Move it to the top of the unsorted portion by swapping it with the
    currently-first element.

  - Start again with the rest of the list.

- Can also be applied to linked lists.

Example Selection Sort:

<ProgressiveDiagram :src="selectionSortDiagram" />

### Analysis: Selection Sort

- `swap`:  
  Does three assignments; executed $n - 1$ times.
  $$3(n - 1) = 3n - 3 = O(n)$$

- `minIndex`:

  - For a list of length $n$, $n - 1$ key comparisons.

  - Executed $n - 1$ times (by `selectionSort`)

  - The number of key comparisons:
    $$(n-1)+(n-2)+\cdots+2+1=\frac{n(n-1)}{2}=\frac{1}{2} n^{2}-\frac{1}{2}n=O(n^{2})$$
    $$O(n^2) + O(n) = O(n^2)$$

## Bubble Sort

- Suppose `list[0]...list[n-1]` is a list of $n$ elements, indexed $0$
  to $n-1$.

- In a series of $n-1$ iterations, compare successive elements,
  `list[index]` and `list[index + 1]`.

- If `list[index]` is greater than `list[index + 1]`, then swap them.

Example Bubble Sort:

<ProgressiveDiagram :src="bubbleSortDiagram" />

### Performance Analysis

- The Bubble-Sort algorithm contains nested loops.

  - The outer loop executes $n - 1$ times.

  - For each iteration of the outer loop, the inner loop executes one fewer times.

- The total number of comparisons is:
  $$(n - 1) + (n - 2) + \cdots + 2 + 1 = \frac{n(n - 1)}{2} = \frac{1}{2}n^2 - \frac{1}{2}n = O(n^2)$$

- The number of assignments (worst case):
  $$3\frac{n(n - 1)}{2}= \frac{3}{2}n^2 - \frac{3}{2}n = O(n^2)$$
  because there are 3 assignments per swap operator.

## Insertion Sort


The ***Insertion Sort Algorithm*** sorts the list by moving each element
to its proper place in the sorted portion of the list.

Example Insertion Sort:  
(This diagram shows just the first few steps.)

<ProgressiveDiagram :src="insertionSortDiagram" />

### Implementation for Arrays

Let’s implement the Insertion Sort.

### Performance Analysis

- The for-loop executes $n - 1$ times.

- Best case (list is already sorted):  
  Key comparisons: $n - 1 = O(n)$

- Worst case: for each iteration, the if statement evaluates to true.  
  Key comparisons:
  $1 + 2 + \cdots + (n - 1) = \frac{n(n - 1)}{2} = O(n^2)$

- Average number of key comparisons and of item assignments:
  $$\frac{1}{4} n^2 + O(n) = O(n^2)$$

## Lower Bound

### Sorting Algorithm Comparison

Average Case Behavior of the Bubble Sort, Selection Sort, and Insertion
Sort Algorithms for a List of Length $n$.

| **Algorithm** | **Comparisons** | **Swaps** |
|:---|:--:|:--:|
| Bubble Sort | $\frac{n(n-1)}{2} = O(n^2)$ | $\frac{n(n-1)}{4} = O(n^2)$ |
| Selection Sort | $\frac{n(n-1)}{2} = O(n^2)$ | $3(n - 1) = O(n)$ |
| Insertion Sort (Array Based) | $\frac{1}{4}n^2 + O(n) = O(n^2)$ | $\frac{1}{4}n^2 + O(n) = O(n^2)$ |
| Insertion Sort (Linked-List Based) | $\frac{1}{4}n^2 + O(n) = O(n^2)$ | $n - 1 = O(n)$ |

### Lower Bound on Comparison-Based Sort Algorithms

Can we do better than $O(n^2)$ for sorting?

What is the best we can do?

(Find the answers to these questions in the next module.)

## Lab 10: Selection Sort, Bubble Sort, and Binary Search

Let’s take a look at Lab 10.
