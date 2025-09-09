Classes, Inheritance, and Operator Overloading
==============================================

Chapters 10 and 11.

Learning Outcomes
-----------------

After completing this lecture and the related lab, students will be able to:

1.  **Explain the fundamental concepts of object-oriented programming (OOP)** in C++, including encapsulation, inheritance, and polymorphism.
2.  **Define and implement C++ classes and objects**, including the use of member variables, member functions, constructors, and destructors.
3.  **Organize class code using header and implementation files**, and apply access specifiers (public, private, protected) appropriately.
4.  **Demonstrate the use of operator overloading** and explain its role in customizing class behavior.
5.  **Describe and apply inheritance and composition** to model relationships between classes.
6.  **Differentiate between static and dynamic binding** and use the virtual keyword to enable polymorphism.
7.  **Compare and contrast OOP features in C++ and Java**, especially regarding memory management and inheritance.
8.  **Understand the basics of templates** and their role in static polymorphism (as a preview for future lectures).

## Lecture Video

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/rSD8MJiVA3Y?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Intro to Classes

### Syntax of Class

- The general syntax for defining a class is

    ```C++
    class ClassIdentifier
    {
        // Class members (variables and functions);
    }; // <- Don't forget the semicolon.
    ```

- A class member can be a variable or a function.

### Syntax of Class

- *Data members* of a class are declared just like ordinary variables.

- *Function members* of a class (i.e., methods),

  - Are declared withing the class as a prototype.

  - A common practice is to define the function separately.

  - Function members can ***directly*** access any member of the class.

### Class Organization

Access restrictions for members are set with the following keywords.

- `public`: accessible outside the class.

- `private`: cannot be accessed outside the class.

- `protected`: access for the class and its subclasses.

- `friend`: grant member-level access to non-member functions or
  classes. Use sparingly (or not at all); this reduces encapsulation and
  increases coupling.

In Java, each member is prefixed with a keyword.

In C++,

  - Each class can have `public`, `private`, and `protected` sections listing
    members with that access.

  - The `friend` keyword is placed before a function/class name to
    indicate its access level.

A **`struct`** versus a **`class`**

- By default, members of a `struct` are public.  
  Use the `private` specifier to make a member private.

- By default, the members of a `class` are private.

- Classes and structs have the same capabilities.

- Use a `struct` if all member variables of a class are public and
  especially if there are no member functions (“plain old data”).

## Member Functions

- ***Methods*** are member functions, which define object behavior.

- Including only prototypes in class declaration keeps the class smaller
  and hides the implementation.

### Example Class

::: code-group

```C++ [AClass.hpp]
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

```C++ [AClass.cpp]
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

::: tip Style Tip

Start member variables with a `m` like (`mSize` in the above example) to easily
differentiate them from local variables.

:::

### Class File Organization

- Typically, each class declaration is in its own `.hpp` file.

  - Avoid including this code multiple times in a program by using
    preprocessor directives to check for a unique definition.  

    ::: code-group

    ```C++ [MyClass.hpp]
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

  - Static methods do not have access to non-static members.

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

```C++ [AClass.hpp]
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

```C++ [AClass.cpp]
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

  ```C++
  Clock myClock; // Invokes the default constructor.
  Clock *pClock = new Clock; // Invokes the default constructor
  ```

- You can create and invoke custom constructors.

  ```C++:line-numbers=3
  Clock start{12} // Invokes a constructor that accepts and int
  ```

## C++ Destructor

- Special method whose signature is a `~` followed by the name of the
  class.
  - A destructor cannot be overloaded and does not take parameters.

- A destructor is called automatically when an object goes out of scope or is deleted.

- A destructor is typically used to free memory allocated by the constructor.
  - If the class contains pointers and the constructor
  contains calls to `new`, a destructor needs to be defined.

- Java does not have explicit destructors because of garbage collection.

::: code-group

```C++ [AClass.hpp]
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

```C++ [AClass.cpp]
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

## Coping Objects and Assignment in C++

The **copy constructor** and **assignment operator** define the
semantics of `a = b`.

- The *copy constructor* defines how a *new* object is created as a
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

- Doing so requires *overloading* the assignment operator’s
  definition when it accepts two objects of our class.

- We will give a brief introduction to *operator overloading* , but 
  go in depth on the topic in the next lecture.

## Operator Overloading

- In C++, operators like `=`, `+`, `*`, `==`, etc. can be defined, just
  like methods.

- Example:

  ```C++
  class Matrix
  {
  public:
    Matrix(const Matrix& m); // Copy constructor
    const Matrix& operator+(const Matrix& m); // overload + op
    const Matrix& operator=(const Matrix& m); // overload = op
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

  ```C++
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

### Overloading the Stream Insertion Operator (`<<`)

- Function prototype:
 
  ```C++
  friend std::ostream& operator<<(std::ostream&, const className&);
  ```

- Function definition:  

  ```C++
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

::: tip Design Tip

Use reference parameters to avoid unnecessary
copies. Make the parameter `const` if the function should not modify
it.

:::

## Inheritance

### Inheritance vs. Composition

Two common ways to relate two classes in a meaningful way are:

- ***Inheritance***: an “is-a” relationship.

- ***Composition*** or ***aggregation***: a “has-a” relationship.

### Inheritance

- Feature that allows a class to be defined based on another class.

  - Methods and attributes are inherited.

- Java and C++ have difference syntax and different types of inheritance.
  - Java: `public class A extends B { }`
  - C++ `class A: public B { };`

- Multiple inheritance possible in C++, not in Java.

- But in Java, one may implement several interfaces.

### Static vs. Dynamic Binding

- Let `Teacher` be a subclass of `Employee`  

  - Also, suppose `promote()` is a method defined in both classes.

- Employee variables can refer to Teachers.

  ::: code-group

  ```Java [Java Example]
  Employee emp;
  emp = new Teacher();
  emp.promote();
  ```

  ```C++ [C++ Example]
  Employee *emp; // probably should name pEmp;
  emp = new Teacher;
  emp->promote();
  ```

  :::

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

  ```C++
  class Animal
  {
  public:
    virtual void print() const;
    // ...
  };
  ```

- With inheritance, it is a good idea to make the destructors virtual to
  ensure that the child object’s memory is freed.

### Design Paradigms

- ***Encapsulation***: combines data and operations on data in a single
  unit.

- ***Inheritance***: creates new objects (classes) from existing objects
  (classes).

- ***Polymorphism***: the ability to use the same expression to denote
  different operations.

### Static vs. Dynamic Polymorphism

- Inheritance provides the ability to change types at runtime (though
  subclasses).

- ***Templates*** provide the ability to change types at compile time.

  - [The next lecture](06-operator-overloading-templates) will cover templates (Chapter 13).

### There is more.

- We have quickly skimmed the material in Chapters 10 – 11 in this lecture.

- Reference the textbook for details and examples.

## Review Questions

Use these questions to check your understanding of the material. These are not for a grade.

1. What are the main principles of object-oriented programming, and how does C++ support each one?
2. How do you define a class in C++? What is the difference between a class and a struct?
3. What is the purpose of access specifiers (`public`, `private`, `protected`) in C++ classes?
4. Explain the difference between a constructor and a destructor. When is each called?
5. What is operator overloading? Give an example of how you might overload an operator in a class.
6. How does inheritance work in C++? What is the difference between inheritance and composition?
7. What is the difference between static and dynamic binding? How does the `virtual` keyword affect this?
8. Why might you need to write a copy constructor or an assignment operator for your class?
9. How are objects passed to functions in C++? What are the advantages of passing by reference?
10. How does C++'s approach to OOP differ from Java's, especially regarding memory management and inheritance?

Try to answer these questions on your own or discuss them with a classmate!