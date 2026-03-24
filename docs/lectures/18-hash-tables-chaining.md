Hash Tables with Chaining
=========================

Chapter 5 of [Open Data Structures](https://opendatastructures.org/ods-cpp.pdf)

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/meHnhwiudkg?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Intro

### Maps/Dictionary

Map (dictionary) is a relation between a set of keys  
and set of values.

![Mapping keys to values](/images/hash-tables/maping-keys-values.svg "Mapping keys to values"){.light-only style="max-width: 430px"}

![Mapping keys to values](/images/hash-tables/maping-keys-values-dark.svg "Mapping keys to values"){.dark-only style="max-width: 430px"}

### Implementing Dynamic Maps/Dictionaries

- We want a data structure in which finds/searches  
  are very fast.

  - As close to $O(1)$ as possible.

  - With the minimum number of executed instructions per method.

- Insert and Deletes should be fast too.

- Objects in a map have unique keys. A key may be:

  - A single property/attribute value, or

  - Created from multiple properties/values.

We want to implement the map operations:  
Insert, Delete, and Search/Find efficiently.

- ***Arrays***:

  - accomplished in $O(1)$ time for integer keys of a known range.

  - but are not space efficient (assumes we leave empty space for keys
	not currently in the map).

- ***Binary search trees***:

  - can accomplish in $O(\log n)$ time

  - are space efficient.

- ***Hash Tables***:

  - A generalization of an array that under some reasonable assumptions
	is $O(1)$ for Insert/Delete/Search of a key.

### Array Approach — Example

An application stores information about US citizens where  
the search key is their social security numbers (SSN).

- You can use an array to hold references to all persons.

  - Use an array with range 0 – 999,999,999

  - Using the SSN as a key, you have $O(1)$ access to any person.

- Unfortunately, there are much fewer active keys (Social Security
  Numbers) than the array size (1 billion entries).

  - Approximately ***450 million*** SSNs have been issued since 1936.  
	(net gain of 1 person every 22 seconds).

  - For that many social security numbers, 55% of the array would be
	unused.

- Very useful data structure.

  - Good for storing and retrieving key-value pairs.

  - Not good for iterating through a list of items.

- Example application:  
  Storing objects according to ID numbers.

  - When the ID numbers are widely spread out.

  - When you don’t need to access items in ID order.

![A Conceptual View of Hash Tables](/images/hash-tables/conceptual-view.svg "A Conceptual View of Hash Tables"){.light-only}

![A Conceptual View of Hash Tables](/images/hash-tables/conceptual-view-dark.svg "A Conceptual View of Hash Tables"){.dark-only}


### Hash Tables

- Hash Tables solve these problems by using a much smaller array and
  mapping keys with a hash function.

- Let universe of keys $U$ and an array of size $m$. A hash function h
  is a function from $U$ to $0\ldots{}m$, that is:  
  $h : U \to 0\ldots{}m$

## Hash Index/Value

- A hash value or hash index is used to index the hash table (array).

- A hash function takes a key and returns a hash value/index.

  - The hash index is an integer (to index an array).

- The key is a value associated with a specific object being stored in
  the hash table.

  - The key must remain constant for the lifetime of the object.

### Generating Hash Codes

- A key may not be an integer to directly used for  
  hashing.  
  For example,

  - Floating-point numbers: (e.g., 3.14159, 23543.43, 3.997E-8)

  - String values: (e.g., `"Alice"`, `"Dear diary"`, `":-)"`)

  - Objects of custom classes.

- In Java, every object has a `hashCode()` method to return a hash code.

  - A series of shifts, adds, and xors is performed on the key to
	produce pseudo-random numbers.

- Likewise, we need to make a hash-code function for each type we want
  to use as a key in our hash table.

### Hash Functions & `insert()`

- Usage summary:  

  ```
  unsigned int hashCode (int key);
  unsigned int hashCode (const std::string& key);
  unsigned int hashCode (const ItemType& item);

  template <typename Type>
  unsigned int indexFor (const Type &key) {
	return hashCode(key) % TABLE_SIZE; // example
  };
  ```

- An insert method:

  ```
  void insert (int key, itemType item) {
	const unsigned int HASH_VAL = indexFor(key);
	table[HASH_VAL] = item; // Incomplete
  }
  ```

### The Mod (i.e., Modulo) Operator

- The modulo is the remainder after integer division.

- The modulo is the remainder.  
  $$\begin{aligned}
  8 \bmod{5} &= 3\\
  9 \bmod{5} &= 4\\
  10 \bmod{5} &= 0\\
  15 \bmod{5} &= 0
  \end{aligned}$$

- For keys $\bmod{M}$, multiples of $M$ give the same result, $0$.

  - But multiples of other numbers do not give the same result.

  - What if $M$ is a prime number such that the keys are rarely
	multiples of $M$?

### Hash Tables: Insert Example

For example, if we hash keys $0\ldots{}1000$ into a hash table  
with $5$ entries and use $h (key) = key \bmod 5$, we get the following
sequence of events.

### Reducing Collisions

Ideally, `hash(key)` has two properties:

1.  Consistent: if `x == y`, then `hash(x) == hash(y)`

2.  No Collisions: if `x != y`, then `hash(x) != hash(y)`

### Choosing a Hash Function

- Many programming languages (including Java) have built-in hash
  functions.

- The performance of the hash table depends on having a hash function
  that evenly distributes the keys.  
  Uniform hashing is the ideal target.

- Choosing a good hash function requires accounting for the kind of data
  that will be used.

- One must account for the statistical distribution of keys.

  - For example, choosing the first letter of a last name will likely
	cause lots of collisions depending on the nationality of the
	population.

![Distribution of the people’s surname initial letter according to the 2010 US Census.](/images/hash-tables/first-letter-of-last-name-distribution.svg "Distribution of the people’s surname initial letter according to the 2010 US Census."){.light-only}


![Distribution of the people’s surname initial letter according to the 2010 US Census.](/images/hash-tables/first-letter-of-last-name-distribution-dark.svg "Distribution of the people’s surname initial letter according to the 2010 US Census."){.dark-only}

### Choosing a Hash Function

Some hashing methods that convert a hash code, $f(v)$,  
into an array index:

- Division/Modulo Method:

  - Given: $m$ is the array size, which usually should be ***prime
	number***.  

  - $h(v) = f(v) \bmod{}m$

- Multiplicative Method:

  - Given, $m$ is the array size (usually a power of 2).  
	$p$ is a arbitrary ***prime***, greater than $m$ (often
	$2^{31} - 1$)  
	$a$ and $b$ are random positive integers that are less than $m$.  

  - $h(v) = \left(\left(a \cdot f(v) + b\right) \bmod{} p\right) \bmod{} m$

### Prime Number Distribution

For example, assume:

- Key values, $v$, are multiples of $5$ from $5$ to $245$.  
  (5$, 10, 15, 20, 25, \ldots, 245$).

- The array size (and divisor), $m$, is $7$.

- Then, the hash values will be evenly distributed from $0$ to $6$ for
  the keys.

- If $m$ was $5$, then you would have what kind of distribution?

| $v \bmod{} m$ | Total |
|:-------------:|:-----:|
|       0       |   7   |
|       1       |   7   |
|       2       |   7   |
|       3       |   7   |
|       4       |   7   |
|       5       |   7   |
|       6       |   7   |
|               |       |
|  Grand Total  |  49   |

### Choosing Hash Function

- If the keys are non-random (e.g., part numbers),  
  do the following for better distributions:

  - Use all unique data to contribute to the hash function.

  - Consider folding — sum the natural (or arbitrary) groups of digits
	in the key.

  - Exclude redundant or non-data (e.g., checksum values).

  - Exclude information that may change!

- Analyze your expected key values (or some representative subset) to
  ensure your hash function gives a good distribution!

### Dealing with Collisions

A problem arises when we have two keys that hash in the same array entry
— this is called a ***collision***.

Two ways to resolve collision are:

- ***Hashing with Chaining*** (a.k.a., “Separate Chaining”):  
  Every hash-table entry contains a pointer to a linked list of keys
  that hash in the same entry.

- ***Hashing with Open Addressing***:  
  Every hash-table entry contains only one key. If a new key hashes to a
  filled table entry, systematically examine other table entries until
  an empty entry is found for the new key.

## Hashing with Chaining

**Problem**: Collisions (e.g., the keys 34 and 54 both hash to 4 for a table with 5 buckets).

**Solution**: Place keys that hash in the same hash-table
entry in the same ***chain*** (linked list) or ***bucket*** (array).

![Example hash table implemented via chaining.](/images/hash-tables/chaining.svg "Example hash table implemented via chaining."){.light-only}

![Example hash table implemented via chaining.](/images/hash-tables/chaining-dark.svg "Example hash table implemented via chaining."){.dark-only}

## Performance of Hashing with Chaining

Running-time performance for hash tables with chaining

- Insert: It takes $O(1)$ time to compute the hash function and insert
  at the head of the linked list.

- Search: It is proportional to max length of the linked lists.

- Delete: Same as search.

Therefore, in the unfortunate event that we have a “bad” hash function
all $n$ keys may hash in the same table entry giving an $O(n)$ run-time!

So, we must create a “good” hash function.

## Lab 18: Hash Tables with Chaining

Let’s take a look at the lab based on today’s lecture.
