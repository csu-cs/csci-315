Classes, Inheritance, and Operator Overloading
==============================================

Chapters 10 and 11.

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/vHvPFaCU9-0?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Intro to Classes

### Syntax of Class

- The general syntax for defining a class is

    ```cpp
    class ClassIdentifier
    {
        // Class members (variables and functions);
    }; // <- Don't forget the semicolon.
    ```

- A class member can be a variable or a function.

### Syntax of Class

- If a member of a class is a variable,

  - It is declared like any other variable.

  - You cannot initialize a variable when you declare it.

- If a member of a class is a function,

  - A function prototype declares that member.

  - Function members can ***directly*** access any member of the class.

### Class Organization

Access restrictions for members are set with the following keywords.

- `public`: accessible outside the class.

- `private`: cannot be accessed outside the class.

- `protected`: access for the class and its subclasses.

- `friend`: grant member-level access to non-member functions or
  classes. Use sparingly (or not at all); this reduces encapsulation and
  increase coupling.

### Class Organization

- In Java, each member is prefixed with a keyword.

- In C++,

  - Each class can have public, private, and protected sections listing
    members with that access.

  - The `friend` keyword is placed before a function/class name to
    indicate its access level.

A **`struct`** versus a **`class`**

- By default, members of a `struct` are public.  
  Use the `private` specifier to make a member private.

- By default, the members of a `class` are private.

- Classes and structs have the same capabilities.

- Use `struct` if all member variables of a class are public and
  especially if there are no member functions (“plain old data”).

## Member Functions

- ***Methods*** are member functions, which define object behavior.

- Including only prototypes in class declaration keeps the class smaller
  and hides the implementation.

### Example Class

::: code-group

```cpp [AClass.hpp]
#ifndef A_CLASS
#define A_CLASS

class AClass
{
  public:
    // Methods
    int getSize() const;
    void size(int size);

  private:
    int mSize;
};
#endif
```

```cpp [AClass.cpp]
#include "AClass.hpp"
int AClass::getSize() const
{
  return mSize;
  // "this" is implied.
  // return this->mSize;
}

void AClass::size(int size)
{
  mSize = size;
}
```

:::

### Class File Organization

- Typically, each class declaration is in its own `.hpp` file.

  - Avoid including this code multiple times in a program, by using
    preprocessor directives to check for a unique definition.  

    ::: code-group

    ```cpp [MyClass.hpp]
    #ifndef MY_CLASS
    #define MY_CLASS
    //...
    #endif
    ```

    :::

- The function definitions go in the .cpp file with the matching name
  and will include the header.  
  e.g., the top of `MyClass.cpp` has `#include "MyClass.hpp"`.

### Types of Class Methods (Member Functions)

- ***Mutator*** modifies the value(s) of member variable(s).

- ***Accessor*** only accesses the value(s) of member variable(s).

- ***Constant*** cannot modify the class’s member variables.

  - The function heading ends with `const`.

  - Most accessors should be constant.

- ***Static*** does **not** have access to non-static members.  
Does not have access to the `this` pointer.

### Types of Member Functions

- Instance methods – accessible through an instantiated object.

- ***Static*** methods – accessible using the class name and the scope
  resolution operator (`::`).

  - Use the keyword `static` to declare a function or variable of a
    class as static.

  - No object is needed to access a static member.

  - Static methods do not have access not no-static members.

  - All objects of a class share any static member of the class.

### Types of Member Functions

- Method ***overloading*** – within a class, two methods with the same
  name but different signatures.

- Method ***overriding*** – same signatures across different classes
  (subclass and superclass).

### The `this` Pointer

- Every object of a class maintains a (hidden) pointer to itself called
  `this`.

- When an object invokes a member function, `this` is referenced by the
  member function.

- Within a member function, `this` can also be used explicitly.  
  `this->member;`

## Constructors

A ***constructor*** contains code that initializes the object.

- ***Default Constructor*** – Requires no parameters.

- Parameterized Constructors – Defines the object’s initialization.

- Constructors are executed automatically.

::: code-group

```cpp [AClass.hpp]
class AClass
{
public:
  // Default Constructor
  AClass();


  // Custom Constructor
  AClass(int size);

private:
  // A member field
  int mSize;
};
```

```cpp [AClass.cpp]
#include "AClass.hpp"

AClass::AClass()
{
  mSize = 0;
}

AClass::AClass(int size)
{
  mSize = size;
}
```

:::

### Invoking a Constructor

- In Java, a constructor is invoked only through the `new` keyword
  because all object variables are references.

- In C++, a constructor is called upon variable declaration, or
  explicitly through `new` with pointers, or in other situations.  

  ```cpp
  Clock myClock; // Invokes the default constructor.
  Clock *pClock = new Clock; // Invokes the default constructor
  ```

- You can create and invoke custom constructors.

  ```cpp:line-numbers=3
  Clock start{12} // Invokes a constructor that accepts and int
  ```

## C++ Destructor

- Special method whose signature is a `~` followed by the name of the
  class.

- Particularly if the class contains pointers and the constructor
  contains calls to new, a destructor needs to be defined.  

::: code-group

```cpp [AClass.hpp]
class AClass
{
public:
  // Default Constructor
  AClass();

  // Destructor
  ~AClass();

private:
  // Pointer to a dynamic array
  int *mpArr;
};
```

```cpp [AClass.cpp]
#include "AClass.hpp"

AClass::AClass()
  : mpArr{new int[20]}
{
}

AClass::~AClass()
{
  delete[] mpArr;
}
```

:::

## Copying Objects

### Control Over Copy and Assignment in C++

The ***copy constructor*** and ***assignment operator*** define the
semantics of `a = b`.

- The *copy constructor* defines how a ***new*** object created as a
  copy of an existing object (e.g., when function parameters are
  passed).

- More low-level control is available (e.g., performing a deep copy
  instead of a shallow copy).

  - Be careful to implement a deep copy if desired.

### Assignment Operator

- The assignment operator (`a = b`) where object `a` is an existing
  object. Means that we are replacing the values in `a` with a copy of
  the values in `b`.

- Therefore, we must define how this should happen.

- Doing so requires ***overloading*** the assignment operator’s
  definition when it accepts two objects of our class.

- We will give a brief introduction to ***operator overloading*** here
  but go in dept on the topic in the next lecture.

## Operator Overloading

- In C++, operators like `=`, `+`, `*`, `==`, etc. can be defined, just
  like methods.

- Example:

  ```
  class Matrix
  {
  public:
    Matrix(const Matrix& m); // Copy constructor
    Matrix operator+(const Matrix& m); // overload + op
    Matrix operator=(const Matrix& m); // overload = op
    // ...
  };
  ```

  ```
  Matrix a, b, c;
  c = a + b;  // equiv to c = a.operator+(b);
  ```

### Overloading the Assignment Operator (`=`)

- Function prototype:  
  `const className& operator=(const className&);`

- Function definition:  

  ```cpp
  const className& operator=(const className& rightObject)
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

### Overloading the Stream Insertion Operator (`<``<`)

- Function prototype:
 
  ```cpp
  friend std::ostream& operator<<(std::ostream&, const className&);
  ```

- Function definition:  

  ```cpp
  std::ostream& operator<<(std::ostream& out,
      const className& cObject) {
    // local declaration, if any
    // Output the members of cObject.
    // out << ...

    return out; // return the stream object.
  }
  ```

### Objects as Function Parameters

- Objects can be passed as parameters to functions and returned as
  function values.

- Class objects can be passed by value or by reference.

- If an object is passed by value, the data members’ values are copied
  (using the copy constructor).

  - Requires additional storage space and a considerable amount of
    computer time

- ***Design tip***: Use reference parameters to avoid unnecessary
  copies. Make the parameter `const` if the function should not modify
  it.

## Inheritance

### Inheritance vs. Composition

Two common ways to relate two classes in a meaningful way are:

- ***Inheritance*** – an “is-a” relationship.

- ***Composition*** or ***aggregation*** – a “has-a” relationship.

### Inheritance

- Feature that allows a class to be defined based on another class.

  - Methods and attributes are inherited.

- Java and C++ difference

- Multiple inheritance possible in C++, not in Java.

- But in Java, one may implement several interfaces.

### Static vs. Dynamic Binding

- Let `Teacher` be a subclass of `Employee`  

  - Also, suppose `promote()` is a method defined in both classes.

- Employee variables can refer to Teachers

  |                        |                      |
  |:-----------------------|:---------------------|
  | **Java**               | **C++**              |
  | `Employee emp;`        | `Employee *emp;`     |
  | `emp = new Teacher();` | `emp = new Teacher;` |
  | `emp.promote();`       | `emp->promote();`    |

- Is the Employee’s or the Teachers’ `promote()` method called?

- In C++, Employee’s `promote()` is called.

  - As determined at compile time and deduced from the type of the
    variable (static binding).

- In Java, Teacher’s `promote()` is called.

  - As determined at run-time, because the actual type of the referred
    object is checked then (dynamic binding)

### Static vs. Dynamic Binding

- A function can be declared *virtual* to use dynamic binding instead of
  static.  

  ```cpp
  class Animal
  {
  public:
    virtual void print() const;
    // ...
  };
  ```

- With inheritance, it is a good idea to make the destructors virtual to
  ensure that the child object’s memory is freed.

### Design Principles

- ***Encapsulation***: combines data and operations on data in a single
  unit.

- ***Inheritance***: creates new objects (classes) from existing objects
  (classes).

- ***Polymorphism***: the ability to use the same expression to denote
  different operations.

### Static vs. Dynamic Polymorphism

- Inheritance provides the ability to change types at runtime (though
  subclasses).

- Templates provide the ability to change types at compile time.

  - We will learn more about templates in the next set of slides
    (Chapter 13).

### There is more.

- We have quickly skimmed the material in Chapters 10 – 11 in this lecture.

- Reference the textbook for details and examples.
