More with Pointers and Unit Testing
===================================

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/L7h6WVxJlWo?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Overview

- Objects in C++ share many similarities with Java,  
  but are considered more powerful:

  - They can be created on the stack.

  - C++ allows multiple inheritance.

    - no need for the interface keyword.

  - Templates act like generics, except they are a compile-time
    construct, not run time.

- Remember, C++ is compiled to machine code; Java compiles to byte code!

## Review

### Pointers to Stack Memory

|  |  |
|:---|:---|
| `int num = 32;` | Declare an `int` variable on the stack and set to `32`. |
| `int *ptr;` | Declare a variable `ptr` to store the memory address of where an `int` resides. |
| `ptr = \&num;` | `\&num` gets the memory address of `num`. Stores the memory address of `num` in `ptr`. |
| `*ptr = 64;` | Go to where `ptr` is pointing (`*`) and store `64` there. Since `ptr` is pointing to `num`, `num` now has `64`. |

### Pointer to Heap Memory

|  |  |
|:---|:---|
| `int *a;` | Create a variable `a` on the stack that will store the memory address of an integer. |
| `a = new int;` | Allocate an `int` in memory and store the memory address of that `int` in `a`. |
| `*a = 5;` | Manipulate the new `int` just like before. |
| `delete a;` | Because the integer is on the heap, you must de-allocate! |
| `a = nullptr;` | After `delete`, reassign the pointer to `nullptr` (best practice). |

### Arrays with Pointer Arithmetic

|                    |                                                        |
|:-------------------|:-------------------------------------------------------|
| `int ary[100];`    | Create an array of 100 integerson the stack.           |
| `int *pAry = ary;` | Create a pointer to the array.Note: `\&` was not used. |

  
The following four statements are equivalent.  

|                  |     |                      |
|-----------------:|:----|---------------------:|
|  `ary[10] = 50;` |     |  `*(ary + 10) = 50;` |
|                  |     |                      |
| `pAry[10] = 50;` |     | `*(pAry + 10) = 50;` |

  

### Arrays

- In Java, arrays are actually objects that store length and other
  information.

- In C++, an array is a sequence list of data. (Nothing else is stored.)

- These are valid declarations in C++, but not in Java. Why?

  ```cpp
  int x[20];    // Create 20 integers
  Button b[20]; // Create 20 Buttons
  ```

### Pointers and Arrays

- In C++, pointers and arrays have a close relationship.

- Instead of `int x[20];`  
  we can can write  
  `int *x = new int[20];`  
  to allow for dynamic allocation.

  - Usage of the array (e.g., `x[3] = 5;`) identical in both cases

  - To deallocate, use `delete[] x;`

## Constants

### Pointers and Const-Correctness

A good rule of thumb is to use `const` wherever possible. Pointers have
two types of const-ness.

- A pointer to constant data  
  `const int * ptr;`  
  `int const * ptr;`  
  You cannot change the value at the address this pointer is pointing
  to.

- A pointer with a const memory address  
  `int * const ptr;`  
  You cannot change what this pointer points to.

### Pointers and Const-Correctness

A good rule of thumb is to use `const` wherever possible. Pointers have
two types of const-ness.

- A const pointer to const data  
  `const int * const ptr;`  
  `int const * const ptr;`

## Object Pointers

### In C++, a pointer can point to anything.

- Primitives
- Arrays
- Other pointers
- Objects
- Functions
- Something nonspecific

### Casting

C++ is incredibly powerful, because of casting.  

```cpp
int num = 300;
int* const pInt = &num;
float* const pFloat = reinterpret_cast<float*>(pInt);
*pFloat = 3.14159; // undefined behavior
std::cout << "*pFloat = " << *pFloat;
std::cout << "\n    num = " << num << '\n';
```

- Yes, that is “legal.”

- The value of `num` is !

### Pointers to Objects

Pointers to instances of `struct`s and `class`es work the same as with
primitive types (e.g., `int`).

```
struct Dog {
  std::string name;
  std::string breed;
  int yearsOld;
};
```

```
int main(int argc, char *argv[]) {
  Dog myPet {"Bella", "German Shepherd", 7};
  Dog *pFriend = new Dog {"Rocky", "Poodle", 2};

  std::cout << myPet.name << std::endl;
  std::cout << (*pFriend).name << std::endl;

  // using member-access arrow
  std::cout << pFriend->name << std::endl;

  return 0;
}
```

### Pointers to Objects

- In Java, a pointer is called a reference to an object:  
  `String str = new String("Hello!");`

- In C++, a pointer stores the memory location of something else. For
  objects:  
  `std::string *str = new std::string("Hello!");`

### Pointers to Objects: A Simple Explanation

- In Java, pointers only exist for objects.

- In C++, a pointer may point to anything.

## Function Pointers

### Function Pointers

- A ***pointer*** is a variable that stores the address of something.

- A ***function pointer*** stores the address of a function.

- The function can be called by dereferencing the function pointer.

- Function pointers can be passed as parameters to other functions.

- Functions can return function pointers.

- Commonly used in
  [callbacks](https://en.wikipedia.org/wiki/Callback_(computer_programming)).

### Function Pointers

```cpp
#include <iostream>

int foo() { return 4; }

int main(int argc, char *argv[])
{
  // Display functions memory address.
  // Cast to void pointer to ensure the address is properly displayed.
  std::cout << reinterpret_cast<void*>(main) << std::endl;
  std::cout << reinterpret_cast<void*>(foo) << std::endl;

  // Create a pointer that points to foo()
  int (*fcnPtr)() = foo;

  // Call foo() using pointer
  std::cout << "The return value of foo() is "
    << (*fcnPtr)()
    << std::endl;

  return 0;
}
```

### There is more

Pointers can point to many things.

- Primitives

- Arrays

- Other pointers

- Objects

- Functions

- Something nonspecific (`void *`).  
  Void pointers are more useful in C but should be avoided in C++.

## Lab 4: Pointers

Let’s talk about Lab 4, which is more practice with pointers.

## Ethics Essay: THERAC-25

Review the instructions for the ethics essay today!

## Test Your Code

***Testing will make you more productive.***  
Meaning, you will spend less time working on problems because you will

- increase your chances of getting it right the first time AND

- rarely make the same mistake twice.

### Warning

- A computer program *cannot* sufficiently generate test cases for your
  code.

- [The Halting Problem](https://en.wikipedia.org/wiki/Halting_problem):
  Alan Turing proved that it is impossible for a computer to determine
  if any program halts (finishes).  
  ([see Explanation on YouTube.](https://youtu.be/92WHN-pAFCs?t=14))

- If we don’t know if it halts, how can we test?

- This is your job, and an advantage you have over computation.

### Unit Test

- For this course, unit testing is sufficient.

- There are many other forms of testing, but this course focuses on
  (relatively) small units of code.

- There are numerous unit-testing tools, but no *de facto* standard for
  C++.

  - Unlike Java’s JUnit

- Popular testing frameworks for C++ include
  [GoogleTest](https://google.github.io/googletest/),
  [Boost.Test](https://www.boost.org/doc/libs/1_81_0/libs/test/doc/html/index.html),
  [CppUnit](https://freedesktop.org/wiki/Software/cppunit/),
  [CxxTest](https://cxxtest.com/), and
  [Catch2](https://github.com/catchorg/Catch2).

### Doctest – Unit Testing for C++

- We will use [Doctest](https://github.com/doctest/doctest#readme) for
  this course.

  - Doctest is simple, yet has a rich feature set.

- You only need to place the one file,
  [doctest.h](https://github.com/doctest/doctest/blob/master/doctest/doctest.h?raw=true),
  in your test repository.

- I have provided a full template in class-code.  
  Let’s take a look

## Lab 5

### Auto-Grader

- An auto-grader will provide a grade for most of the labs (starting in
  Lab 5).

  - It will not say what test cases you failed.

  - It may not mention if there is a timeout.

  - It may not say if there are compilation errors.

  - It *may* tell you which part of the lab you got right or wrong.

- Test cases from the auto-grader will **NOT** be disclose. You **must**
  learn how to write your own test cases!

- The grade from the auto-grader should be pushed to your repository
  shortly after you push your solution.

### Lab 5: A Review of C++ Arrays

Let’s talk about Lab 5.
