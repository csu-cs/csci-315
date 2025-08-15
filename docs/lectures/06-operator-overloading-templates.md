Operator Overloading and Templates
==================================

Chapter 13

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/FXdo32nZi4M?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Objectives

In this lecture, you will:

- Learn about overloading.

- Become familiar with the restrictions on operator overloading.

- Examine the `this` pointer.

- Learn about `friend` functions.

- Learn how to overload operators as members and nonmembers of a class.

- Discover how to overload various operators.

- Become familiar with the requirements for classes with pointer member
  variables.

- Learn about templates.

- Explore how to construct and use function and class templates.

- Become aware of C++11 random number generators.

## Operator Overloading

### Why Operator Overloading Is Needed

Consider the following statements:

```cpp
ClockType local{8, 23, 34};
ClockType yourTime{4, 23, 30};
```

Which version of the C++ statements below would you prefer?

```cpp
local.print();
local.incrementSeconds();
if (local.equal(yourTime))
// ...
```

```cpp
cout << local;
local++;
if (local == yourTime)
// ...
```

### Why Operator Overloading Is Needed

- Assignment and member selection are the only built-in operations on
  classes.

  - Other operators cannot be applied directly to class objects.

- ***Operator overloading*** extends the definition of an operator to
  work with a user-defined data type.

  - C++ allows you to extend the definitions of most of the operators to
    work with classes.

### Notes

- Most existing C++ operators can be overloaded to manipulate class
  objects.

- New operators cannot be created.

- An ***operator function*** is a function that overloads an operator.

  - Use reserved word `operator` followed by the operator as the
    function name.

### Syntax for Operator Functions

- Syntax of an operator function heading:  
  `returnType operator symbol(formal parameter list)`

  - It is a value-returning function.

  - `operator` is a reserved word.

- To overload an operator for a class:

  - Include the operator function declaration in the class definition.

  - Write the definition of the operator function.

### Friend Functions of Classes

- A ***friend function*** (of a class) is a nonmember function of the
  class that has access to all the members of the class.

- Use the reserved word `friend` in the function prototype in the class
  definition.

- Friendship is always given by the class.

  ```cpp
  class IllusFriend
  {
      friend void two(/*parameters*/);
      // ...
  };
  ```

### Definition of a Friend Function

- `friend` does not appear in the heading of the function’s definition.

- When writing the `friend` function’s definition.

- The name of the class and the scope resolution operator are not used.

  ```
  void two(/*parameters*/)
  {
      // ...
  }
  ```

### Operator Functions as Member and Nonmember Functions

- To overload `()`, `[]`, `->`, or `=` for a class, the function must be
  a member of the class.

- Suppose `op` is overloaded for `opOverClass`:

  - If the leftmost operand of `op` is an object of a different type,
    the overloading function must be a nonmember (friend) of the class.

  - If the overloading function for `op` is a member of `opOverClass`,
    then when applying `op` on objects of type `opOverClass`, the
    leftmost operand must be of type `opOverClass`.

## Binary Operators

### Overloading Binary Operators

- If **`#`** represents a binary operator (e.g., `+` or `==`) that is to
  be overloaded for `rectangleType`.

- It can be overloaded as either a member function of the class or as a
  friend function.

### Binary Operator Overloads as Methods

- Function prototype (included in the class definition):  
  `returnType operator#(const Type&) const;`

- Function definition:  

  ```cpp
  returnType operator#(const Type& otherObject) const
  {
    // algorithm to perform the operation
    return value;
  }
  ```

### Binary Operator Overloads as Nonmember Functions

- Function prototype (included in class definition):

      friend returnType operator#(const Type&, const Type&) const;

- Function definition:

  ```
  returnType operator#(const Type& leftObject, const Type& rightObject) const
  {
    // algorithm to perform the operation
    return value;
  }
  ```

### Overloading the Stream Insertion (`<<`) and Extraction (`>>`) Operators

- Consider the expression:  
  `cout << myRectangle;`

  - Leftmost operand is an `std::ostream` object, not a `rectangleType`
    object.

- Thus, the operator function that overloads `<<` for `rectangleType`
  must be a nonmember function of the class.

  - The same applies to the function that overloads `>>`.

### Overloading the Stream Insertion Operator (`<<`)

- Function prototype:  

    ```cpp
    friend std::ostream& operator<<( std::ostream&, const Type&);
    ```

- Function definition:  

    ```cpp
    std::ostream& operator<<(std::ostream& out, const Type& cObject) {
        // local declaration, if any
        // Output the members of cObject.
        // out << ...

        return out; // return the stream object.
    }
    ```

### Overloading the Stream Extraction Operator (`>>`)

- Function prototype:  

    ```cpp
    friend std::istream& operator>>( std::istream&, Type&);
    ```

- Function definition:  

    ```cpp
    std::istream& operator>>(std::istream& in, Type& cObject)
    {
        // local declaration, if any
        // Read the members of cObject.
        // in >> ...

        return in; // return the stream object.
    }
    ```

### Overloading the Assignment Operator (`=`)

Function prototype:  
`const Type& operator=(const Type&);`

Function definition:  

```cpp
const Type& operator=(const Type& rightObject)
{
  // local declaration, if any
  // Avoid self-assignment
  if (this != &rightObject)
  {
    // Copy rightObject into this object
  }
  return *this; // return the object assigned
}
```

### Classes with Pointer Members (Revisited)

- Recall that the assignment operator copies member variables from one
  object to another of the same type.

  - Does not work well with pointer member variables.

- Classes with pointer member variables must:

  1.  Explicitly overload the assignment operator.

  2.  Include the copy constructor.

  3.  Include the destructor.

### Member vs. Nonmember Operator Overloading

- Some operators must be overloaded as member functions and some as
  nonmember (`friend`) functions.

- Binary arithmetic operators can be overloaded either way.  

    ```cpp
    Type operator+(const Type&);
    ```

      or 

    ```cpp
    friend Type operator+(const Type&, const Type&);
    ```

Member Function for Operator Overload:

- As a member function, the operation has direct access to data members
  of one of the objects.

- Need to pass only one object as a parameter.

Non-Member Function for Operator Overload:

- Both operands are included as parameters when nonmember functions that
  define binary operators.

- The code may be somewhat clearer this way.

### Overloading the Array Index Operator `[]`

- Declaring the `[]` operator as a class member for nonconstant arrays:

      Type& operator[](int index);

- Declaring the `[]` operator as a class member for constant arrays:

      const Type& operator[](int index) const;

## Overloading Unary Operators

- To overload a unary operator for a class:

  - If the operator function is a member of the class, it has no
    parameters.

  - If the operator function is a nonmember (i.e., a `friend` function),
    it has one parameter.

### Pre-Increment (`++`) and Pre-Decrement (`-``-`)

The general syntax to overload the pre-increment operator `++` as a
member function.

```cpp
Type operator++()
{
    // Increment the value of the object by 1
    return *this; //return the new value
}
```

### Post-Increment (`++`) and Post-Decrement (`-``-`)

The general syntax to overload the post-increment operator `++` as a
member function.

```cpp
Type operator++(int)
{
    const auto TEMP = *this; // copy old value

    // Increment the value of the object by 1

    return TEMP; // the copy of the old value
}
```

Post-Increment (`++`) and Post-Decrement (`-``-`) The general syntax to
overload the post-increment operator `++` as a nonmember function.

- Function prototype:

  ```cpp
  friend Type operator++(Type&, int);
  ```

- Function definition:

  ```cpp
  Type operator++(Type& incObj, int) {
    const auto TEMP = incObj; // copy old

    // Increment the value of the object by 1

    return TEMP; // the copy of the old value
  }
  ```

## Restrictions

### Overloading an Operator: Some Restrictions

- Cannot change the precedence of an operator.

- Associativity cannot be changed.

- Default parameters cannot be used.

- Cannot change number of parameters.

- Cannot create new operators.

- Cannot overload: `.`  `.*`  `::`  `?:`  `sizeof`

- Operators on built-in types cannot be redefined.

- Can overload for user-defined objects or for a combination of
  user-defined and built-in objects.

## Templates

### Introduction

- ***Templates*** enable you to write generic code for related functions
  and classes.

- ***Function templates*** simplify function overloading.

### Templates

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

### Function Templates

- Syntax of the function template:

  ```cpp
  template <typename Type>
  function declaration;
  ```

- Type is a formal parameter of the template used to:

  - Specify the parameter types of the function.

  - Specify the return type of the function.

  - Declare variables within the function.

### Function Templates

- A function template is not an actual function!  
  Source: [Back to Basics: Function and Class Templates - Dan Saks - CppCon 2019](https://youtu.be/LMP_sxOaz6g)


- It is a generalization of an algorithm that can generate generate
  similar, but distinct, function definitions.

- Each generates function implements the algorithm for operands of
  different types.

### Abbreviated Function Templates

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
your compiler arguments to user template abbreviation.

The auto-grader uses the C++20 when checking your code.

### Class Templates

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

### Source Files for Templated Classes

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

### Array-Based Lists

- Using class templates allows the creation of generic code.

- Can create abstract class `ArrayList` as an abstract data type (ADT).

  - Must overload the assignment operator.

- Can derive `UnorderedArrayList` or `OrderedArrayList` from
  `ArrayList`.

## C++11 Random-Number Generator

- To use C++ 11 random-number generator functions, we use an engine and
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

int main() {
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

- ***Overloaded*** operator – an operator that has different meanings
  with different data types.

- Operator function – a function that overloads an operator.

- Operator functions are value-returning.

- Operator overloading provides the same concise notation for
  user-defined data types as for built-in data types.

- Only existing operators can be overloaded.

- The `this` pointer refers to the object.

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
