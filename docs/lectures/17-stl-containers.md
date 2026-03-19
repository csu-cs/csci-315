Containers and Iterators of the C++ Standard Template Library (STL)
===================================================================

Chapter 21

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/XZ6VuC_ADhE?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
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

### Container Adapters and Views

Container adapters and views support different features of existing containers, rather than being containers themselves.

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

### Available Adapters in C++20/23

| **Adapters** | **Header File** | **Iterator Support** |
|:---|:---|:---|
| [stack](https://en.cppreference.com/w/cpp/container/stack) | `<stack>` | No iterator support |
| [queue](https://en.cppreference.com/w/cpp/container/queue) | `<queue>` | No iterator support |
| [priority queue](https://en.cppreference.com/w/cpp/container/priority_queue) | `<queue>` | No iterator support |

### Views Types in C++20

| **Views** | **Header File** | **Iterator Support** |
|:---|:---|:---|
| [span](https://en.cppreference.com/w/cpp/container/span) | `<span>` | Bidirectional |
| [mdspan](https://en.cppreference.com/w/cpp/container/mdspan.html) | `<mdspan>` | none |


## Sequence Containers in the STL

Sequence container: every object in the container has a specific
position.

1.  `array` – encapsulates a fixed size array

2.  `vector` – a list with elements stored contiguously

3.  `deque` – a double-ended queue

4.  `list` – usually a doubly-linked list

5.  `forward_list` – usually a singly-linked list

### **`vector`**

#### Declaring a **`vector`**

- Stores and manages its objects in a dynamic array

- Must use: `#include <vector>`

- To define an object of type vector, specify the type of the object

- Examples:
    ```cpp
    std::vector<int> intList;
    std::vector<std::string> stringList;
    ```

- `vector` contains several constructors.

#### Constructors for a **`vector`**

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

#### Operations on a **`vector`**

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

#### Example Operations on a **`vector`**

![Vector Initialization](/images/stl/vector_init.svg "`std::vector<int> vec{12, 7, 9, 21, 13};`"){.light-only}

![Vector Initialization](/images/stl/vector_init-dark.svg "`std::vector<int> vec{12, 7, 9, 21, 13};`"){.dark-only}


![Pop the Back of a Vector](/images/stl/vector_pop_back.svg "`vec.pop_back();`"){.light-only}

![Pop the Back of a Vector](/images/stl/vector_pop_back-dark.svg "`vec.pop_back();`"){.dark-only}

![Push the Back of a Vector](/images/stl/vector_push_back.svg "`vec.push_back(15);`"){.light-only}

![Push the Back of a Vector](/images/stl/vector_push_back-dark.svg "`vec.push_back(15);`"){.dark-only}


![Access the first and forth element of a vector](/images/stl/vector_begin.svg "Access the first and forth element of a vector."){.light-only}

![Access the first and forth element of a vector](/images/stl/vector_begin-dark.svg "Access the first and forth element of a vector.`"){.dark-only}

#### Capacity/Size of a **`vector`**

| Method | Description |
|:---|:---|
| `empty()` | returns `true` if the container is empty and `false` otherwise |
| `size()` | returns the number of elements |
| `max_size()` | returns the maximum possible number of elements |
| `reserve()` | reserves storage |
| `capacity()` | returns the number of elements that can be held in currently allocated storage |
| `shrink_to_fit()` | reduces memory usage by freeing unused memory |

#### Example use of the **`vector`** Container

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

#### Example use of the **`vector`** Container

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

Adapt a sequential container to accommodate special situations.  

| **Adapters** | **Header File** | **Iterator Support** |
|:---|:---|:---|
| [stack](https://en.cppreference.com/w/cpp/container/stack) | `<stack>` | No iterator support |
| [queue](https://en.cppreference.com/w/cpp/container/queue) | `<queue>` | No iterator support |
| [priority queue](https://en.cppreference.com/w/cpp/container/priority_queue) | `<queue>` | No iterator support |

- Do not support any type of iterator.

## The **`std::span`** Container View

![Two spans pointing to different ranges of elements in an array.](/images/stl/spans.svg "Two spans pointing to different ranges of elements in an array."){.light-only}

![Two spans pointing to different ranges of elements in an array.](/images/stl/spans-dark.svg "Two spans pointing to different ranges of elements in an array."){.dark-only}
