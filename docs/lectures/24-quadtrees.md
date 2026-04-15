Quadtrees (with Smart Pointers)
===============================

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/wDc3Qy7Tnpc?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import insertion_diagram from '/images/quadtrees/insertion_example.svg'
</script>

## Motivation

Suppose we have a set of 2D points and we want to
be able to query how many points lie in a particular rectangle.

A brute force approach would be $O(n)$ in the number of points.

We want a way to more efficiently count points contained within 
a rectangular region.

## Explanation

Each node in a *Quadtree* has a bounding rectangle.
If the node is not a leaf then it has 4 children,
splitting the rectangle into four quadrants.

Points are also attached to nodes.
We define a constant specifying the maximum number of points
associated with each node.

## Insertion

<ProgressiveDiagram :src="insertion_diagram" />
<br />

![3D representation of the points inserted into the quadtree](/images/quadtrees/inserted_points_3d.svg "3D representation of the points inserted into the quadtree"){.light-only}

![3D representation of the points inserted into the quadtree](/images/quadtrees/inserted_points_3d-dark.svg "3D representation of the points inserted into the quadtree"){.dark-only}

## Query

- Use recursion to count the number of points in a  
  given range.

- Consider only nodes that overlap with the query range.

## Time Complexity

If the points are distributed uniformly in the root’s  
range, then insertions and queries are ***logarithmic***.

However, if they are not uniformly distributed  
then it can degrade to ***linear time***.

## Quadrant Contains a Point

$(c_x - \frac{1}{2}w) \le p_x < (c_x + \frac{1}{2}w)$

$(c_y - \frac{1}{2}h) \le p_y < (c_y + \frac{1}{2}h)$

## Region Intersects a Quad

$$\begin{aligned}
      \text{left} &< c_x + \frac{1}{2}w\\[5pt]
      \text{right} &> c_x - \frac{1}{2}w\\[5pt]
      \text{top} &> c_y - \frac{1}{2}h\\[5pt]
      \text{bottom} &< c_y + \frac{1}{2}h\  
    
\end{aligned}$$


## Modern C++ Memory Management

In modern C++, ***smart pointers*** are preferred for dynamic memory
management, instead of raw `new` and `delete`.

-   `std::unique_ptr` is a smart pointer that owns and manages a
    dynamically allocated object.

-   It automatically deletes the object when it goes out of scope,
    preventing memory leaks.

-   Ownership is exclusive: cannot be copied, only moved.

::: info `std::unique_ptr` Example

```cpp
#include <memory>
void example() {
  std::unique_ptr<int> p = std::make_unique<int>();
  *p = 42;
  // When example() returns, p is destroyed,
  // and the int is automatically deleted.
}
```


-   The object is freed automatically when the smart pointer goes out of
    scope.

-   No explicit `delete` is required.

:::

### Example Implementation

This is how you might implement `std::unique_ptr` if you needed to. Seeing
an example implementation shows how simple it is (just a wrapper for a pointer).

```cpp
// Incomplete Example (doesn't handle move semantics)
template<typename Type>
class UniquePointer {
public:
  UniquePointer(Type* datum = nullptr) : mDatum{datum}
  {}

  ~UniquePointer() { delete mDatum; }

  // Remove default copy semantics.
  UniquePointer(const UniquePointer &)            = delete;
  UniquePointer& operator=(const UniquePointer &) = delete;

  // Accessors for owned object
  Type* operator->() const {return mDatum;}
  Type& operator*()  const {return *mDatum;}
private:
  Type* mDatum;
};
```

`std::make_unique` vs `new` Preferred form:

    auto p = std::make_unique<Quadtree>();

-   Works well with *type deduction* (`auto`) and is exception-safe.

-   Allocation and ownership transfer happen in one step.

Allowed, but less preferred:  
`std::unique_ptr<Quadtree> p{new Quadtree()};`

-   More verbose and unsafe if an exception is thrown between `new` and
    the constructor of `std::unique_ptr`.

### Advantages and Disadvantages **Advantages:**

-   Automatic resource management.  
    [*Resource Acquisition is Initialization*
    (RAII)](https://en.cppreference.com/w/cpp/language/raii.html).

-   Prevents memory leaks and dangling pointers.

-   Exception-safe.

-   Cleaner, more readable code.

**Disadvantages:**

-   Ownership semantics restrict copying.

-   Slight performance overhead.

-   Learning curve for ownership rules.

### Other Smart Pointers

-   `std::shared_ptr` — shared ownership

-   `std::weak_ptr` — non-owning reference to object managed by
    `std::shared_ptr`

### Rule of 0

-   **Rule of 3**: If you define any of destructor, copy constructor, or
    copy assignment operator, define all three.

-   **Rule of 0**: If you don't need to define any special member
    functions, don't define any.

-   Rely on compiler-generated defaults or use smart pointers for
    resource management.

### Quadtree Subtree Implementation The 4 subtrees are defined using:

```
// Replaces:
// Quadtree* mQuads = new Quadtree[4];
std::array<std::unique_ptr<Quadtree>, 4> mQuads;
```

-   `std::array` provides a fixed-size array with compile-time size.

-   Each subtree is a `std::unique_ptr` to a `Quadtree` node.

-   Memory is automatically managed; no manual `delete` needed.


## Types of Quadtrees

- ***Region*** quadtree – Divides region into sub-quadrants based on the
  areas with more detailed information.

  - Image processing – only subdivide if pixels differ in color.

  - Variable resolution data field – each parent has the average value
    of its children.

- ***Point*** quadtree – Divide the region at the point that is inserted
  (like a binary tree but with 4 pointers). [$k$-d
  trees](https://en.wikipedia.org/wiki/K-d_tree) are preferred.

- ***Point-region (PR)*** quadtree – What we implemented.

- ***Edge*** quadtree – Stores lines/curves with approximation.

- ***Polygonal map (PM)*** quadtree – stores polygons.

- ***Compressed*** quadtrees – only storing subtrees whose leaves have
  interesting data and removing empty intermediate nodes.

## Conclusion

- Quadtrees are used to efficiently query the number of points contained
  within various rectangular ranges.

- Quadtrees are most efficient when the points are uniformly
  distributed.

## Lab 24: Quadtrees

Let’s take a look at the lab based on today’s lecture.
