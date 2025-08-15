Memory Management
=================

Chapter 12

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/K9WPtkX4GPs?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## References & Aliases

### A Review of C++ References & Aliases

1.  In a parameter declaration, `&` makes a *reference*.  
    The parameter refers to the memory location of the original
    variable.

    ```cpp
    void limit(double& value, double max) {
        if (value > max) {
        value = max;
        }
    }

    double score = 120.5;
    limit(score, 100.0);
    std::cout << score << '\n'; // 100.
    ```

2.  In a variable declaration, `&` makes that variable an *alias*.  
    
    ```cpp
    double score = 205.3;
    double &alias = score;
    ```

    The variable is a new name for the old variable location.

3.  Before an existing variable, `&` evaluates to the variable’s memory
    address.  

    ```cpp
        double score = 91.3;
        std::cout << &score; // score's address.
    ```

## Static Data

### The 3 Memory Sections (for Data Storage)

- **Static**: storage requirements are known and allocated before
  execution and remain for the entire program execution.

- **Call Stack** (or execution stack): memory associated with active
  functions.

  - Structured as ***stack frames*** (i.e., activation records)

- **Heap**: dynamically allocated storage; the least organized and most
  dynamic storage area.

![](/images/memory-management/memory_structure.svg "Memory layout for each running process."){width=200px .light-only}

![](/images/memory-management/memory_structure-dark.svg "Memory layout for each running process."){width=200px .dark-only}

### Static Data Memory

- The simplest memory to manage.

- Consists of anything that can be completely determined at compile
  time. For example:

  - global variables,

  - static variables, and

  - function and class definitions (instructions).

- Characteristics:

  - Storage requirements are known before execution.

  - The size of the static storage area is constant throughout
    execution.

## The Stack

### The Call Stack

- The ***Call Stack*** (i.e., the *Runtime Stack* or *Execution Stack*)
  is a contiguous memory region that grows and shrinks.

- Supports function calls.

- The stack **grows** when a function is called (activated); its
  ***stack frame*** (or ***activation record***) is pushed on top.

- It **shrinks** when the function terminates; storage is deallocated.

### Stack Frames

- For each function call, a ***stack frame*** stores local variables,
  parameters, and return linkage.

- The size and structure of a stack frame are ***known at compile
  time***, but its contents and time of allocation are unknown until
  runtime.

- How is variable lifetime affected by stack management techniques?

[Click here to step through this example
code.](https://pythontutor.com/render.html#code=int%20add%28int%20a,%20int%20b%29%0A%7B%0A%20%20return%20a%20%2B%20b%3B%0A%7D%0A%0Aint%20doubleAdd%28int%20a,%20int%20b%29%0A%7B%0A%20%20return%20add%28a,%20b%29%0A%20%20%20%20%2B%20add%28b,%20a%29%3B%0A%7D%0A%0Aint%20main%28%29%0A%7B%0A%20%20int%20total%20%3D%200%3B%0A%20%20total%20%3D%20add%281,%202%29%3B%0A%20%20total%20%3D%20doubleAdd%283,%204%29%3B%0A%0A%20%20return%200%3B%0A%7D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=cpp_g%2B%2B9.3.0&rawInputLstJSON=%5B%5D&textReferences=false)

``` cpp
int add(int a, int b)
{
  return a + b;  // <- 3
}

int doubleAdd(int a, int b)
{
  return add(a, b)
    + add(b, a);  // <- 2
}

int main()
{
  int total = 0;
  total = add(1, 2);
  total = doubleAdd(3, 4); // <- 1

  return 0;
}
```

|                    |                       |
|-------------------:|:----------------------|
|                    |                       |
|                    | `main()`              |
|                    | total $\rightarrow$ 0 |
|                    | `doubleAdd()`         |
|                    | int a $\rightarrow$ 3 |
|                    | int b $\rightarrow$ 4 |
|                    | `add()`               |
|                    | int a $\rightarrow$ 4 |
| $sp$ $\rightarrow$ | int b $\rightarrow$ 3 |
|                2-2 |                       |

### Stack Overflow

- The call stack and heap grow towards each other as required by program
  events.

- The following relation must hold:  
  $0 \le h \le a \le n$

- In other words, if the stack top bumps into the heap, or if the
  beginning of the heap is greater than the end, there are problems!

## The Heap

### Heap Memory

- Heap objects are *dynamically* allocated/deallocated at runtime (not
  associated with function call/return).

- Dynamic variables are created at runtime instead of at compile-time.

- The kind of data found on the heap is language dependant.

  - Typically holds strings, dynamic arrays, objects, and linked
    structures

  - Java and C/C++ have different policies.

### Heap Memory Example

[Click here to step through this example
code.](https://pythontutor.com/render.html#code=%23include%20%3Ciostream%3E%0A%0Aint%20main%28%29%0A%7B%0A%20%20const%20int%20SIZE%20%3D%203%3B%0A%20%20int%20stackArray%5BSIZE%5D%3B%20//%20Declared%20on%20the%20stack%0A%20%20int*%20heapArray%3B%20//%20Pointer%20to%20memory%20location%0A%20%20heapArray%20%3D%20new%20int%5BSIZE%5D%3B%20//%20Declare%20array%20on%20heap%0A%0A%20%20std%3A%3Acout%20%3C%3C%20%22stackArray%20%20%3D%20%22%20%3C%3C%20stackArray%20%3C%3C%20std%3A%3Aendl%3B%0A%20%20std%3A%3Acout%20%3C%3C%20%22heapArray%20%20%20%3D%20%22%20%3C%3C%20heapArray%20%3C%3C%20std%3A%3Aendl%3B%0A%20%20%0A%20%20stackArray%5B2%5D%20%3D%2020%3B%0A%20%20heapArray%5B2%5D%20%3D%2020%3B%0A%20%20%0A%20%20//%20Free%20up%20the%20memory%20from%20the%20heap%20array%0A%20%20delete%5B%5D%20heapArray%3B%0A%20%20heapArray%20%3D%20nullptr%3B%0A%0A%20%20return%200%3B%0A%7D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=cpp_g%2B%2B9.3.0&rawInputLstJSON=%5B%5D&textReferences=false)

``` cpp
##include <iostream>

int main()
{
  const int SIZE = 3;
  int stackArray[SIZE];      // Declared on the stack
  int *heapArray;            // Declare pointer to memory location
  heapArray = new int[SIZE]; // Declare array on heap

  std::cout << "stackArray  = " << stackArray << std::endl;
  std::cout << "heapArray   = " << heapArray << std::endl;

  stackArray[2] = 20;
  heapArray[2] = 20;

  delete[] heapArray; // Free up the memory from the heap array
  heapArray = nullptr; // Set pointer to point to address 0.

  return 0;
}
```

### Heap Memory

- The `new` operator allocates heap storage.

- The `delete` or `delete[]` operators deallocate heap storage for
  reuse.

- Space is allocated in variable-sized blocks, so deallocation may leave
  “holes” in the heap (fragmentation).

  - Compared to the deallocation of stack storage

### Heap Management

- Some languages (e.g., C, C++) leave heap storage deallocation to the
  programmer.

- Others (e.g., Java, Perl, Python, list-processing languages) employ
  *garbage collection* to reclaim unused heap space.

### Heap Management Functions

- `new` returns the start address of an unused block from the heap and
  changes its state from *unused* to *reserved* (and undefined).

- Suppose a Point class has three 4-byte data members: $x$, $y$, $z$.  

- `Point firstCoord = new Point();`  
  requires at least allocated $3 \times 4$ bytes.

### Heap Overflow

- A **heap overflow** occurs when calling `new` and the heap does not
  have a big enough block of free contiguous space.

- So, `new` either fails (in the case of heap overflow) or returns a
  pointer to the new block.

### Heap Management Functions

- `delete` returns a storage block to the heap.

- The status of the block returns to *unused* and is available for
  allocation by future calls to `new`.

- One cause of heap overflow is a failure on the part of the program to
  return unused storage.

## Pointers

- Pointers are addresses (i.e., the value of a pointer variable is an
  address).

- Memory that is accessed through a pointer is dynamically allocated in
  the heap.

- Java doesn’t have explicit pointers; reference types are heap
  allocated (although the reference is on the stack).

- This topic is covered well in the textbook’s Chapter 12.

### Memory Allocation Java vs C++

| Java |Stack Example | Heap Example |
|:---|:---|:---|
| Primitives | `int a = 3;` | `int[] a = new int[1];` |
| Classes | *Does not exist.* | `String str = new String("Hi!");` |
|  |  |  |
| **C++** | Stack Example | Heap Example |
| Primitives | `int a = 3;` | `int *a = new int;` |
| Classes | `string str("Hi!");` | `string *str = new string("Hi!");` |

### Examples in Code

In class, we will create and test out some more pointers.

### Java Versus C/C++ Arrays

- In Java, arrays are always allocated dynamically from heap memory.

- In many other languages, including C++:  

  |                              |                |
  |:-----------------------------|:---------------|
  | Globally defined arrays      | static memory. |
  | Local (to a function) arrays | stack storage. |
  | Dynamically allocated arrays | heap storage.  |

- Dynamically allocated arrays also have stack storage — a reference
  (pointer) to the heap block that holds the array.

### Comparing Pointers

    int i = 5, j = 5;
    int *ptrJ1 = &j;
    int *ptrJ2 = &j;
    int *ptrI = &i;

True/False:

- `if (ptrJ1 == ptrJ2) {}` → True
- `if (ptrJ1 == ptrI) {}` → False
- `if (&ptrJ1 == &ptrJ2) {}` → False
- `if (*ptrJ1 == *ptrI) {}` → True

[Click here to see the visualization for this
code.](https://pythontutor.com/visualize.html#code=%23include%20%3Ciostream%3E%0A%0Aint%20main%28%29%0A%7B%0A%20%20int%20i%20%3D%205,%20j%20%3D%205%3B%0A%20%20int%20*ptrJ1%20%3D%20%26j%3B%0A%20%20int%20*ptrJ2%20%3D%20%26j%3B%0A%20%20int%20*ptrI%20%3D%20%26i%3B%0A%20%20%0A%20%20if%20%28ptrJ1%20%3D%3D%20ptrJ2%29%20%7B%0A%20%20%20%20std%3A%3Acout%20%3C%3C%201%20%3C%3C%20'%20'%3B%0A%20%20%7D%0A%20%20if%20%28ptrJ1%20%3D%3D%20ptrI%29%20%7B%0A%20%20%20%20std%3A%3Acout%20%3C%3C%202%20%3C%3C%20'%20'%3B%0A%20%20%7D%0A%20%20if%20%28%26ptrJ1%20%3D%3D%20%26ptrJ2%29%20%7B%0A%20%20%20%20std%3A%3Acout%20%3C%3C%203%20%3C%3C%20'%20'%3B%0A%20%20%7D%0A%20%20if%20%28*ptrJ1%20%3D%3D%20*ptrI%29%20%7B%0A%20%20%20%20std%3A%3Acout%20%3C%3C%204%20%3C%3C%20'%20'%3B%0A%20%20%7D%0A%0A%20%20return%200%3B%0A%7D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=cpp_g%2B%2B9.3.0&rawInputLstJSON=%5B%5D&textReferences=false)

### Assigning a value to a *dereferenced* pointer.

A pointer must have a value before you can *dereference* it (follow the
pointer).  

```
int *x;
*x = 3;
```

Error! Override the value located in some unknown address.

```
int foo;
int *x;
x = &foo;
*x = 3;
```

This is fine. `x` points to `foo`.

### Pointers to Pointers

|                      |                |
|:---------------------|:---------------|
| `int *x = &num;`     | ![](/images/memory-management/pointer_int.svg){width="200px" .light-only} ![](/images/memory-management/pointer_int-dark.svg){width="200px" .dark-only} |
| `double *y;`         | ![](/images/memory-management/pointer_double.svg){width="250px" .light-only} ![](/images/memory-management/pointer_double-dark.svg){width="250px" .dark-only} |
| `int **z = &x;`      | ![](/images/memory-management/pointer_pointer_int.svg){width="300px" .light-only} ![](/images/memory-management/pointer_pointer_int-dark.svg){width="300px" .dark-only} |

An Example

```cpp
int num = 5;
int *pNum = &num;
int **ppNum = &pNum;
```

Then:

- `ppNum` stores the memory location of `pNum`.

- `*ppNum` stores the memory location of `num`.

- `**ppNum` equals `5`.

## Array Pointers

### Declaring Arrays

- Typical C/C++ array declarations.

    ```cpp
    int arr[5];               // stack
    double arr1[10][15];      // stack
    int *intPtr = new int[5]; // heap
    ```

- Typical Java array declarations:

    ```java
    int[] arr = new int[5];
    double[][] arr1 = new double [10][5];
    Object[] arr2 = new Object[100];
    ```

### Allocation of Stack and Heap Space for an Array

![](/images/memory-management/memory_allocation_heap_array.svg "Memory allocated on the stack and heap for `int *arr = new int[10];`"){width="500px" .light-only}

![](/images/memory-management/memory_allocation_heap_array-dark.svg "Memory allocated on the stack and heap for `int *arr = new int[10];`"){width="500px" .dark-only}

### Pointers and Arrays

- The identifier of an array on the stack is basically a  
  ***const pointer*** pointing at the beginning of the array.

- You can use the `[]` operator with pointers!

- Example: `int A[5];`  
  - Creates a memory block of 5 integers on the stack (5 × 4 bytes).
  - A (the pointer) points at the beginning of the array. `A` → `A[0]`. `(A == &A[0])`  
    ![Array of 5 elements.](/images/memory-management/array_of_5.svg){width=250px .light-only}
    ![Array of 5 elements.](/images/memory-management/array_of_5-dark.svg){width=250px .dark-only}

- Example:
    ```cpp
    int *x;
    int a[5] {-1, -2, -3, -4, -5};
    x = &a[2]; // x is the address of a[2]
    ```

    ![Pointer to 3 element in array.](/images/memory-management/array_pointer_1.svg){width=500px .light-only}
    ![Pointer to 3 element in array.](/images/memory-management/array_pointer_1-dark.svg){width=500px .dark-only}

    ```cpp:line-numbers=4
    for (int i = 0; i < 3; i++)
      x[i]++; // x[i] is the same as a[i+2]
    ```

    ![Pointer to 3 element in array.](/images/memory-management/array_pointer_2.svg){width=500px .light-only}
    ![Pointer to 3 element in array.](/images/memory-management/array_pointer_2-dark.svg){width=500px .dark-only}



### Pointer Arithmetic

- Integer arithmetic (`+`, `-`, `++`, `–`, `+=`, `-=`) works with
  pointers.

- Increment updates the address to the “next” element.
    ```cpp
    int a[5] {-1, -2, -3, -4, -5};
    int *ptr = a;
    ```

    ![Pointer Arithmetic Example with an Array.](/images/memory-management/pointer-arithmetic1.svg){width=500px .light-only}
    ![Pointer Arithmetic Example with an Array.](/images/memory-management/pointer-arithmetic1-dark.svg){width=500px .dark-only}

    ```cpp:line-numbers=3
    *(ptr + 3) = 400;
    ```

    ![Pointer Arithmetic Example with an Array.](/images/memory-management/pointer-arithmetic2.svg){width=500px .light-only}
    ![Pointer Arithmetic Example with an Array.](/images/memory-management/pointer-arithmetic2-dark.svg){width=500px .dark-only}

## Memory Errors

### Pointer Pitfalls

Assigning values to uninitialized, null, or deleted pointers:

```
int* p;
*p = 3;
```

```
int* p = nullptr;
*p = 4;
```

```
int* p = new int;
delete p;
*p = 5;
```

Using the above statements will result in a *segmentation fault* or
undefined behavior!

### Memory Leaks

Memory leak is when you remove the reference to the memory block, before
deleting the block itself.

Example:

```cpp
int *p;      // p points somewhere
p = new int; // p is an int value's address
p = nullptr; // p points to null.
```
- Result?

- **Memory Leek! (Orphan Blocks)**  
  Must free memory block before changing reference.

- A memory leak can diminish the performance of the computer by reducing
  the amount of available memory.

- Eventually, in the worst case, too much of the available memory may
  become allocated

- and all or part of the system or devices stops working correctly, the
  application fails, or the system slows down.

> [!TIP]
> Use Valgrind with `--leak-check=yes` option if your
> implementation has memory leaks.  
> Reference the [Valgrind User Manual](https://valgrind.org/docs/manual/manual.html), [The Valgrind
> Quick Start Guide](https://valgrind.org/docs/manual/quick-start.html),
> or a [Graphical User
> Interfaces](https://valgrind.org/downloads/guis.html).
> 
> \* This is why the `-g` flag is used when debugging!


### Problem: Multiple Pointers to the Same Address

- A second problem can occur when multiple pointers are assigned to a
  block of heap memory.

- The block may be deleted and one of the pointers set to *null*, but
  the other pointers still exist.

- If the runtime system reassigns the memory to another object, the
  original pointers pose a danger.

### Dangling Pointer: A pointer that points to an invalid location.

Example:

```cpp
int *p, *q;  // Create two pointers
p = new int; // Allocate an int on the heap.
q = p;       // Points to the same address.
*p = 4;      // Sets the on the heap to 4.
delete q;    // Frees the heap memory.
*p = 3;      // Illegal assignment!
```

- `p` and `q` point to the same location.

- When `q` is deleted, `p` becomes a dangling pointer!

## Garbage Collection

### Memory Leaks and Garbage Collection

The popularity of *object-oriented programming* has meant more emphasis
on heap storage management.  
Objects are considered active or inactive.

- ***Active*** objects: blocks *accessible* through a pointer or
  reference.

- ***Inactive*** objects: *inaccessible* blocks; no reference exists
  (also called (***orphans*** or ***garbage***).

The terms *accessible* and *inaccessible* may be more figurative than
objectively true.

### Garbage Collection

- All inaccessible blocks of storage are identified and returned to the
  free list.

- The heap may also be **compacted** at this time: allocated space is
  compressed into one end of the heap, leaving all free space in a large
  block at the other end.

- C & C++ leave it to the programmer — if an unused storage block isn’t
  explicitly freed by, it becomes garbage.

  - You can get C++ garbage collectors, but they aren’t standard.

- Java, Python, Perl, and other scripting languages perform garbage
  collection.

  - Python, etc. also have automatic allocation, so the “new” operator
    is not needed).

- Garbage collection was pioneered by languages like
  [Lisp](https://en.wikipedia.org/wiki/Lisp_(programming_language)),
  which constantly creates and destroys linked lists.

- C++ includes [smart
  pointers](https://en.cppreference.com/w/cpp/memory), enabling
  automatic object lifetime management.

## Review

- Three types of memory storage:
  - Static
  - Stack
  - Heap

- Problems with heap storage:

  - Memory leaks (garbage): failure to free storage when pointers
    (references) are reassigned.

  - Dangling pointers: when storage is freed, but references to the
    storage still exist.

### Allocation of Stack and Heap Space for an Array

![](/images/memory-management/memory_allocation_heap_array.svg "Memory allocated on the stack and heap for `int *arr = new int[10];`"){width="500px" .light-only}

![](/images/memory-management/memory_allocation_heap_array-dark.svg "Memory allocated on the stack and heap for `int *arr = new int[10];`"){width="500px" .dark-only}

### Garbage

- ***Garbage***: any block of heap memory that cannot be accessed by the
  program (i.e., there is no stack pointer to the block) but in which
  the runtime system thinks is in use.

- Garbage is created in several ways:

  - A function ends without returning the space allocated to a local
    array or other dynamic variable. The pointer is gone.

  - A node is deleted from a linked data structure, but isn’t freed.

  - …

### Terminology

- A **dangling pointer** (or dangling reference, or widow) is a pointer
  (reference) that contains the address of previously deallocated/freed
  heap space.

- An **orphan (or garbage)** is a block of allocated heap memory that is
  no longer accessible through any pointer.

- A **memory leak** is a gradual loss of available memory due to the
  creation of garbage.

## Lab 3: Pointers

Complete Lab 3 on Blackboard.
