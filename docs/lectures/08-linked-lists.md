Singly-Linked Lists
===================

Chapter 16

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/MVfPgIGuooE?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import traversalDiagram from '/images/singly-linked-lists/traversal.svg'
import prepend_nonemptyDiagram from '/images/singly-linked-lists/prepend_nonempty.svg'
import prepend_emptyDiagram from '/images/singly-linked-lists/prepend_empty.svg'
import append_nonemptyDiagram from '/images/singly-linked-lists/append_nonempty.svg'
import insert_middleDiagram from '/images/singly-linked-lists/insert_middle.svg'
</script>

## Introduction

- Often, data is organized and processed sequentially (in a
  ***sequential list***).

- An array is a useful data structure for sequential processing, but has
  its limitations.

  - Array sizes are fixed.

  - Searching is slow for unsorted arrays.

  - Insertion and deletion are slow because they require data movement.

### Array Performance

What is the order of approximation (Big O) of the following operations
on an array?

|                              |         **Array**          |
|-----------------------------:|:--------------------------:|
|               Element Access |           $O(1)$           |
| Insert/Remove from Beginning |           $O(n)$           |
|            Insert at the End | $O(1)$, but $O(n)$ if full |
|              Remove from End |  $O(1)$ with wasted space  |
|    Insert/Remove from Middle |           $O(n)$           |
|              Unsorted Search |           $O(n)$           |

### Linked Lists

- ***Linked lists*** store data in ***nodes***, where each node contains
  the data and a pointer to the next node.

- The first node is called the head, and the last is the tail.

![Example of a linked list](/images/singly-linked-lists/linked_list-example1.svg "Example of a linked list."){.light-only}

![Example of a linked list](/images/singly-linked-lists/linked_list-example1-dark.svg "Example of a linked list."){.dark-only}

### Advantages of Linked Lists

- A variable size; memory is allocated and released as needed.

- Some algorithms are faster with linked lists compared to arrays.

- Expandable to nonlinear data structures (nodes with multiple
  pointers).  
  For example, trees and graphs.

### Disadvantages of Linked Lists

- Additional memory. Each pointer requires additional 4 or 8 bytes, which 
  may be significant with large data sets.

- Discontiguous memory (spread over disconnected locations).

- Some algorithms are slower on Linked Lists, compared to on arrays.

## The `Node` Class/Struct

Each node contains a data value (datum) and a pointer to the next node.

```C++
struct Node {
  Node (const char &value = ' ')
    : datum{value},
      pNext{nullptr}
  {}

  char datum; // holds a value in the list
  Node* pNext;
}
```

### Working with Nodes

- Variable declaration:  
  `Node *pHead{nullptr};`  
  ![](/images/singly-linked-lists/nodes_empty.svg){.light-only}
  ![](/images/singly-linked-lists/nodes_empty-dark.svg){.dark-only}

- Add a value:  
  `pHead = new Node{'A'};`  
  ![](/images/singly-linked-lists/nodes_A.svg){.light-only}
  ![](/images/singly-linked-lists/nodes_A-dark.svg){.dark-only}

- Add another value:  
  `pHead->pNext = new Node{'B'};`  
  ![](/images/singly-linked-lists/nodes_AB.svg){.light-only}
  ![](/images/singly-linked-lists/nodes_AB-dark.svg){.dark-only}

- Add a third value:  
  `pHead->pNext->pNext = new Node{'C'};`  
  ![](/images/singly-linked-lists/nodes_ABC.svg){.light-only}
  ![](/images/singly-linked-lists/nodes_ABC-dark.svg){.dark-only}

### Traversing a Linked List

Given a pointer to the first node, step through each node.

```C++
Node *pCurr{pHead}; // Start at the front
while (pCurr != nullptr) {
  // Do something with this node's datum.
  pCurr = pCurr->pNext; // Go to next node.
}
```

Given a pointer to the first node, step through each node.

<ProgressiveDiagram :src="traversalDiagram" />

```C++
for (Node *pCurr = pHead; pCurr != nullptr;
    pCurr = pCurr->pNext)
{
  // Do something with this node's datum.
}
```

### Displaying a Linked List

Our traversal algorithm can display our list.

```C++
void display(const Node * const pHead) {
  for (const Node *pCurr = pHead; pCurr != nullptr;
      pCurr = pCurr->pNext)
  {
    std::cout << pCurr->datum << ", ";
  }
  std::cout << '\n';
}
```

## Linked-List Class

- To support data use, we should create a container class.

- Provide methods for using the list.

  - constructor(s)
  - prepend(value)
  - append(value)
  - insert(index, value)
  - remove(index, value)
  - set(index, value)
  - getLength()
  - …

- Hide the Node struct/class implementation.

Private data includes pointers to the head and tail and an integer node
count.

```C++
class LinkedList {
public:
	// constructors and functions
private:
	Node *mpHead;
	Node *mpTail;
	int mSize;
};
```

### Default Constructor

The default constructor for a `LinkedList` creates an empty list.

```C++
LinkedList::LinkedList()
	: mpHead{nullptr},
	mpTail{nullptr},
	mSize{0}
{
}
```

## Insertion (Adding Data)

- Elements can be added at any position in the list.

- Head and tail modification are special cases.

- When testing your code, ask if the code works for…

  1.  an empty list?

  2.  a list where the head and/or tail might change?

  3.  an internal node in a list of multiple elements?

## Prepend (Add to Beginning)


1.  Create a new node.  
    `Node *pNewNode{new Node{"new"}};`

2.  Set next for the new node.  
    `pNewNode->pNext = mpHead;`  

3.  Update the head to point to the new node.  
    `mpHead = pNewNode;`  

<ProgressiveDiagram :src="prepend_nonemptyDiagram" />


If the list was empty (and now has one element), update the tail.

<ProgressiveDiagram :src="prepend_emptyDiagram" />

```C++
void LinkList::prepend(const std::string &value) {
  Node *pNewNode{new Node{value}};
  pNewNode->pNext = mpHead;
  mpHead = pNewNode;
  ++mSize;

  // If it was empty, update the tail pointer.
  if(mpTail != nullptr) {
    mpTail = mpHead;
  }
}
```

## Append (Add to End)

1.  Create a new node.  
    `Node *pNewNode{new Node{"new"}};`

2.  If there is a tail, update its next to point to the new node.  
    `mpTail->pNext = pNewNode;`

3.  Update the tail to point to the new node.  
    `mpTail = pNewNode;`  

<ProgressiveDiagram :src="append_nonemptyDiagram" />

```C++
void LinkList::append(const std::string &value)
{
  Node *pNewNode{new Node{value}};

  // For an empty list, mpHead also changes.
  if (mpTail == nullptr)
  {
    mpHead = pNewNode;
  }
  else
  {
    mpTail->pNext = pNewNode;
  }
  mpTail = pNewNode;

  ++mSize;
}
```

## Inserting a Value at an Index

- If the index is 0, call the `prepend()` function.

- If the index is size-1, call the `append()` function.

- Otherwise, traverse to the insertion location.

```C++
void LinkList::insert(const std::string &val, int index)
{
  if (index <= 0)
  {
    prepend(val);
  }
  else if (index >= mSize)
  {
    append(val);
  }
  else
  {
    // Traverse to the location and insert.
  }
}
```

### Insert in the Middle

1.  Create a new node.  
    `Node *pNewNode{new Node{"new"}};`

2.  Traverse to the node before the insertion point.

    ```C++
    Node *pBefore{mpHead};
    for (int iter{1}; iter < index; ++iter)
    {
      pBefore = pBefore->pNext;
    }
    ```

3.  Set the new node’s next to pBefore’s next.  
    `pNewNode->pNext = pBefore->pNext;`  

4.  Set pBefore’s next to the new node.  
    `pBefore->pNext = pNewNode;`  

<ProgressiveDiagram :src="insert_middleDiagram" />

### Implementation

```C++
// Contents of the final else statement.
Node *pNewNode{new Node{val}};
Node *pBefore{mpHead};
for (int iter = 1; iter < index; ++iter)
{
  pBefore = pBefore->pNext;
}
pNewNode->pNext = pBefore->pNext;
pBefore->pNext = pNewNode;
```

## The Rule of Three

If you define one of the following, you probably should define all
three.

- Destructor  
  `~LinkedList();`

- Copy Constructor  
  `LinkedList(const LinkedList &source);`

- Assignment Operator  
  `LinkedList& operator=(const LinkedList& source);`

If your class uses dynamic memory, you probably should create all three.

<https://en.cppreference.com/w/cpp/language/rule_of_three>


Common tasks using these objects:

```C++
{
  LinkedList src;           // Default constructor
  LinkedList copy1{src}     // Copy constructor
  LinkedList copy1(src)     // Copy constructor
  LinkedList copy2 = two;   // Copy constructor
  auto *pDyn = new LinkedList{src}; // Copy cons.
  copy1 = src;              // Assignment operator
  // ...
  delete pDyn;             //Destructor
} // Here, objects on the stack leave scope;
  // the destructor is called.
```

### Destructor

The destructor function must traverse the list, deallocating each node.

```C++
LinkedList::~LinkedList() {
  Node *pToDelete;

  while (mpHead != nullptr) {
    pToDelete = mpHead;
    mpHead = mpHead->pNext;
    delete pToDelete;
  }
}
```

If you create a function to clear a list without destroying it,  
remember to also update `mpTail` and `mSize`.

### Copy Constructor

Traverse the other list while adding each value to this list.

```C++
LinkedList::LinkedList(const LinkedList& source)
  : mpHead{nullptr}, mpTail{nullptr},
    mSize{0};
{
  for (Node *pCurr = source.mpHead; pCurr != nullptr;
    pCurr = pCurr->pNext)
  {
    append(pCurr->datum);
  }
}
```

### Assignment Operator

```C++
LinkedList& LinkedList::operator=(const LinkedList& src) {
  if (&src == this) // self-assignment (a = a)
    return *this;

  clear(); // Clear out existing nodes
  mpHead = mpTail = nullptr; // Reset pointers
  mSize = 0;

  // Copy values over
  for (Node *pCurr = src.mpHead; pCurr != nullptr;
    pCurr = pCurr->pNext)
    append(pCurr->datum);
  return *this;
}
```

## Removing Elements  

### Removing the First Element

- Before deleting, save the old head and update the head.  

  ```C++
  Node *pOldHead{mpHead};
  mpHead = mpHead->pNext;
  delete pOldHead;
  ```

### Removing the First Element

If the list is now empty, set the head and tail pointers to null.

```C++
std::string LinkedList::removeFirst() {
  std::string value;
  if (mpHead != nullptr) { // not empty
    Node *pOldHead{mpHead};
    mpHead = mpHead->pNext;
    if (mpHead == nullptr) { // Only 1 element
      mpTail = nullptr;
    }
    --mSize;
    value = pOldHead->datum;
    delete pOldHead;
  }
  return value;
}
```

### Removing the List Element

1.  Before deleting, traverse to the node before the tail  
    (the new tail).  
    ```C++
    Node *pBefore{mpHead};
    for (int iter = 2; iter < mSize; ++iter)
    {
      pBefore = pBefore->pNext;
    }
    ```

2.  Update current’s next to null.  
    `pBefore->pNext = nullptr;`  

3.  Delete tail and point to the new tail.  
    `delete mpTail;`  
    `mpTail = pBefore;`  

```C++
std::string LinkedList::removeLast()
{
  std::string value;
  if (mpHead != nullptr)
  {
    value = mpTail->datum; // return value
    Node* pBefore = mpHead;
    for (int iter = 2; iter < mSize; ++iter)
      pBefore = pBefore->pNext;
    pBefore->pNext = nullptr;
    delete mpTail;
    if(mpHead == mpTail) // removing the only element
      mpHead = mpTail = nullptr;
    else
      mpTail = pBefore; // update tail
    --mSize;
  }
  return value;
}
```

### Remove an Element at an Index

1.  Traverse to the position before the node to remove.  

    ```C++
    Node *pPrev{mpHead};
    for (int iter = 1; iter < index; ++iter)
    {
      pPrev = pPrev->pNext;
    }
    ```

2.  Create a pointer to the node to remove.  
    `Node *pDel = pPrev->pNext;`

3.  Set `pPrev`’s next point to the node after the deletion.  
    `pPrev->pNext = pDel->pNext;`

4.  Delete the node.  
    `delete pDel;`


```C++
std::string LinkedList::removeAt(int index) {
  std::string value;
  if (index == 0) {
    value = removeFirst();
  }
  else if (index >= mSize) { // true for empty lists
    value = removeLast();
  }
  else {
    // Traverse to node before index..
    // Adjust the pointers.
    // Delete the node.
  }
  return value;
}
```

The final else statement contains the following code:

```C++
Node *pPrev{mpHead};

for (int iter = 1; iter < index; ++iter) {
  pPrev = pPrev->pNext;
}

Node *pDel = pDel = pPrev->pNext;
pPrev->pNext = pDel->pNext; // Adjust pointers
--mSize;

value = pDel->datum; // save the return value
delete pDel; // Delete the node.
```

## Linked-List Performance

What is the average-case Big $O$ of the following operations on linked lists?

|                              | **Array** | **Linked List** |
|-----------------------------:|:---------:|:---------------:|
|               Element Access |  $O(1)$   |     $O(n)$      |
| Insert/Remove from Beginning |  $O(n)$   |     $O(1)$      |
|  Insert from End (with tail) |  $O(n)$   |     $O(1)$      |
|              Remove from End |  $O(n)$   |     $O(n)$      |
|    Insert/Remove from Middle |  $O(n)$   |     $O(n)$      |
|              Unsorted Search |  $O(n)$   |     $O(n)$      |

## Abstract Data Type

Ideally, we can use our list class with any data type. Use templates to
make an abstract data type.

```C++
template<typename Type>
struct Node {
  Node();
  Node(Type value);

  Type datum;
  Node<Type> *pNext;
};
```

```C++
template<typename Type>
class LinkedList {
public:
  // ...
private:
  Node<Type> *mpHead;
  Node<Type> *mpTail;
};
```

Each function definition must be updated to match. For example,

```C++
// Copy Constructor Definition
template <typename Type>
LinkedList::LinkedList(const LinkedList<Type> &src)
  : mpHead(nullptr), mpTail(nullptr),
    mSize(0)
{
  for (Node *pCurr = src.mpHead; pCurr != nullptr;
    pCurr = pCurr->pNext)
  {
    append(pCurr->mDatum);
  }
}
```

We can then use our `LinkedList` class with any type.  

```C++
LinkedList<int> intList;
LinkedList<double> floatList;

for (int index = 0; index < 100; ++index)
	intList.append(index);

for (double index = 0; index < 100; ++index)
	floatList.append(index / 10.0);
```

## Tip: Remember Valgrind

The address sanitizer (ASan) that is included with `-fsanitize=address`
doesn’t catch everything.

For example, if we forgot to initialize the member variables in the copy
constructor, it will go unreported.

Before committing, double-check by doing the following:

1.  Run `make clean`.

2.  Comment out `-fsanitize=address` in the makefile.

3.  Recompile using `make` or `make some-test`.

4.  The run with valgrind with `valgrind ./main` or
    `valgrind ./test-runner`.

For example, what happens if we forgot to initialize the member variables in the copy constructor? This is a common mistake when implementing the Rule of 3.

Notice that ASan doesn't report any issues, but Valgrind does.

The reason is that ASan doesn't check uninitialized memory reads, but Valgrind does.

## Lab 8: Singly-Linked Lists

Let’s take a look at Lab 8.
