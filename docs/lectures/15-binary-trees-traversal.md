Binary Search Trees: Generic Traversal and Function Objects
===========================================================

Chapter 19

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/x8dwwp_2Ebg?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

- In a traversal algorithm, “visiting” may mean different things.

  - For example, outputting the values, updating the values, and
    calculating results.

- ***Problems***:

  - Repeatedly implementing a specific traversal algorithm for each
    function.

  - Must have access to the internals of the tree.

- ***The Solution***: Write a generic traversal function that accepts a
  function as a parameter.

- In C++, a function name without parentheses is considered a pointer to
  the function.

- To specify a function as a formal parameter to another function,

  1.  specify the function type (e.g., `void`),

  2.  the name as a pointer (e.g., `(*visit)`),

  3.  the parameter types (e.g., `(int, double)`).

- For example,
  
  ```C++
  void funcParamFunc1(void (*visit) (int));

  template<typename Type>
  void funcParamFunc2(void (*visit) (Type&));
  ```

## Generic Traversal Example

A recursive member function that accepts a node to tree to traverse and
a function to call at each node.

```C++
template<typename Type>
void BinarySearchTree<Type>::inorder(Node *root,
      void (*visit)(Type& value)) {
  if (root != nullptr)  {
    inorder(root->left, visit);

    visit(root->info);

    inorder(root->right, visit);
  }
}
```

## Function Objects (a.k.a. Functors)

- In short, and object that looks like a function, but that  
  can maintain state.

- A function object is an object class/struct that overloads
  `operator()`.

- Can be passed to a generic traversal function instead of a function
  pointer.

### Function Object: Example Definition

```C++
template <typename Type>
struct SumValues {
  Type sum;

  // Constructor initializes sum to 0
  SumValues() : sum(0) {}

  // Overloaded operator() to accumulate sum
  void operator()(Type data) {
    sum += data;
  }
};
```

### Function Object: How it Works

```C++
SumValues funObj;

funObj(10);
funObj(20);

std::cout << funObj.sum << '\n'; // 30
```

### Function Object: Example Generic Traversal

```C++
template<typename Type>
template<typename Callable>
void BinarySearchTree<Type>::preorderTraversal(Node* pCurr, Callable& callable)
{
  if (pCurr != nullptr)
  {
    callable(pCurr->value); // visit the node
    preorderTraversal(pCurr->pLeft, callable);
    preorderTraversal(pCurr->pRight, callable);
  }
}
```

```C++
template<typename Type>
template<typename Callable>
void BinarySearchTree<Type>::preorderTraversal(Callable& callable)
{
  preorderTraversal(mpRoot, callable);
}
```

```C++
BinarySearchTree<int> tree{VALUES, SIZE};
SumValues<int> sumObj; // Instantiate function object

tree.preorderTraversal(sumObj);

std::cout << "Sum: " << sumObj.sum << '\n';
```

## Self-Balancing Binary Search Trees

- The worst-case performance for searching is $O(n)$.

- ***Self-Balancing Binary Trees*** automatically minimize the tree’s
  height when performing insertion and deletion operations.

- Searching (and therefore insertion and deletion) becomes $O(log_2{n})$
  (i.e., asymptotically optimal) in the worst case (and may average
  $O(1)$ for some operation depending on the implementation).

- ***Disadvantage***: Algorithms are more complicated (especially if
  duplicates are allowed).

Examples:

-   *2-3* — nodes hold 2 or 3 keys; splits and merges balance.
-   *AVL* — strictly height-balanced using rotations when child subtree heights differ by more than 1.
-   *Red Black* — guarantees $O(\log_2{n})$ height with fewer rotations on updates.
-   *AA* — red-black tree with simpler level rules and rotations.
-   *Scapegoat* — rebuilds unbalanced subtrees when size/height invariants are violated.
-   *Splay* — moves accessed nodes to the root via rotations.
-   *Treap* — BST order with random heap priorities.

### Example of Balancing using Rotation

![Example of how an unbalanced tree becomes balanced in two steps of rotations.](/images/bst/balance-by-rotations.svg "Example of how an unbalanced tree becomes balanced in two steps of rotations."){.light-only}

![Example of how an unbalanced tree becomes balanced in two steps of rotations.](/images/bst/balance-by-rotations-dark.svg "Example of how an unbalanced tree becomes balanced in two steps of rotations."){.dark-only}


## Lab 15: Binary Trees (Part 2)

Let’s take a look at the lab based on today’s lecture.
