Quick Sort
==========

Chapter 18

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/SdXttsJgJm0?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import quickSortDiagram from '/images/quick-sort/quick_sort_example.svg'
</script>

## Best Possible Performance

### Lower Bound on Comparison-Based Sorting

Can we do better than $O(n^2)$ for sorting algorithms?

What is the best we can do?

### Comparison Tree

- ***Comparison tree***: graph used to trace the execution of a
  comparison-based algorithm.

  - Let $L$ be a list of $n$ distinct elements, where $n > 0$. For any $j$ and $k$, where $1 \le j \le n$, $0 \le k < n$, either $L_{j} \le L_{k}$ or $L_{j} > L_{k}$.

- ***Binary tree***: each comparison has two outcomes.

![Example Binary Tree](/images/quick-sort/example_tree.svg "Example Binary Tree"){.light-only}

![Example Binary Tree](/images/quick-sort/example_tree-dark.svg "Example Binary Tree"){.dark-only}

### Terminology of Comparison Trees

- ***Node***: represents a comparison

  - Labeled as $j:k$ (comparison of $L_j$ with $L_k$)

  - If $L_j < L_k$, follow the left branch; otherwise, follow the
    right branch.

- ***Leaf***: represents the final ordering of the nodes

- ***Root***: the top node

- ***Branch***: line that connects two nodes

- ***Path***: sequence of branches from one node to another

### Comparison Tree for Sorting 3 Items

![Comparison Tree for Sorting 3 Items](/images/quick-sort/comparison_tree_3.svg "Comparison Tree for Sorting 3 Items"){.light-only}

![Comparison Tree for Sorting 3 Items](/images/quick-sort/comparison_tree_3-dark.svg "Comparison Tree for Sorting 3 Items"){.dark-only}

- A unique permutation of the elements of $L$ is associated with each
  root-to-leaf path.

  - Because the sort algorithm only moves the data and makes
    comparisons.

- For a list of $n$ elements, $n > 0$, there are $n!$ different
  permutations

  - Any of these might be the correct ordering of $L$.

- Thus, the tree must have ***at least*** $n!$ leaves.

### Lower Bound on Comparison-Based Sorting

Theorem: Any sorting algorithm that sorts a list of $n$ elements (by
comparison of only the keys) makes ***at least*** $O(n\log_2n)$ key
comparisons in its worst case.

We won’t prove this theorem, but unlike the previous algorithms
discussed, there are algorithms that, on average, are $O(n\log_2n)$.

## Introduction

***Quick sort***: uses the divide-and-conquer technique.

- The list is *partitioned* into two sub-lists.

- Each sub-list is then sorted.

- Sorted sub-lists are combined into one list in such a way that the
  combined list is sorted.

- All the sorting work occurs when partitioning the list.

### Pivot Element

Choose an element to split the list ***pivot element***.

- Move elements less than the pivot value to the lower sub-list.

- Move elements greater than the pivot value to the upper sub-list.

- The pivot can be chosen in several ways.  
  Ideally, the pivot will divide the list into two sub-lists of
  near-equal size.

### Quick Sort: Example


![Unsorted List](/images/quick-sort/unsorted.svg "Unsorted List"){.light-only}

![Unsorted List](/images/quick-sort/unsorted-dark.svg "Unsorted List"){.dark-only}

![After First Quick-Sort Partition](/images/quick-sort/first_partition.svg "After First Quick-Sort Partition"){.light-only}

![After First Quick-Sort Partition](/images/quick-sort/first_partition-dark.svg "After First Quick-Sort Partition"){.dark-only}

See quick-sort example animation below, which goes through one iteration.

<ProgressiveDiagram :src="quickSortDiagram" />

## Analysis of Quick Sort

|                **Algorithm** | **Comparisons**  | **Swaps**        |
|-----------------------------:|:-----------------|:-----------------|
|                  Bubble Sort | $O(n^2)$         | $O(n^2)$         |
|               Selection Sort | $O(n^2)$         | $O(n)$           |
|   Array-Based Insertion Sort | $O(n^2)$         | $O(n^2)$         |
|   Linked-List Insertion Sort | $O(n^2)$         | $O(n)$           |
| **Quick Sort**: Average Case | $O(n \log_2{n})$ | $O(n \log_2{n})$ |
|   **Quick Sort**: Worst Case | $O(n^2)$         | $O(n^2)$         |

| **Quick Sort** |   **Comparisons**    |      **Swaps**       |
|---------------:|:--------------------:|:--------------------:|
|   Average Case | $(1.39) n \log_2{n}$ | $(0.69) n \log_2{n}$ |
|     Worst Case | $\frac{n^2 - n}{2}$  | $\frac{n^2 - 3n}{2}$ |

### Worst Case of Quick Sort

If the chosen pivot is always the smallest or largest value, Quick Sort
behaves like a ***Selection Sort***.

## Quick Sort Optimizations

- Choose a better pivot.

  - Median of three: first, middle, last elements.

  - Randomly select a pivot.

- Use a different algorithm for small sub-lists.

  - Insertion sort is best for lists of 10 or fewer elements.

  - The overhead of the recursive calls is greater than the cost of the
    insertion sort.

- Use fancy partitioning techniques.

  - Hoare's partitioning: Traverse the list from both sizes, swapping
    smaller elements to the left and larger elements to the right.

  - Dual-Pivot partitioning: Partitions the list into three sub-lists.
