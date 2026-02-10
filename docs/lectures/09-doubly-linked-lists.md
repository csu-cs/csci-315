Doubly-Linked List and Project 1
================================

Chapter 16

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/23CXK00ZH2M?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## What if we want to traverse the list in reverse?

Three Options:

1.  We can use recursion to iterate to the end and then perform the
    operation when we “unwind.”

2.  We can use a helper data structure (a stack).

3.  We can implement a ***doubly-linked list*** type, where every node
    has a next and previous pointer.

    ![Example of a doubly-linked list](/images/doubly-linked-lists/dll_example1.svg "Example of a doubly-linked list."){width="520px" .light-only}

    ![Example of a doubly-linked list](/images/doubly-linked-lists/dll_example1-dark.svg "Example of a doubly-linked list."){width="520px" .dark-only}

## Prepending a Doubly-Linked List

Step 0:

![Initial State](/images/doubly-linked-lists/dll_prepend1.svg "Initial State before prepending to a doubly-linked list."){width="520px" .light-only}

![Initial State](/images/doubly-linked-lists/dll_prepend1-dark.svg "Initial State before prepending to a doubly-linked list."){width="520px" .dark-only}


Step 1:

![Create the new node](/images/doubly-linked-lists/dll_prepend2.svg "Create the new node."){width="520px" .light-only}

![Create the new node](/images/doubly-linked-lists/dll_prepend2-dark.svg "Create the new node."){width="520px" .dark-only}

Step 2:

![Update pNewNode->pNext to mpHead](/images/doubly-linked-lists/dll_prepend3.svg "Update `pNewNode->pNext` to `mpHead`."){width="520px" .light-only}

![Update pNewNode->pNext to mpHead](/images/doubly-linked-lists/dll_prepend3-dark.svg "Update `pNewNode->pNext` to `mpHead`."){width="520px" .dark-only}

Step 3:

![Update mpHead->pPrev to pNewNode.](/images/doubly-linked-lists/dll_prepend4.svg "Update `mpHead->pPrev` to `pNewNode`."){width="520px" .light-only}

![Update mpHead->pPrev to pNewNode.](/images/doubly-linked-lists/dll_prepend4-dark.svg "Update `mpHead->pPrev` to `pNewNode`."){width="520px" .dark-only}

Step 4:

![Update mpHead to pNewNode.](/images/doubly-linked-lists/dll_prepend5.svg "Update `mpHead` to `pNewNode`."){width="520px" .light-only}

![Update mpHead to pNewNode.](/images/doubly-linked-lists/dll_prepend5-dark.svg "Update `mpHead` to `pNewNode`."){width="520px" .dark-only}


## Appending a Doubly-Linked List

Step 0:

![Initial State](/images/doubly-linked-lists/dll_append1.svg "Initial State before appending to a doubly-linked list."){width="520px" .light-only}

![Initial State](/images/doubly-linked-lists/dll_append1-dark.svg "Initial State before appending to a doubly-linked list."){width="520px" .dark-only}

Step 1:

![Create the new node](/images/doubly-linked-lists/dll_append2.svg "Create the new node."){width="520px" .light-only}

![Create the new node](/images/doubly-linked-lists/dll_append2-dark.svg "Create the new node."){width="520px" .dark-only}

Step 2:

![Update pNewNode->pNext to mpHead](/images/doubly-linked-lists/dll_append3.svg "Update `pNewNode->pNext` to `mpTail`."){width="520px" .light-only}

![Update pNewNode->pNext to mpHead](/images/doubly-linked-lists/dll_append3-dark.svg "Update `pNewNode->pNext` to `mpTail`."){width="520px" .dark-only}

Step 3:

![Update mpTail->pNext to pNewNode.](/images/doubly-linked-lists/dll_append4.svg "Update `mpTail->pNext` to `pNewNode`."){width="520px" .light-only}

![Update mpTail->pNext to pNewNode.](/images/doubly-linked-lists/dll_append4-dark.svg "Update `mpTail->pNext` to `pNewNode`."){width="520px" .dark-only}

Step 4:

![Update mpTail to pNewNode.](/images/doubly-linked-lists/dll_append5.svg "Update `mpTail` to `pNewNode`."){width="520px" .light-only}

![Update mpTail to pNewNode.](/images/doubly-linked-lists/dll_append5-dark.svg "Update `mpTail` to `pNewNode`."){width="520px" .dark-only}


Intro. to the Standard Template Library (SLT)
---------------------------------------------

[Go here for lecture notes on the STL.](17-standard-template-library)

## Homework

- Lab 9: *Doubly-Linked Lists*

- Project 1: *Large Map*
