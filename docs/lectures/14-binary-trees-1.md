Binary Search Trees: Insertion and Search
=========================================

Chapter 19

## Objectives

In this lecture, we will:

- Explore various binary-tree traversal algorithms.

- Explore how to implement the basic operations on a binary tree.

- Learn about binary *search* trees to:

  - Organize data

  - Insert and delete items

- Explore recursive and non-recursive tree traversal algorithms.

## Lecture Video

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/clqrPU9lnAY?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import insertDiagram from '/images/bst/insert-example.svg'
</script>

## Motivation

### The Problem with Arrays

***Binary search*** is an efficient search algorithm that relies  
on splitting a sorted list in half with each comparison.

Binary search works well on arrays. However,

- Insertion in an array is impossible, requiring the data to be copied
  to a new array. Deletion is also slow.

- Finding a specific value in a linked list is slow (needed for
  searching, insertion, and deletion).

### The Problem with Linked Lists

***Linked Lists***, while great for insertion and deletion at the  
ends, pose challenges for binary search due to the lack  
of contiguous memory.

- Must start iterating from the first/last node (i.e., sequential
  search).

- Cannot jump right to the middle to perform a binary search.

### Solution

**Solution**: Modify the linked-lists structure into a ***binary  
search tree***, where the binary search can be performed  
in logarithmic time (*usually*).

Binary Search Trees:

- Are ***binary trees*** that maintain the ***binary-search property***
  (*more on that in a moment*).

- Have the benefits of binary search with the flexibility of linked
  lists.

- Are fundamental in computer science and widely used in various
  algorithms and applications.


## Binary Trees

A ***binary tree*** is empty or has:

- One *root* (topmost) node.

- Left subtree and right subtree, which are binary trees.

![Binary Tree](/images/bst/binary-tree-1.svg "A Binary Tree"){.light-only}

![Binary Tree](/images/bst/binary-tree-1-dark.svg "A Binary Tree"){.dark-only}

Example Trees:

![Example binary trees with 1 to 3 nodes](/images/bst/binary-tree-1-3-node.svg "Example binary trees with 1 to 3 nodes"){.light-only}

![Example binary trees with 1 to 3 nodes](/images/bst/binary-tree-1-3-node-dark.svg "Example binary trees with 1 to 3 nodes"){.dark-only}

![More 3-node binary trees](/images/bst/binary-tree-3-node.svg "More 3-node binary trees"){.light-only}

![More 3-node binary trees](/images/bst/binary-tree-3-node-dark.svg "More 3-node binary trees"){.dark-only}


- A node (called a **vertex** in graph theory):

  - Has at most two children.

  - Stores its own information.

  - Keeps track of its left subtree and right subtree using pointers  
    (e.g., `left` and `right`).

- A pointer to the root node of the binary tree is stored outside the
  tree.

![Binary tree with the pointers shown](/images/bst/binary-tree-linked.svg "Binary tree with the pointers shown"){.light-only}

![Binary tree with the pointers shown](/images/bst/binary-tree-linked-dark.svg "Binary tree with the pointers shown"){.dark-only}

- ***Leaf***: a node that has no children.

- A ***parent*** has a branch to a ***child*** node.

- There is a unique ***path*** from the root to every node.

- The ***path length*** is the number of branches on that path.

- ***Edge***: The connection from a parent to a child.

- ***level*** of a node: number of branches from the root to the node.

  - The root node is at level 0.

- ***Height*** of a binary tree: number of edges on the longest path
  from the root to a leaf.


## Binary Search Tree

Definition: A ***binary search tree*** is either empty or has these
properties:

- Has a root node.

- Has two sets of nodes: the left and right subtrees.

- The key in the root node is larger than every key in the left subtree
  and smaller than every key in the right subtree.

- The left subtree and right subtree are binary search trees.

![Example Binary Search Tree](/images/bst/binary-search-tree-1.svg "Example Binary Search Tree"){.light-only}

![Example Binary Search Tree](/images/bst/binary-search-tree-1-dark.svg "Example Binary Search Tree"){.dark-only}

### Applications

Used when data is frequently added/removed and a quick search is needed
(e.g., maps, sets).  
Quick Operations:

- Insertion

- Removal

- Search (a.k.a., find, lookup) existing values

Example domains:

- The base structure for many database engines.

- Computer graphics for determining object intersection.

## Searching for a Value in a Binary Search Tree

Can be implemented iteratively or recursively.

If the node…

1.  is null, return “not found”.

2.  contains the key,  
    return `true`.

3.  contains a key is greater,  
    search the left subtree.

4.  contains a key is less,  
    search the right subtree.

## Inserting Values into a Binary Search Tree

<ProgressiveDiagram :src="insertDiagram">

Binary Search tree with the keys inserted in this order:  
59, 70, 50, 58, 30, 44, 98, 77

</ProgressiveDiagram>

The helper function for the recursive insert needs a reference to a
`Node` pointer.

[Click here to visualize
why.](https://pythontutor.com/visualize.html#code=class%20BinarySearchTree%0A%7B%0Apublic%3A%0A%20%20%20%20BinarySearchTree%28%29%20%3A%20mpRoot%7Bnullptr%7D%20%7B%7D%3B%0A%0A%20%20%20%20void%20insert%28const%20int%20val%29%3B%0A%0A%20%20%20%20~BinarySearchTree%28%29%3B%0A%0Aprivate%3A%0A%20%20%20%20struct%20Node%20%7B%0A%20%20%20%20%20%20%20%20Node%28const%20int%26%20val%29%0A%20%20%20%20%20%20%20%20%20%20%3A%20key%7Bval%7D,%20pLeft%7Bnullptr%7D,%20pRight%7Bnullptr%7D%0A%20%20%20%20%20%20%20%20%7B%7D%0A%20%20%20%20%20%20%20%20%0A%20%20%20%20%20%20%20%20~Node%28%29%0A%20%20%20%20%20%20%20%20%7B%0A%20%20%20%20%20%20%20%20%20%20delete%20pLeft%3B%0A%20%20%20%20%20%20%20%20%20%20delete%20pRight%3B%0A%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%20%20%0A%20%20%20%20%20%20%20%20int%20key%3B%0A%20%20%20%20%20%20%20%20Node%20*pLeft%3B%0A%20%20%20%20%20%20%20%20Node%20*pRight%3B%0A%20%20%20%20%7D%3B%0A%0A%20%20%20%20//%20Bug%3A%20need%20a%20reference%20to%20the%20node%20pointer%0A%20%20%20%20static%20void%20insert%28const%20int%20key,%20Node*%20pRoot%29%3B%0A%20%20%20%20%0A%20%20%20%20Node%20*mpRoot%3B%0A%7D%3B%0A%0A%0Aint%20main%28%29%0A%7B%0A%20%20%20%20BinarySearchTree%20tree%3B%0A%20%20%20%20tree.insert%2859%29%3B%0A%20%20%20%20tree.insert%2870%29%3B%0A%20%20%20%20tree.insert%2850%29%3B%0A%20%20%0A%20%20%20%20return%200%3B%0A%7D%0A%0Avoid%20BinarySearchTree%3A%3Ainsert%28const%20int%20key%29%0A%7B%0A%20%20%20%20insert%28key,%20mpRoot%29%3B%0A%7D%0A%0Avoid%20BinarySearchTree%3A%3Ainsert%28const%20int%20key,%20Node*%20pRoot%29%20%7B%0A%20%20%20%20if%20%28pRoot%20%3D%3D%20nullptr%29%20%7B%0A%20%20%20%20%20%20%20%20pRoot%20%3D%20new%20Node%7Bkey%7D%3B%0A%20%20%20%20%7D%0A%20%20%20%20else%20if%20%28key%20%3C%20pRoot-%3Ekey%29%20%7B%0A%20%20%20%20%20%20%20%20insert%28key,%20pRoot-%3EpLeft%29%3B%0A%20%20%20%20%7D%0A%20%20%20%20else%20%7B%0A%20%20%20%20%20%20%20%20insert%28key,%20pRoot-%3EpRight%29%3B%0A%20%20%20%20%7D%0A%7D%0A%0ABinarySearchTree%3A%3A~BinarySearchTree%28%29%20%7B%0A%20%20%20%20delete%20mpRoot%3B%0A%7D&cppShowMemAddrs=true&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=cpp_g%2B%2B9.3.0&rawInputLstJSON=%5B%5D&textReferences=false)

How do we handle duplicate keys?

We must choose one of three options. The duplicate key is…

1.  not inserted (don’t permit duplicate keys).

2.  inserted to the ***left*** of the matching key.

3.  inserted to the ***right*** of the matching key.

As long as the `insert()` and `contains()` functions follow the same
behavior, everything will work.

## Performance Analysis for a Binary Search Tree

What is the Big-O performance of an operation?

![Best-Case (Perfectly-Balanced Tree) is $O(\log_2 n)$](/images/bst/binary-search-tree-balanced.svg "Best-Case (Perfectly-Balanced Tree) is $O(\log_2 n)$"){.light-only}

![Best-Case (Perfectly-Balanced Tree) is $O(\log_2 n)$](/images/bst/binary-search-tree-balanced-dark.svg "Best-Case (Perfectly-Balanced Tree) is $O(\log_2 n)$"){.dark-only}

![A Worst-Case Example is $O(n)$](/images/bst/binary-search-tree-worst-case.svg "A Worst-Case Example is $O(n)$"){.light-only}

![A Worst-Case Example is $O(n)$](/images/bst/binary-search-tree-worst-case-dark.svg "A Worst-Case Example is $O(n)$"){.dark-only}

### Average Performance a Binary Search Tree

- There are $n!$ possible orderings of the keys (assuming that all
  orderings are possible).

- For both average successful and unsuccessful searches of a nonempty
  tree:  
  Number of comparisons $\approx 2.77\log_2{n} = O(\log_2{n})$  
  Number of nodes visited $\approx 1.39\log_2{n} = O(\log_2{n})$

What is the *average-case* Big-O of the following operations on a binary
search tree?  

|  | **Array** | **Linked List** | **Binary Search Tree** |
|---:|:--:|:--:|:--:|
| Random Access | $O(1)$ | $O(n)$ | *NA* |
| Insert/Remove | $O(n)$ | $O(n)$ | $O\left(\log_2{n}\right)$ |
| Search | $O(n)$ | $O(n)$ | $O\left(\log_2{n}\right)$ |
| Sort | $O\left(n \log_2{n}\right)$ | $O\left(n \log_2{n}\right)$ | *NA* * |

\* A binary-search tree is already sorted. To convert it to a sorted list, a 
inorder traversal will take $O(n)$.
