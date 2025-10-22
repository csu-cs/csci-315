Binary Search Trees: Deletion
=============================

Chapter 19

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/-0koufxaOPk?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import deleteCasesDiagram from '/images/bst/bst-delete-cases.svg'
</script>

## Review

### Binary Trees

A ***binary tree*** is empty or has these properties:

- Has a root node.

- Has a left subtree and right subtree, which are binary trees.

![Binary Tree](/images/bst/binary-tree-1.svg "A Binary Tree"){.light-only}

![Binary Tree](/images/bst/binary-tree-1-dark.svg "A Binary Tree"){.dark-only}

- A node (called a vertex in graph theory):

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

- The ***Path Length*** is the number of branches on that path.

- Node ***Level***: number of branches from the root to the node.

  - The root node is at level 0.

- ***Height*** of a binary tree: number of edges on the longest path
  from the root to a leaf.

### Binary Search Tree

Definition: A ***binary search tree*** is either empty or has these
properties:

- Has a root node.

- Has two sets of nodes: the left and right subtrees.

- The key in the root node is larger than every key in the left subtree
  and smaller than every key in the right subtree.

- The left subtree and right subtree are binary search trees.

![Example Binary Search Tree](/images/bst/binary-search-tree-1.svg "Example Binary Search Tree"){.light-only}

![Example Binary Search Tree](/images/bst/binary-search-tree-1-dark.svg "Example Binary Search Tree"){.dark-only}

### Performance of a Binary Search Tree

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

## Deleting a Node

The four cases of delete depend on the node to be deleted:

1.  Is a leaf (e.g., 77)

2.  Has an empty left subtree (e.g., 53)

3.  Has an empty right subtree (e.g., 80)

4.  Has nonempty left and right subtrees (e.g., 50) 

<ProgressiveDiagram :src="deleteCasesDiagram" />

*See the lecture video for examples of each case.*

### Example Tree

![Example Binary Search Tree for Deleting](/images/bst/binary-tree-remove-example.svg "Example Binary Search Tree for Deleting"){.light-only}

![Example Binary Search Tree for Deleting](/images/bst/binary-tree-remove-example-dark.svg "Example Binary Search Tree for Deleting"){.dark-only}

### Example Tree: Remove 50

*See the lecture video.*

### Example Tree: Remove 35

*See the lecture video.*

### Performance of Delete

What is the average-case Big-$O$ performance of delete?
