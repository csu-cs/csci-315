Operator Overloading and Templates
==================================

Chapter 13


Learning Outcomes
-----------------

After completing this lecture and the related lab, students will be able to:

1. Explain the purpose and limitations of operator overloading, including which operators can be overloaded, restrictions on precedence/associativity, and why it is useful for user-defined types.

2. Differentiate between member and nonmember (`friend`) operator overloads.

3. Implement common binary operators, assignment (`=`), stream insertion/extraction (`<<`, `>>`), and array indexing (`[]`).

4. Implement unary operators (pre/post increment and decrement) and explain how return types differ between mutable and const contexts.

5. Utilize the `this` pointer within member functions.

## Lecture Video

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/qlVwTIffeuk?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Why Operator Overloading Is Needed

Consider the following statements:

```cpp
ClockType local{8, 23, 34};
ClockType yourTime{4, 23, 30};
```

Which version of the C++ statements below would you prefer?

::: code-group

```C++ [Methods]
local.print();
local.incrementSeconds();
if (local.equal(yourTime))
// ...
```

```C++ [Operators]
cout << local;
local++;
if (local == yourTime)
// ...
```

:::

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

## Syntax for Operator Functions

- Syntax of an operator function heading:  
  `returnType operator symbol(formal parameter list)`

  - It is a value-returning function.

  - `operator` is a reserved word.

- To overload an operator for a class:

  - Include the operator function declaration in the class definition.

  - Write the definition of the operator function.

## Friend Functions of Classes

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

## Definition of a Friend Function

- `friend` does not appear in the heading of the function’s definition.

- When writing the `friend` function’s definition.

- The name of the class and the scope resolution operator are not used.

  ```
  void two(/*parameters*/)
  {
      // ...
  }
  ```

## Operator Functions as Member and Nonmember Functions

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
  `Type& operator[](unsigned int index);`

- Declaring the `[]` operator as a class member for constant arrays:  
  `const Type& operator[](unsigned int index) const;`

```C++
int array[5] { 1, 2, 3, 4, 5 };
const int ARRAY[5] { 1, 2, 3, 4, 5 };

std::cout << array[2];
std::cout << ARRAY[2]; // Const operator[]

array[2] = 10;    // Non-const operator[]
// ARRAY[2] = 10; // Error
```

## Unary Operators

- To overload a unary operator for a class:

  - If the operator function is a member of the class, it has no
    parameters.

  - If the operator function is a nonmember (i.e., a `friend` function),
    it has one parameter.

### Pre-Increment (`++`) and Pre-Decrement (`--`)

The general syntax to overload the pre-increment operator `++` as a
member function.

```cpp
Type operator++()
{
    // Increment the value of the object by 1
    return *this; //return the new value
}
```

### Post-Increment (`++`) and Post-Decrement (`--`)

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

Post-Increment (`++`) and Post-Decrement (`--`) The general syntax to
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

## Some Restrictions

- Cannot change the precedence of an operator.

- Associativity cannot be changed.

- Default parameters cannot be used.

- Cannot change number of parameters.

- Cannot create new operators.

- Cannot overload: `.`  `.*`  `::`  `?:`  `sizeof`

- Operators on built-in types cannot be redefined.

- Can overload for user-defined objects or for a combination of
  user-defined and built-in objects.


## Quick Review

- ***Overloaded*** operator – an operator that has different meanings
  with different data types.

- Operator function – a function that overloads an operator.

- Operator functions are value-returning.

- Operator overloading provides the same concise notation for
  user-defined data types as for built-in data types.

- Only existing operators can be overloaded.

- The `this` pointer refers to the object.