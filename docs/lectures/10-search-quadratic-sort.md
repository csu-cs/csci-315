Binary Search and Selection, Bubble, and Insertion Sort
=======================================================

Chapter 18

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/jcwrN3CvKUA?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import binarySearchDiagram from '/images/search-quadratic-sort/binary_search_example.svg'
import selectionSortDiagram from '/images/search-quadratic-sort/selection_sort_example.svg'
import bubbleSortDiagram from '/images/search-quadratic-sort/bubble_sort_example.svg'
import insertionSortDiagram from '/images/search-quadratic-sort/insertion_sort_example.svg'
</script>

## Introduction

### Objectives

After the next two lectures and labs, you will be able to:

- Implement the sequential and binary search algorithms.

- Explain how these search algorithms perform.

- State lower bound on comparison-based search algorithms.

- Implement various sorting algorithms.

- Use the *asymptotic* notation, Big-$O$, to analyze these algorithms’
  performance.

### With a Search Algorithm, you can:

- Determine whether a particular item is in an array or list.

- If the data is specially organized (for example, sorted), find the
  location in the list where a new item can be inserted.

- Find the location of an item to be deleted.

### Search Algorithm Terminology

- An item’s ***key*** – a special member that uniquely identifies the
  item in the data set.

- A ***key comparison*** – comparing the key of the search item with the
  key of an item in the list.

  - We can count the number of key comparisons as a measure of
    performance.

- The key that we are searching for is called the ***target*** or
  ***search item***.

## Sequential Search

### Sequential Search (a.k.a. Linear Search)

- Same for both array-based and linked lists.

- Starts at the first element and examines each element until a match is
  found.

- Can be implemented iteratively (using a loop) or recursively.

::: code-group

```C++ [Iterative Sequential Search of Arrays]
template <typename Type>
unsigned int sequentialSearch(const Type array[], 
	unsigned int size, const Type& key)
{
	unsigned int index;

	// Iterate until we find the key or reach the end of the array
	for (index = 0; index < size && array[index] != key; ++index)
	{
	}

	// If we found the key, return the index, otherwise return UINT_MAX
	return index < size ? index : UINT_MAX;
}
```

```C++ [Recursive Sequential Search of Arrays]
template <typename Type>
unsigned int sequentialSearchRecursive(const Type array[], 
	unsigned int size, const Type& key)
{
	unsigned int index;

	// Base case, empty list
	if (size == 0)
	{
		index = UINT_MAX;
	}

	// Base case, key found in first location
	else if (array[0] == key)
	{
		index = 0;
	}

	// Recursive case, run these checks again with a smaller array.
	else
	{
		// Call ourself
		index = sequentialSearchRecursive(array + 1, size - 1, key);
		if (index != UINT_MAX)
			++index;
	}

	return index;
}
```

:::

### Key Comparisons of a Sequential Search

- Remember, the speed of a computer does not affect the number of key
  comparisons required.

- Statements before and after the loop are executed only once, $O(1)$.

- Statements in the while loop repeated some number from 1 to $n$ times
  (where $n$ is the number of keys).


- If the search key is not in the list, there will be $n$ comparisons.

- In the best case, the first key matches the search item with just one
  comparison.

- In the worst case, the target is not in the list, so there will be $n$
  comparisons.

- Average number of comparisons:
  $$\frac{1 + 2 + \cdots + n}{n} = \frac{1}{n} \cdot \frac{n (n + 1)}{2} = \frac{n + 1}{2} = \frac{1}{2}n + \frac{1}{2}$$

## Binary Search (for Sorted Lists)

- Binary search can be applied to ***sorted*** arrays or lists.

- Uses the “divide and conquer” technique.

- Steps

  1.  First, compare the target to the middle element.

  2.  If the search item is less than the middle element, restrict the
      search to the lower half of the list.

  3.  Otherwise, restrict the search to the upper half of the list.

  4.  Repeat until found.

Find the location of `75` in this sorted array.

<ProgressiveDiagram :src="binarySearchDiagram" />

### The Performance of the Binary Search on Arrays

- Every iteration cuts the size of the search list in half.

- If list $L$ has $1024 = 2^{10}$ items, at most $11$ iterations are
  needed to find $x$.

- Every iteration makes two key comparisons.

  - For $L$, binary search has at most $22$ key comparisons.

  - Max number of comparisons = $2\log_2n+2$.

  - The sequential search required $512$ key comparisons (average) to
    find if $x$ is in $L$.

## Asymptotic Notation (Big-O Notation)

- After an algorithm is designed, it should be analyzed.

- There are often various ways to design a particular algorithm.

- Certain algorithms take very little computer time to execute.

- Others take a considerable amount of time.

| $n$ | $\log_2{n}$ | $n \log_2{n}$ | $n^2$ |         $2^n$ |
|----:|------------:|--------------:|------:|--------------:|
|   1 |           0 |             0 |     1 |             2 |
|   2 |           1 |             2 |     4 |             4 |
|   4 |           2 |             8 |    16 |            16 |
|   8 |           3 |            24 |    64 |           256 |
|  16 |           4 |            64 |   256 |        65,536 |
|  32 |           5 |           160 | 1,024 | 4,294,967,296 |
|  64 |           6 |           384 | 4,096 |   1.84467e+19 |


| $n$ | $n$ | $\log_2{n}$ | $n \log_2{n}$ | $n^2$ | $2^n$ |
|---:|:---|:---|:---|:---|:---|
| $10$ | $0.01$μs | $0.003$μs | $0.033$μs | $0.1$μs | $1$μs |
| $20$ | $0.02$μs | $0.004$μs | $0.086$μs | $0.4$μs | $1$ms |
| $30$ | $0.03$μs | $0.005$μs | $0.147$μs | $0.9$μs | $1$μs |
| $40$ | $0.04$μs | $0.005$μs | $0.213$μs | $1.6$μs | $18.3$ min |
| $50$ | $0.05$μs | $0.006$μs | $0.282$μs | $2.5$μs | $13$ days |
| $100$ | $0.1$μs | $0.007$μs | $0.664$μs | $10$μs | $4\times10^{13}$ years |
| $1000$ | $1$μs | $0.01$μs | $9.966$μs | $1$ms |  |
| $10000$ | $10$μs | $0.013$μs | $130$μs | $100$ms |  |
| $100000$ | $0.1$ms | $0.017$μs | $1.67$ms | $10$μs |  |
| $1000000$ | $1$ms | $0.020$μs | $19.93$ms | $16.7$m |  |
| $10000000$ | $0.01$μs | $0.023$μs | $0.23$μs | $1.16$ days |  |
| $100000000$ | $0.1$μs | $0.027$μs | $2.66$μs | $115.7$ days |  |

Time for $f(n)$ instructions if executing 1-billion instructions per
second.

*μs is a microsecond or 10e-6 seconds.


- Let $f$ be a function of $n$.

- ***Asymptotic***: the study of the function $f$ as $n$ becomes larger
  and larger without bound.

- Let $f$ and $g$ be real-valued, non-negative functions.

- $f(n)$ is ***Big-O*** of $g(n)$, written $f(n) = O(g(n))$ if there are
  constants $c$ and $n_0$ such that
  $$f(n) \le cg(n) \textsf{ for all } n \ge n_0$$

### Growth Rate

|     $n$ |   $g(n) = n^2$ | $f(n) = n^2 + 4n + 20$ |
|--------:|---------------:|-----------------------:|
|      10 |            100 |                    160 |
|      50 |          2,500 |                  2,720 |
|     100 |         10,000 |                 10,420 |
|   1,000 |      1,000,000 |             1,0004,020 |
|  10,000 |    100,000,000 |            100,040,020 |
| 100,000 | 10,000,000,000 |         10,000,400,020 |

### Growth Rate Functions

| **Function $g(n)$** | **Growth rate of $f(n)$** |
|:---|:---|
| $g(n) = 1$ | ***Constant*** (is independent of the problem’s size). |
| $g(n) = \log_2n$ | ***Logarithmic*** (increases increases slowly as the problem size increases). |
| $g(n) = n$ | ***Linear*** (increases directly with the size of the problem). |
| $g(n) = n \log_2n$ | $n\log$ (increases more rapidly than a linear algorithm). |
| $g(n) = n^2$ | ***Quadratic*** (increases rapidly with the size of the problem). |
| $g(n) = n^3$ | ***Cubic*** (increases more rapidly with the size of the problem than the time requirement for a quadratic algorithm). |
| $g(n) = 2^n$ | ***Exponential*** (too rapid to be practical, as the size of the problem increases). |

### Comparing Sequential and Binary Search

| **Algorithm** | **Successful Search** | **Unsuccessful Search** |
|---:|:---|:---|
| **Sequential Search** | $\frac{1}{2}n + \frac{1}{2} = O(n)$ | $n = O(n)$ |
| **Binary Search** | $2\log_2n - 3 = O(\log_2n)$ | $2\log_2n = O(log_2{n})$ |

The number of comparisons for a list of length $n$.

### Lower Bound on Comparison-Based Search

***Comparison-based search algorithms***: Search a list by comparing the
target element with list elements.

***Theorem***: Let $L$ be a list of size $n > 1$. Suppose that the
elements of $L$ are sorted. If $SRH(n)$ denotes the minimum number of
comparisons needed, in the worst case, by using a comparison-based
algorithm to recognize whether an element $x$ is in $L$, then
$SRH(n) \ge \log_2(n + 1)$.

***Corollary***: The binary search algorithm is an optimal worst-case
algorithm for solving search problems by the comparison method. From
these results, it follows that if we want to design a search algorithm
that is of an order less than $\log_2{n}$, then it cannot be comparison
based.

### Sorting Algorithms

- To compare the performance of commonly used sorting algorithms, one
  must provide some analysis of these algorithms.

- These sorting algorithms can be applied to either array-based lists or
  linked lists.

## Selection Sort

- The ***Selection Sort Algorithm***: rearrange the list by selecting an
  element and moving it to its proper position.

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

  - For each iteration of the outer loop, the inner loop executes a
    certain number of times.

- The total number of comparisons is:
  $$(n - 1) + (n - 2) + \cdots + 2 + 1 = \frac{n(n - 1)}{2} = \frac{1}{2}n^2 - \frac{1}{2}n = O(n^2)$$

- The number of assignments (worst case):
  $$3\frac{n(n - 1)}{2}= \frac{3}{2}n^2 - \frac{3}{2}n = O(n^2)$$
  because there are 3 assignments per swap operator.

## Insertion Sort


The ***insertion sort algorithm*** sorts the list by moving each element
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
