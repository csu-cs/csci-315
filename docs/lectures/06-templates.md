Polymorphism via C++ Templates
==============================

Chapter 13


Learning Outcomes
-----------------

After completing this lecture and the related lab, students will be able to:

1. Define and use function and class templates, employing template `<typename T>` to create generic and reusable code.

2. Organize template code properly so that template definitions are visible at the point of instantiation, recognizing common compilation and header/implementation practices.

3. Apply templates to data structures, such as generic array-based lists, demonstrating reuse through inheritance (e.g., ordered vs. unordered lists).

4.  Use C++11 random number facilities, distinguishing between random engines and distributions, and writing programs to generate random values.

## Lecture Video

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/oD-Mxxzx3Is?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Introduction

- ***Templates*** enable you to write generic code for related functions
  and classes.

- ***Function templates*** simplify function overloading.

## Templates

- Templates give us similar functionality as *generics* in Java, but
  also so much more!

- We can get the C++ compiler to write code for us, based on a set of
  rules we give it.

- ***Template*** – a single code body for a set of related functions
  (***function template***) and related classes (***class template***)

- Syntax:

  ```cpp
  template <typename Type>
  declaration;
  ```

  - `typename` denotes that we are creating a formal type parameter
    (`class` can also be used).

  - `Type`, in this example, is the type “placeholder” (because it is
    listed after `typename`).

  - `declaration` is either a function declaration or a class
    declaration.

- `typename` in the heading refers to any user-defined type or built-in
  type.

- `Type` is a formal parameter to the template

- Just as variables are parameters to functions, data types are
  parameters to templates

## Function Templates

- Syntax of the function template:

  ```cpp
  template <typename Type>
  function declaration;
  ```

- Type is a formal parameter of the template used to:

  - Specify the parameter types of the function.

  - Specify the return type of the function.

  - Declare variables within the function.

- A function template is not an actual function!  
  Source: [Back to Basics: Function and Class Templates - Dan Saks - CppCon 2019](https://youtu.be/LMP_sxOaz6g)


- It is a generalization of an algorithm that can generate generate
  similar, but distinct, function definitions.

- Each generates function implements the algorithm for operands of
  different types.

## Abbreviated Function Templates

As of C++20, the `auto` keyword can be used as a shorthand for parameter
type in a function template declaration.

The following function declarations are identical.

```cpp
template <typename Type>
void fun1(Type val);

template <typename Type>
void fun2(const Type& val);

void fun1(auto val);
void fun2(const auto& val);
```

`g++` may default to an older C++ standard. If so, add `-std=c++20` to
your compiler arguments to use template abbreviation.

The auto-grader uses the C++20 when checking your code.

## Class Templates

- Class template: a single code segment for a set of related classes

- Called parameterized types

- Syntax:

  ```cpp
  template <typename Type>
  class declaration;
  ```

- A template instantiation can be created with either a built-in or
  user-defined type

- The function members of a class template are considered to be function
  templates

## Source Files for Templated Classes

- Passing a parameter to a function occurs at ***run time***.

- Passing a parameter to a class template occurs at ***compile time***.

- Therefore, the implementation file cannot be compiled independently of
  the client code.

  - Can put class- and function-template definitions directly in the
    client code.

  - Can put class- and function-template definitions in the same header
    file.

- Another alternative is to put class definition and function
  definitions in separate files.

  - Include the directive to the implementation file at the end of the
    header file.

- In either case, function definitions and client code are compiled
  together.

## Java Generics vs C++ Templates

### Type Erasure vs Code Generation

- Java *generics* use **type erasure**: at runtime, all generic
types are compiled to Object (or primitive wrappers), and
type information is lost.
- C++ *templates* are **code generators**: the compiler creates
a new, fully typed version of the function or class for each
instantiation.
- C++ templates can lead to *code bloat* if many different
types are used.
- However, it also allows for *optimizations* that are not
possible in Java.

Java generics example

```Java 
List<Integer> ints = new ArrayList<>();
List<String> strs = new ArrayList<>();
// At runtime, both are really just List<Object>
```

```C++
std::vector <int> ints;
std::vector <std::string> strs;
// At compile time, two classes are generate.
```

In C++, `vector<int>` and `vector<string>` are distinct types at
compile time, enabling stronger type safety and optimizations

### Benefits of C++ Templates over Java Generics

- C++ templates work directly with the actual type, including
primitives, so there's zero runtime overhead.
- C++ templates can perform compile-time logic (template
metaprogramming).
- C++ allows template specialization: you can write
different implementations for specific types.
- With C++20, templates can specify constraints using
concepts (e.g., `requires Integral<T>` ).

| Feature            | Java Generics                        | C++ Templates                          |
|--------------------|--------------------------------------|----------------------------------------|
| Runtime behavior   | Type erasure (all become `Object`)    | Code generation per type               |
| Performance        | Possible boxing/unboxing             | Zero overhead, fully typed             |
| Compile-time power | None                                 | Metaprogramming, `constexpr`           |
| Specialization     | Not supported                        | Full & partial specialization          |
| Constraints        | Interfaces only                      | Concepts (C++20) and SFINAE            |

: Comparison of Java Generics and C++ Templates

## Array-Based Lists (ADT)

- Using class templates allows the creation of generic code.

- Can create abstract class `ArrayList` as an abstract data type (ADT).

  - Must overload the assignment operator.

- Can derive `UnorderedArrayList` or `OrderedArrayList` from
  `ArrayList`.

## C++11 Random-Number Generator

- To use C++11 random-number generator functions, we use an engine and
  a distributor.

  - An engine returns unpredictable (random) bits.

  - A distribution returns random numbers whose likelihoods correspond
    to a specific shape such as a uniform or normal distribution.

- The C++11 standard library provides 25 distribution types in five
  categories.

  - `uniform_int_distribution` and `uniform_real_distribution` fall in
    the category of uniform distributions.

```cpp
#include <random>

int main()
{
  std::random_device randDevice;
  std::default_random_engine num{ randDevice() };
  std::uniform_int_distribution<int> dist{1, 6};

  // Generate 10 ints that are between 1 and 6.
  for (int count = 1; count <= 10; ++count) {
    std::cout << dist(num) << ' ';
  }
}
```

## Quick Review

- A `friend` function is a nonmember of a class.

- If an operator function is a member of a class, the leftmost operand
  of the operator must be a class object (or a reference to a class
  object) of that operator’s class.

- Classes with pointer variables ***must*** overload the assignment
  operator, and include both the copy constructor and the destructor.

- In C++, `template` is a reserved word.

- Function template: a single code segment for a set of related
  functions.

- Class template: a single code segment for a set of related classes.

- Are called ***parameterized types***.

- C++11 provides many functions to implement random number generators.

## Lab 6: Templates and Operator Overloading

Let’s take a look at Lab 6.
