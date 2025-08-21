C++ Standard Template Library (STL)
===================================

Chapter 21

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/u80XHNjCmD8?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>


## Introduction

### Introduction to the STL

- The standard C++ is equipped with a ***Standard Template Library  
  (STL)***.

- The STL includes class templates to process lists, stacks, and queues.

- In this lecture, you will:

  - Be introduced the Standard Template Library (STL)

  - Become familiar with the three basic components of the STL:
    containers, iterators, and algorithms.

  - Become familiar with basic operations on vector objects

### Components of the STL

The STL consists of three categories of components:

1.  ***Containers*** are class templates to manage objects of a given type.
2.  ***Iterators*** are used to step through the elements of a container.
3.  ***Algorithms*** are used to manipulate data.

![STL Components](/images/stl/stl-componenets.svg "The STL consists of three categories of components"){.light-only}

![STL Components](/images/stl/stl-componenets-dark.svg "The STL consists of three categories of components"){.dark-only}

### Available Containers Types

- ***Sequence Containers*** implement data structures that can be
  accessed sequentially.

- ***Ordered Associative Containers*** implement sorted data structures
  that can be quickly searched ($O(\log n)$ complexity).

- ***Unordered Associative Containers*** implement unsorted (hashed)
  data structures that can be quickly searched ($O(1)$ on average,
  $O(n)$ worst-case complexity).

- ***Adapters*** provide a different interface for sequential
  containers.

- ***Views*** provide flexible lightweight non-owning access to
  contiguous contains.

### Available Sequence Containers Types in C++20

| **Sequence Containers** | **Header File** | **Iterator Support** |
|:---|:---|:---|
| [array](https://en.cppreference.com/w/cpp/container/array) | `<array>` | Random access |
| [vector](https://en.cppreference.com/w/cpp/container/vector) | `<vector>` | Random access |
| [deque](https://en.cppreference.com/w/cpp/container/deque) | `<deque>` | Random access |
| [list](https://en.cppreference.com/w/cpp/container/list) | `<list>` | Bidirectional |
| [forward_list](https://en.cppreference.com/w/cpp/container/forward_list) | `<forward_list>` | Forward |

### Available Associative Containers Types in C++20

| **Associative Containers** | **Header File** | **Iterator Support** |
|:---|:---|:---|
| [map](https://en.cppreference.com/w/cpp/container/map) | `<map>` | Bidirectional |
| [multimap](https://en.cppreference.com/w/cpp/container/multimap) | `<map>` | Bidirectional |
| [set](https://en.cppreference.com/w/cpp/container/set) | `<set>` | Bidirectional |
| [multiset](https://en.cppreference.com/w/cpp/container/multiset) | `<set>` | Bidirectional |
| [unordered_map](https://en.cppreference.com/w/cpp/container/unordered_map) | `<unordered_map>` | Bidirectional |
| [unordered_multimap](https://en.cppreference.com/w/cpp/container/unordered_multimap) | `<unordered_map>` | Bidirectional |
| [unordered_set](https://en.cppreference.com/w/cpp/container/unordered_set) | `<unordered_set>` | Bidirectional |
| [unordered_multiset](https://en.cppreference.com/w/cpp/container/unordered_multiset) | `<unordered_set>` | Bidirectional |

### Available Adpaters and Views Types in C++20

| **Adapters** | **Header File** | **Iterator Support** |
|:---|:---|:---|
| [stack](https://en.cppreference.com/w/cpp/container/stack) | `<stack>` | No iterator support |
| [queue](https://en.cppreference.com/w/cpp/container/queue) | `<queue>` | No iterator support |
| [priority queue](https://en.cppreference.com/w/cpp/container/priority_queue) | `<queue>` | No iterator support |
| **Views** | **Header File** | **Iterator Support** |
| [span](https://en.cppreference.com/w/cpp/container/span) | `<span>` | Bidirectional |

### Sequence Containers in the STL

Sequence container: every object in the container has a specific
position.

Three predefined sequence containers:

1.  `array` – encapsulates a fixed size array

2.  `vector` – a list with elements stored contiguously

3.  `deque` – a double-ended queue

4.  `list` – usually a doubly-linked list

5.  `forward_list` – usually a singly-linked list

## **`vector`**

### Declaring a **`vector`**

- Stores and manages its objects in a dynamic array

- Must use: `#include <vector>`

- To define an object of type vector, specify the type of the object

- Examples:
    ```cpp
    std::vector<int> intList;
    std::vector<std::string> stringList;
    ```

- `vector` contains several constructors.

### Constructors for a **`vector`**

There are 10 different constructors for `vector`; Here are some
highlights.

- `vector();`  
  Default constructor. Constructs an empty container.

- `vector(size_type count, const T& value = T());`  
  Constructs the container with count copies of elements with value
  value.

- `template<typename InputIt>`  
  `vector(InputIt first, InputIt last);`  
  Constructs the container with the contents of the range \[first, last).

- `vector(const vector& other);`  
  Copy constructor.

### Operations on a **`vector`**

- Basic vector operations

  - Item insertion  
    `insert(iterator pos, T& value);` `push_back(const T& value);` etc.

  - Item deletion  
    `erase(iterator pos);` `pop_back();` etc.

  - Stepping through the elements  
    
    ```cpp
    at(int index) // Random access value.
    operator[](int index); // Random access reference
    front(); // the first element
    back();  // the last element
    ```

- Vector elements can be processed just as they can in an array.

### Example Operations on a **`vector`**

![Vector Initialization](/images/stl/vector_init.svg "`std::vector<int> vec{12, 7, 9, 21, 13};`"){.light-only}

![Vector Initialization](/images/stl/vector_init-dark.svg "`std::vector<int> vec{12, 7, 9, 21, 13};`"){.dark-only}


![Pop the Back of a Vector](/images/stl/vector_pop_back.svg "`vec.pop_back();`"){.light-only}

![Pop the Back of a Vector](/images/stl/vector_pop_back-dark.svg "`vec.pop_back();`"){.dark-only}

![Push the Back of a Vector](/images/stl/vector_push_back.svg "`vec.push_back(15);`"){.light-only}

![Push the Back of a Vector](/images/stl/vector_push_back-dark.svg "`vec.push_back(15);`"){.dark-only}


![Access the first and forth element of a vector](/images/stl/vector_begin.svg "Access the first and forth element of a vector."){.light-only}

![Access the first and forth element of a vector](/images/stl/vector_begin-dark.svg "Access the first and forth element of a vector.`"){.dark-only}

### Capacity/Size of a **`vector`**

| Method | Description |
|:---|:---|
| `empty()` | returns `true` if the container is empty and `false` otherwise |
| `size()` | returns the number of elements |
| `max_size()` | returns the maximum possible number of elements |
| `reserve()` | reserves storage |
| `capacity()` | returns the number of elements that can be held in currently allocated storage |
| `shrink_to_fit()` | reduces memory usage by freeing unused memory |

### Example use of the **`vector`** Container

```cpp
#include <vector>
#include <iostream>

int main() {
    std::vector<int> v(3);    // a vector of size 3
    v[0] = 23;
    v[1] = 12;
    v[2] = 9;                 // vector full
    v.push_back(17);          // append a new value
    for (auto el : v)         // range-based for loop.
    std::cout << el << ' '; // access to i-th el
    std::cout << std::endl;
    v[2] = v[3];              // random access
}
```

### Example use of the **`vector`** Container

```cpp
#include <vector>
#include <iostream>

int main() {
    std::vector<int> v{ 12, 3, 17, 8 }; // initialize
    while (!v.empty())                  // until empty
    {
        std::cout << v.back() << ' '; // output last el
        v.pop_back();                 // delete last el
    }
    std::cout << std::endl;
}
```

## Other Sequence Containers

### The **`deque`** (Double-Ended Queue) Container

[`std::deque`](https://en.cppreference.com/w/cpp/container/deque) is
another indexed sequence container, which is  
accessed using `#include <deque>`

- Allows fast insertion and deletion at both end ends. Slower insertion
  in the middle.

- Insertion and deletion at either end of a deque never invalidates
  pointers or references to the rest of the elements.

- The elements of a deque are not stored contiguously, but random access
  is $O(1)$.

### The **`list`** Container

[`std::list`](https://en.cppreference.com/w/cpp/container/list) is
another indexed sequence container, which is accessed using  
`#include <list>`

- Allows constant-time insertion and deletion from anywhere in the
  container, which never invalidates pointers or references to the rest
  of the elements.

- Fast random access is not supported.

- Usually implemented as a doubly-linked list.

- Less space efficient.

## Iterators

### Iterators for Container

- Iterators are pointer-like entities that are used to access individual
  elements in a container.

- Often they are used to move sequentially from element to element, a
  process called *iterating* through a container.


![Iterators to a `vector` Container](/images/stl/vector_iterator.svg "Iterators to a `vector` Container"){.light-only}

![Iterators to a `vector` Container](/images/stl/vector_iterator-dark.svg "Iterators to a `vector` Container"){.dark-only}


```cpp
std::vector<int> vec { 17, 5, 23, 12, 9, 11, 13, 9 };

// Declares an iterator into a int vector container
std::vector<int>::iterator intVecIter = vec.begin();

// Advance the iterator to the second element.
++intVecIter;

// Access the second element and change its value.
*intVecIter = -3;

// Second iterator positioned on the last element.
std::vector<int>::iterator intVecIter2 = vec.end();
--intVecIter2;
```

### Containers have **`begin`** and **`end`** Iterator Functions

- `begin()`: returns an iterator to the beginning of the container.

- `end()`: returns an iterator to just past the last value.  
  
  ![begin and end iterators](/images/stl/iterator_end.svg "Begin and end iterators."){.light-only}

  ![begin and end iterators](/images/stl/iterator_end-dark.svg "Begin and end iterators."){.dark-only}

```cpp
std::vector<int> vec { 17, 4, 23, 12, 9, 7, 11, 13 };

std::vector<int>::iterator intVecIter1 = vec.begin();
std::vector<int>::iterator intVecIter2 = vec.end();
--intVecIter2; // move to last element
```

### Iterator Example

```cpp
template <typename Type>
Type maxValue(const vector<Type> &vec)
{
  vector<int>::const_iterator iter = vec.cbegin();
  Type max = *iter;
  for (++iter; iter != vec.cend(); ++iter)
  {
    if (*iter > max)
      max = *iter;
  }
  return max;
}

std::vector<std::string> words { "The", "fun", "has", "just", "begun" };
cout << "max of words = " << maxValue(words);
```

### Types of Iterators

Every algorithm requires an iterator with a certain level of capability.
For example, to use the `[]` operator you need a random access iterator.

1.  ***Input iterators*** have read access; step forward
    element-by-element.

2.  ***Output iterators*** have write access; step forward
    element-by-element.

3.  ***Forward iterators*** have the functionality of input and most of
    the functionality of output iterators.

4.  ***Bidirectional iterators*** are forward iterators that can also go
    backward.

5.  ***Random access iterators*** are bidirectional iterators that can
    randomly process the elements of a container.

6.  As of C++20, there are additional iterators based on
    [concepts](https://en.cppreference.com/w/cpp/language/constraints),
    which differ from C++17.

<https://en.cppreference.com/w/cpp/iterator>

### Iterator Operations


| Type          |     Access     |   Read   |  Write   |  Iterate   |
|:--------------|:--------------:|:--------:|:--------:|:----------:|
| Input         |                | `x = *i` |          |    `++`    |
| Output        |                | `x = *i` | `*i = x` |    `++`    |
| Forward       |                | `x = *i` | `*i = x` |    `++`    |
| Bidirectional |                | `x = *i` | `*i = x` | `++`, `--` |
| Random Access |     `[ ]`      | `x = *i` | `*i = x` | `++`, `--` |

### Helper Iterator Operators

The `<iterator>` library includes many overloaded operators and
functions to use with iterators. Some include:

- [advance](https://en.cppreference.com/w/cpp/iterator/advance) –
  advances an iterator by a given distance

- [next](https://en.cppreference.com/w/cpp/iterator/next) – increment an
  iterator

- [prev](https://en.cppreference.com/w/cpp/iterator/prev) – decrement an
  iterator

### Benefits of Iterators

- ***Convenience in Programming***:

  - Provide common usage for any container (the internal structure of a
    container does not matter).

  - Provide read and/or write access to each element’s values.

- ***Reusable Code***:  
  Iterator algorithms are not dependent on the container type.

- ***Dynamic Processing***:  
  Easily dynamically allocate as well as delete the memory.

## Associative Containers

### Ordered Associative Containers

Store elements in sorted order according to some ordering criteria  
(often using a type of binary tree).  

| Associative Containers | Header File | Iterator Support |
|:---|:---|:---|
| [map](https://en.cppreference.com/w/cpp/container/map) | `<map>` | Bidirectional |
| [multimap](https://en.cppreference.com/w/cpp/container/multima) | `<map>` | Bidirectional |
| [set](https://en.cppreference.com/w/cpp/container/set) | `<set>` | Bidirectional |
| [multiset](https://en.cppreference.com/w/cpp/container/multiset) | `<set>` | Bidirectional |

- `set` stores a set of ***unique*** elements, while `map` stores
  key-value pairs with ***unique*** keys.

- `multiset` and `multimap` allow duplicates.

### Sets Example

```cpp
#include <set>
int main()
{
  std::set<std::string, std::less<std::string> > nameSet{ "Ole",
       "Hedvig", "Juan", "Lars", "Guido", "Ann"};

  nameSet.insert("Patric"); // insert another name
  nameSet.erase("Juan"); // removes an element

  // Find the matching name in set.
  std::string searchName;
  std::cin >> searchName;
  std::set<std::string, std::less<string> >::iterator iter =
    nameSet.find(searchName);

  cout << searchName << " is";

  if (iter == nameSet.end()) // check if found
     std::cout << " NOT";

  std::cout << " in the set!\n";
}
```

### Sets Example

```cpp
#include <set>

int main()
{
  std::set<std::string, std::less<std::string> > nameSet {
    "Ole", "Hedvig", "Juan", "Lars", "Guido", "Patric",
    "Maria", "Ann" };

  // Set iterator to lower start value "K"
  std::set<std::string, std::less<std::string> >::iterator
    iter = nameSet.lower_bound("K");

  // Display: Lars, Maria, Ole, Patric
  while (iter != nameSet.upper_bound("Q"))
    cout << *iter++ << ", ";

  std::cout << std::endl;
}
```

### Maps Example

```cpp
#include <map>
#include <algorithm>
int main()
{
  std::map<std::string, int> contacts {
    {"Ole", 75643}, {"Hedvig", 83268}, {"Juan", 97353},
    {"Lars", 87353}, {"Guido", 19988}, {"Patric", 76455},
    {"Maria", 77443}, {"Ann", 12221}};

  std::cout << "Lars phone number is " << contacts["Lars"]
    << '\n';

  for(auto iter = contacts.begin(); iter != contacts.end(); iter++)
    std::cout << iter->first << " : " << iter->second << '\n';
}
```

## Adapters

### Container Adapters

Containers to accommodate special situations.  

| **Adapters** | **Header File** | **Iterator Support** |
|:---|:---|:---|
| [stack](https://en.cppreference.com/w/cpp/container/stack) | `<stack>` | No iterator support |
| [queue](https://en.cppreference.com/w/cpp/container/queue) | `<queue>` | No iterator support |
| [priority queue](https://en.cppreference.com/w/cpp/container/priority_queue) | `<queue>` | No iterator support |

- Do not support any type of iterator.

## The **`std::span`** Container View

![Two spans pointing to different ranges of elements in an array.](/images/stl/spans.svg "Two spans pointing to different ranges of elements in an array."){.light-only}

![Two spans pointing to different ranges of elements in an array.](/images/stl/spans-dark.svg "Two spans pointing to different ranges of elements in an array."){.dark-only}

## Algorithms in the STL

Many algorithms that work on any STL container are found in the
`<algorithm>` library.

- Copy
- Partition
- Sort
- Search
- …

These algorithms are provided generically to support many container
types.

### STL Algorithm Classifications

- ***Non-modifying algorithms*** do not modify the elements of the
  container

- ***Modifying algorithms*** modify the elements of the container

- ***Numeric algorithms*** perform numeric calculations on elements of a
  container.

- ***Heap algorithms*** are Heapsort algorithm that sorts contiguous
  data.

### Non-Modifying Sequence Algorithms

| Method | Description |
|---:|:---|
| [`all_of, any_of, none_of`](https://en.cppreference.com/w/cpp/algorithm/all_any_none_of) | checks if a predicate is true for all, any or none of the elements in a range |
| [`for_each`](https://en.cppreference.com/w/cpp/algorithm/for_each) | applies a function to a range of elements |
| [`for_each_n`](https://en.cppreference.com/w/cpp/algorithm/for_each_n) | applies a function object to the first n elements of a sequence |
| [`count, count_if`](https://en.cppreference.com/w/cpp/algorithm/count) | returns the number of elements satisfying specific criteria |
| [`mismatch`](https://en.cppreference.com/w/cpp/algorithm/mismatch) | finds the first position where two ranges differ |
| [`find, find_if, find_if_not`](https://en.cppreference.com/w/cpp/algorithm/find) | finds the first element satisfying specific criteria |
| [`find_end`](https://en.cppreference.com/w/cpp/algorithm/find_end) | finds the last sequence of elements in a certain range |
| [`find_first_of`](https://en.cppreference.com/w/cpp/algorithm/find_first_of) | searches for any one of a set of elements |
| [`adjacent_find`](https://en.cppreference.com/w/cpp/algorithm/adjacent_find) | finds the first two adjacent items that are equal (or satisfy a given predicate) |
| [`search`](https://en.cppreference.com/w/cpp/algorithm/search) | searches for a range of elements |
| [`search_n`](https://en.cppreference.com/w/cpp/algorithm/search_n) | searches a range for a number of consecutive copies of an element |

### Example: The `for_each()` Algorithm

```cpp
#include <vector>
#include <algorithm>
#include <iostream>
void show(int n) {
    std::cout << n << ", ";
}

int main() {
    // initialize vector with a list of values
    std::vector<int> v{ 12, 3, 17, 8 };

    // apply function show to each element of vector v
    std::for_each (v.begin(), v.end(), show);
}
```

### Example: The `find()` Algorithm

```cpp
#include <vector>
#include <algorithm>
#include <iostream>
int main() {
  std::vector<int> v{ 12, 3, 17, 8, 34, 56, 9 };
  std::vector<int>::iterator iter;
  int key;

  std::cout << "Enter value: ";
  std::cin >> key;
  iter = std::find(v.begin(), v.end(), key);
  std::cout << "Element " << key << " is ";
  if (iter == v.end()) // value was NOT found
     std::cout << "not";
  std::cout << " in vector v.\n";
}
```

### Example: The `find_if()` Algorithm

```cpp
#include <vector>
#include <algorithm>
#include <iostream>
bool inRange(int n) { return (n > 21) && (n < 36); };

int main() {
  std::vector<int> v{ 12, 3, 17, 8, 34, 56, 9 };
  std::vector<int>::iterator iter;
  iter = std::find_if(v.begin(), v.end(), inRange);

  // finds an element in v for which inRange is true
  if (iter != v.end()) // found the element
    std::cout << "found " << *iter << '\n';
  else
    std::cout << "not found\n";
}
```

### Example: The `count_if()` Algorithm

```cpp
#include <vector>
#include <algorithm>
#include <iostream>
bool inRange(int n) { return (n > 14) && (n < 36); };

int main() {
  std::vector<int> v{ 12, 3, 17, 8, 34, 56, 9 };
  std::vector<int>::iterator iter;

  // counts element in v for which inRange is true
  const int N = std::count_if(v.begin(),v.end(), inRange);
  std::cout << "found " << N << " values between 14 and 36.\n";
}
```

### Minimum/Maximum Algorithms

| Method | Description |
|---:|:---|
| [`max`](https://en.cppreference.com/w/cpp/algorithm/max) | returns the greater of the given values |
| [`max_element`](https://en.cppreference.com/w/cpp/algorithm/max_element) | returns the largest element in a range |
| [`min`](https://en.cppreference.com/w/cpp/algorithm/min) | returns the smaller of the given values |
| [`min_element`](https://en.cppreference.com/w/cpp/algorithm/min_element) | returns the smallest element in a range |
| [`minmax`](https://en.cppreference.com/w/cpp/algorithm/minmax) | returns the smaller and larger of two elements |
| [`minmax_element`](https://en.cppreference.com/w/cpp/algorithm/minmax_element) | returns the smallest and the largest elements in a range |
| [`clamp`](https://en.cppreference.com/w/cpp/algorithm/clamp) | clamps a value between a pair of boundary values |

### Set Algorithms (on Sorted Ranges)

| Method | Description |
|---:|:---|
| [`includes`](https://en.cppreference.com/w/cpp/algorithm/includes) | returns true if one sequence is a subsequence of another |
| [`set_difference`](https://en.cppreference.com/w/cpp/algorithm/set_difference) | computes the difference between two sets |
| [`set_intersection`](https://en.cppreference.com/w/cpp/algorithm/set_intersection) | computes the intersection of two sets |
| [`set_symmetric_difference`](https://en.cppreference.com/w/cpp/algorithm/set_symmetric_difference) | computes the symmetric difference between two sets |
| [`set_union`](https://en.cppreference.com/w/cpp/algorithm/set_union) | computes the union of two sets |

### Modifying Sequence Algorithms

| Method | Description |
|---:|:---|
| [`copy, copy_if`](https://en.cppreference.com/w/cpp/algorithm/copy) | copies a range of elements to a new location |
| [`copy_n`](https://en.cppreference.com/w/cpp/algorithm/copy_n) | copies a number of elements to a new location |
| [`copy_backward`](https://en.cppreference.com/w/cpp/algorithm/copy_backward) | copies a range of elements in backward order |
| [`move`](https://en.cppreference.com/w/cpp/algorithm/move) | moves a range of elements to a new location |
| [`move_backward`](https://en.cppreference.com/w/cpp/algorithm/move_backward) | moves a range of elements to a new location in backward order |
| [`fill`](https://en.cppreference.com/w/cpp/algorithm/fill) | copy-assigns the given value to every element in a range |
| [`fill_n`](https://en.cppreference.com/w/cpp/algorithm/fill_n) | copy-assigns the given value to N elements in a range |
| [`transform`](https://en.cppreference.com/w/cpp/algorithm/transform) | applies a function to a range of elements, storing results in a destination range |
| [`generate`](https://en.cppreference.com/w/cpp/algorithm/generate) | assigns the results of successive function calls to every element in a range |
| [`generate_n`](https://en.cppreference.com/w/cpp/algorithm/generate_n) | assigns the results of successive function calls to N elements in a range |
| [`remove, remove_if`](https://en.cppreference.com/w/cpp/algorithm/remove) | removes elements satisfying specific criteria |

### Example: The `copy()` Algorithm

The copy algorithm overwrites the existing contents when using regular
iterators.

```cpp
#include <list>
#include <algorithm>

int main() {
  std::list<int> odds{ 1, 3, 5, 7, 9 };
  std::list<int> result{ 2, 4, 6, 8, 10 };

  // copy contents of odds to result overwriting the elements in result
  std::copy(odds.begin(), odds.end(), result.begin());
  // result = { 1, 3, 5, 7, 9 }
}
```

### Example: The `copy()` Algorithm

With insert operators, you can modify the behavior of the copy
algorithm.  

| Method | Description |
|:---|:---|
| [`back_inserter`](https://en.cppreference.com/w/cpp/iterator/back_inserter) | inserts new elements at the end |
| [`front_inserter`](https://en.cppreference.com/w/cpp/iterator/front_inserter) | inserts new elements at the beginning |
| [`inserter`](https://en.cppreference.com/w/cpp/iterator/inserter) | inserts new elements at a specified location |

  

```cpp
std::list<int> l1{ 1, 3, 5, 7, 9 }, l2{ 2, 4, 6, 8, 10 };
```

```cpp
std::copy(l1.begin(), l1.end(), std::back_inserter(l2));
// l2 = { 2, 4, 6, 8, 10, 1, 3, 5, 7, 9  }
```

```cpp
std::copy(l1.begin(), l1.end(), std::front_inserter(l2));
// l2 = { 9, 7, 5, 3, 1, 2, 4, 6, 8, 10 }
```

```cpp
std::copy(l1.begin(), l1.end(), std::inserter(l2, l2.begin()));
// l2 = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 }
```

### Example: The `copy()` Algorithm with Output Iterator

```cpp
#include <iostream>
#include <iterator>
#include <vector>
#include <algorithm>

int main() {
  std::vector<int> vector {10, 20, 30, 40, 50, 60 70};
  std::ostream_iterator<int> outIter{std::cout, ", "};

  std::copy(vector.begin(), vector.end(), outIter);
}
```

### Modifying Sequence Algorithms

| Method | Description |
|---:|:---|
| [`remove_copy, remove_copy_if`](https://en.cppreference.com/w/cpp/algorithm/remove_copy) | copies a range of elements omitting those that satisfy specific criteria |
| [`replace, replace_if`](https://en.cppreference.com/w/cpp/algorithm/replace) | replaces all values satisfying specific criteria with another value |
| [`replace_copy, replace_copy_if`](https://en.cppreference.com/w/cpp/algorithm/replace_copy) | copies a range, replacing elements satisfying specific criteria with another value |
| [`swap`](https://en.cppreference.com/w/cpp/algorithm/swap) | swaps the values of two objects |
| [`swap_ranges`](https://en.cppreference.com/w/cpp/algorithm/swap_ranges) | swaps two ranges of elements |
| [`iter_swap`](https://en.cppreference.com/w/cpp/algorithm/iter_swap) | swaps the elements pointed to by two iterators |
| [`reverse`](https://en.cppreference.com/w/cpp/algorithm/reverse) | reverses the order of elements in a range |
| [`reverse_copy`](https://en.cppreference.com/w/cpp/algorithm/reverse_copy) | creates a copy of a range that is reversed |
| [`rotate`](https://en.cppreference.com/w/cpp/algorithm/rotate) | rotates the order of elements in a range |
| [`rotate_copy`](https://en.cppreference.com/w/cpp/algorithm/rotate_copy) | copies and rotate a range of elements |

### Example: The `sort()` and `merge()` Algorithms

```cpp
#include <list>
#include <algorithm>
int main() {
  std::list<int>  l1 { 6, 4, 9, 1, 7 }
  std::list<int>  l2 { 4, 2, 1, 3, 8 };
  l1.sort(); // l1 = {1, 4, 6, 7, 9}
  l2.sort(); // l2 = {1, 2, 3, 4, 8 }
  l1.merge(l2);  // merges l2 into l1
  // l1 = { 1, 1, 2, 3, 4, 4, 6, 7, 8, 9},  l2 = {}
}
```

Numeric Algorithms in
[`<numeric>`](https://en.cppreference.com/w/cpp/header/numeric)

| Method | Description |
|---:|:---|
| [`iota`](https://en.cppreference.com/w/cpp/algorithm/iota) | fills a range with successive increments of the starting value |
| [`accumulate`](https://en.cppreference.com/w/cpp/algorithm/accumulate) | sums up a range of elements |
| [`inner_product`](https://en.cppreference.com/w/cpp/algorithm/inner_product) | computes the inner product of two ranges of elements |
| [`adjacent_difference`](https://en.cppreference.com/w/cpp/algorithm/adjacent_difference) | computes the differences between adjacent elements in a range |
| [`partial_sum`](https://en.cppreference.com/w/cpp/algorithm/partial_sum) | computes the partial sum of a range of elements |
| [`reduce`](https://en.cppreference.com/w/cpp/algorithm/reduce) | similar to std::accumulate, except out of order |
| [`exclusive_scan`](https://en.cppreference.com/w/cpp/algorithm/exclusive_scan) | excludes the ith input element from the ith sum |
| [`inclusive_scan`](https://en.cppreference.com/w/cpp/algorithm/inclusive_scan) | includes the ith input element in the ith sum |
| [`transform_reduce`](https://en.cppreference.com/w/cpp/algorithm/transform_reduce) | applies an invocable, then reduces out of order |
| [`transform_exclusive_scan`](https://en.cppreference.com/w/cpp/algorithm/transform_exclusive_scan) | applies an invocable, then calculates exclusive scan |
| [`transform_inclusive_scan`](https://en.cppreference.com/w/cpp/algorithm/transform_inclusive_scan) | applies an invocable, then calculates inclusive scan |

### Heap Algorithms

Built-in heapsort.  
(You may not implement the Heap in your lab using these functions,  
but you may use them for testing.)

| Method | Description |
|---:|:---|
| [`is_heap`](https://en.cppreference.com/w/cpp/algorithm/is_heap) | checks if the given range is a max heap |
| [`is_heap_until`](https://en.cppreference.com/w/cpp/algorithm/is_heap_until) | finds the largest subrange that is a max heap |
| [`make_heap`](https://en.cppreference.com/w/cpp/algorithm/make_heap) | creates a max heap out of a range of elements |
| [`push_heap`](https://en.cppreference.com/w/cpp/algorithm/push_heap) | adds an element to a max heap |
| [`pop_heap`](https://en.cppreference.com/w/cpp/algorithm/pop_heap) | removes the largest element from a max heap |
| [`sort_heap`](https://en.cppreference.com/w/cpp/algorithm/sort_heap) | turns a max heap into a range of elements sorted in ascending order |

## Function Objects

### Function Objects

- Some algorithms like sort, merge, and accumulate can take a function
  object as an argument.

- A function object is an object of a template class that has a single
  member function: the overloaded `operator()`.

- It is also possible to use user-written functions in place of
  predefined function objects.

```cpp
#include <list>
#include <functional>
int main() {
  std::list<int> lst { 6, 4, 9, 1, 7 };
  lst.sort(std::greater<int>{}); // uses function object
  // for sorting in reverse order lst = { 9, 7, 6, 4, 1 }
}
```

In C++, Function Objects are often called ***functors***, but that term
has alternate means.

### Function Objects

The accumulate algorithm accumulates values over a range (e.g., the
sum).

```cpp
#include <list>
#include <functional>
#include <numeric>
int main() {
  std::list<int> lst { 6, 4, 9, 1, 7 };
  int sum, fac;
  sum = std::accumulate(lst.begin(), lst.end(), 0,
    std::plus<int>{});
  sum = std::accumulate(lst.begin(), lst.end(), 0);
    // plus by default

  fac = std::accumulate(lst.begin(), lst.end(), 1,
    std::times<int>{});
}
```

### User Defined Function Objects

```cpp
template <typename Type>
struct SquaredSum  // user-defined function object
{
    Type operator()(Type n1, Type n2) { return n1 + n2 * n2; }
};
```

```cpp
#include <complex>
#include <numeric>
#include <vector>
```

```cpp
std::vector<std::complex<int>> vc{ {2, 3}, {1, 5}, {-2, 4} };

// computes the sum of squares of a vector of complex numbers
std::complex sum_vc = std::accumulate(vc.begin(), vc.end(),
          std::complex(0, 0), SquaredSum<std::complex<int>>{});
```

### User Defined Function Objects

Unlike functions, function objects permit custom parameterization and
statefullness.

```cpp
std::vector<double> vals1 {2, 3, 1, 5, -2, 4};
std::vector<double> vals2 {9, 8, -6, -10, -1, 8, 6};

// Square each value in both vectors and calculate the total.
CalculateAverageOfPowers squared{2}; // Function Object
squared = std::for_each(vals1.begin(), vals1.end(), squared);
squared = std::for_each(vals2.begin(), vals2.end(), squared);

std::cout << ' ' << squared.getAverage() << '\n';
```

### User Defined Function Objects

```cpp
class CalculateAverageOfPowers
{
public:
  CalculateAverageOfPowers(double power) 
    : total{0}, count{0}, exponent{power} {}

  void operator() (double x) {
    total += pow(x, exponent);
    ++count;
  }

  auto getAverage() const { return total / count; }

private:
  double total;
  int count;
  double exponent;
};
```

## Lab 17: The STL and Sorting

Let’s take a look at Lab 17.
