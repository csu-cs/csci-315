Merge Sort
==========

Chapter 18

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/zyS-SQYKA_g?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import mergeSort1Diagram from '/images/merge-sort/merge_sort_example1.svg'
import listDivideDiagram from '/images/merge-sort/list_divide.svg'
</script>

## Introduction

- ***Quick Sort***: $O(n\log_2n)$ average case; $O(n^2)$ worst case

- ***Merge Sort***: always $O(n\log_2n)$

- Unlike Quick Sort, it divides the list into two sub-lists of nearly
  equal size.

- Uses the divide-and-conquer technique.

  - Partitions the list into two sub-lists of nearly equal size.

  - Sorts the sub-lists.

  - Combines the sub-lists into one sorted list.

## Merge Sort Algorithm

- Uses recursion.

- If the list is of assize greater than 1,

  1.  Divide the list into two sub-lists.

  2.  Merge sort the first sub-list.

  3.  Merge sort the second sub-list.

  4.  Merge the first sub-list and the second sub-list.

Example of how values will divided repeatedly into smaller lists and then merged back together in sorted order.

<ProgressiveDiagram :src="mergeSort1Diagram" />


### Merging Two Sorted Arrays

*See the lecture video above for the example of merging two arrays.*

### Find Middle and Dividing a Linked List

<ProgressiveDiagram :src="listDivideDiagram" />

### Merging Two Linked Lists

Sorted sub-lists are merged into one sorted list.

- Compare elements of sub-lists

- Adjust pointers of nodes with the smaller datum.

*See the lecture video above for merging two sorted link list into one.*

## Analysis: Merge Sort

- Suppose that $L$ is a list of $n$ elements, with $n > 0$.

- Suppose that $n$ is a power of $2$; that is, $n = 2^m$ for some
  integer $m > 0$, so that we can divide the list into two sub-lists,
  each of size:  
  $$\frac{n}{2}=\frac{2^m}{2}=2^{m-1}$$
  $m$ will be the number of recursion levels.

![Number of elements per recursive level of the Merge Sort](/images/merge-sort/merge_sort_anlaysis.svg "Number of elements per recursive level of the Merge Sort"){.light-only}

![Number of elements per recursive level of the Merge Sort](/images/merge-sort/merge_sort_anlaysis-dark.svg "Number of elements per recursive level of the Merge Sort"){.dark-only}

- To merge two sorted lists of size $s$ and $t$, the maximum number of
  comparisons is $s + t - 1$.

- Merging two sorted lists into a sorted list is where the actual
  comparisons and assignments are done.

- Max. \# of comparisons at level $k$ of recursion:
  $$2^k\left(\frac{n}{2^k} - 1\right) = n - 2^k = O(n)$$

- There are at most $O(n)$ comparisons per recursion level.

- Therefore, there are $O(nm)$ total comparisons,  
  where $m$ is the number of levels of recursion.

- Thus, $O(nm) \equiv O(n \log_2n)$.

- Key comparisons in the worst case:  
  $$O\left(n\log_2n\right)$$

- Key comparisons in average case:  
  $$n\log_2n - 1.25n = O\left(n\log_2n\right)$$



## Summary

-  [Check out this Sorting Algorithms
   Animation.](https://www.toptal.com/developers/sorting-algorithms)

- By ***asymptotic***, we mean the rate of growth of function $f(n)$ as
  $n$ grows towards infinity.

- On average, a sequential search searches half the list and makes
  $O(n)$ comparisons, which is inefficient.

- The binary-search algorithm is the optimal worst-case algorithm for
  solving search problems by using the *comparison method*.

- A binary search requires the list to be sorted but takes only
  $2\log_2n - 3$ or O$(\log_2n)$ key comparisons.

- Bubble Sort: $O(n^2)$ key comparisons and item assignments.

- Selection Sort: $O(n^2)$ key comparisons and $O(n)$ item assignments.

- Insertion Sort: $O(n^2)$ key comparisons and item assignments.

- Both the Quick Sort and Merge Sort algorithms partition a list to sort
  it.

  - Quick Sort: average number of key comparisons is $O(n\log_2n)$;
    worst case number of key comparisons is $O(n^2)$

  - Merge Sort: the number of key comparisons is $O(n\log_2n)$ on
    average and in the worst case.

## Lab 11: Insertion, Quick, and Merge Sort

Let’s take a look at Lab 11.
