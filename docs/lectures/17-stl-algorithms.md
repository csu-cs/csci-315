Algorithms of the C++ Standard Template Library (STL)
=====================================================

Chapter 21

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/5ECuqkI98Ps?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

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

- A function object is an instance of a class that overloads `operator()`.

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

In C++, a slang term for *Function Objects* is ***functors***, but that term
has alternate meanings.

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
    // addition by default

  fac = std::accumulate(lst.begin(), lst.end(), 1,
    std::times<int>{});
}
```

### User Defined Function Objects

```cpp
template <typename Type>
struct SquaredSum  // user-defined function object
{
  Type operator()(Type n1, Type n2)
  {
    return n1 + n2 * n2;
  }
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

  void operator() (double x)
  {
    total += pow(x, exponent);
    ++count;
  }

  auto getAverage() const
  {
    return total / count;
  }

private:
  double total;
  int count;
  double exponent;
};
```

## Lab 17: The STL and Sorting

Let’s take a look at Lab 17.
