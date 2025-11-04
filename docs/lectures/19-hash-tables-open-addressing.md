Project 3 and Hash Tables with Open Addressing
==============================================

Chapter 5 of [Open Data Structures](https://opendatastructures.org/ods-cpp.pdf)

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/E1b-ZWzrChI?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>


## Review

### Maps/Dictionary

Map (dictionary) is a relation between a set of keys  
and set of values.

![Mapping keys to values](/images/hash-tables/maping-keys-values.svg "Mapping keys to values"){.light-only style="max-width: 430px"}

![Mapping keys to values](/images/hash-tables/maping-keys-values-dark.svg "Mapping keys to values"){.dark-only style="max-width: 430px"}

### Implementing Dynamic Maps/Dictionaries

- We want a data structure in which finds/searches are very fast.

  - As close to $O(1)$ as possible.

  - With the minimum number of executed instructions per method.

- Insert and Deletes should be fast too.

- Objects in a map have unique keys. A key may be:

  - A single property/attribute value, or

  - Created from multiple properties/values.

### A Conceptual View of Hash Tables

![A Conceptual View of Hash Tables](/images/hash-tables/conceptual-view.svg "A Conceptual View of Hash Tables"){.light-only}

![A Conceptual View of Hash Tables](/images/hash-tables/conceptual-view-dark.svg "A Conceptual View of Hash Tables"){.dark-only}

### Generating Hash Codes

- Note that the key may not be an integer that can neatly be used for
  hashing.  
  For example,

  - Floating-point numbers: (e.g., `3.14159`, `23543.43`, `3.997E-8`)

  - String values: (e.g., `"Alice"`, `"Dear diary"`, `":-)"`)

  - Objects of custom classes.

- We need to make a hash-code function for each type we want to use as a
  key in our hash table.

### Dealing with Collisions

A problem arises when we have two keys that hash in the same array entry
— this is called a ***collision***.

There are two ways to resolve collision:

- ***Hashing with Chaining*** (a.k.a., “Separate Chaining”):  
  Every hash-table entry contains a pointer to a linked list of keys
  that hash in the same entry.

- ***Hashing with Open Addressing***:  
  Every hash-table entry contains only one key. If a new key hashes to a
  filled table entry, systematically examine other table entries until
  you find one empty entry to place the new key.

## Hash Tables with Open Addressing

Insert where the key is  

- So far, we have studied hashing with chaining, using a list to store
  the items that hash to the same location.

- Another option is to store all the items (references to single items)
  directly in the table.

- ***Open addressing***  
  Collisions are resolved by systematically examining other table
  indexes, $i_0 , i_1 , i_2 , \ldots$ until an empty slot is located.

## Linear Probing


1.  The key is first mapped to an array cell using the hash function
	(e.g., `hashCode(key) % ARRAY_SIZE`).

2.  If there is a collision, find an available array cell.  

Choose the next available array cell.

- First try `arrayIndex = hash value + 1;`

- Then try `arrayIndex = hash value + 2;`

- Be sure to wrap around the end of the array!  
  `arrayIndex = (arrayIndex + 1) % ARRAY_SIZE;`

- Stop when you have tried all possible array indices.

If the array is full, you need to throw an exception or, better yet,
resize the array.

### Linear Probing: Limitations

- As collisions occur, ***clusters*** of occupied positions  
  form and grow.

- A collision will use up the hash position for other keys, leading more
  collisions and clustering.

- To reduce clustering, we can probe for keys in non-linearly using
  ***quadratic probing*** or ***double hashing***.

- Such design changes are easy made by updating our single hash
  function.

## Quadratic Probing

Variation of linear probing that uses a more complex function to
calculate the next cell to try.

## Double Hashing

- Apply a second hash function after the first.

- The second hash function depends on the key, like the first, but is
  used as an offset for the next place to check.

- A secondary hash function must:

  - Differ from the first and

  - Not generate an offset of zero (obviously).

- Prime numbers are often used in the hashing functions to make them
  different.

A good simple algorithm:

```
unsigned int hash1(const Type &key){
  return hashCode(key) % TABLE_SIZE;
}
```

```
unsigned int hash2(const Type &key){ // prime is < TABLE_SIZE
  return PRIME_CONST - (hashCode(key) % PRIME_CONST); // never 0
}
```

```
bool insert(const Type &key) {
  if(isFull) return false;
  unsigned int probeIndex = hash1(value);
  const unsigned int OFFSET = hash2(value);
  while (array[probeIndex] != nullptr)
	probeIndex = (probeIndex + OFFSET) % TABLE_SIZE;
  // To Do: Add value at probeIndex
  return true;
}
```

## Load Factor

- The ***load factor*** is the proportion of the  
  hashed item count to the table size.

- The expected load factor will is needed to determine the hash table
  and hash functions’ efficiency.

- For Open Addressing:

  - If \< 0.5, wasting space

  - If \> 0.8, overflows are significant.

- For Chaining:

  - If \< 1.0, there is wasted space.

  - If \> 2.0, then search time to find a specific item may factor in
	significantly to the \[relative\] performance.

![Probes in Successful Search](/images/hash-tables/probes_by_load_factor.svg "Probes in Successful Search"){.light-only style="max-width:600px"}

![Probes in Successful Search](/images/hash-tables/probes_by_load_factor-dark.svg "Probes in Successful Search"){.dark-only style="max-width:600px"}

![Probes in Unsuccessful Search](/images/hash-tables/probes_unsuccessful_by_load_factor.svg "Probes in Unsuccessful Search"){.light-only style="max-width:600px"}

![Probes in Unsuccessful Search](/images/hash-tables/probes_unsuccessful_by_load_factor-dark.svg "Probes in Unsuccessful Search"){.dark-only style="max-width:600px"}

### CPU Cache Misses Required for Look-Up

In large hash tables that far exceed the CPU cache size, linear probing
performs better due to better locality of reference. However, linear
probing performs poorly as the table gets full.

![CPU Cache Misses Required for Look-Up](/images/hash-tables/probes_cache_misses.svg "CPU Cache Misses Required for Look-Up"){.light-only style="max-width:400px"}

![CPU Cache Misses Required for Look-Up](/images/hash-tables/probes_cache_misses-dark.svg "CPU Cache Misses Required for Look-Up"){.dark-only style="max-width:400px"}

## Deletion in Open Addressing

## Open Addressing vs.Separate Chaining

- When should you be concerned about Open Addressing and Separate
  Chaining implementations?

- When implementing a hash table, consider:

  - Do you know the number of items to be inserted into the table?

  - Do you have plenty of memory?

  - Do you know the expected load factor?

## Hash Tables in the STL

|  | **No duplicates** | **Duplicates** |
|---:|:---|:---|
| **Key-Only** | [std::unordered_set](https://en.cppreference.com/w/cpp/container/unordered_set) | [std::unordered_multiset](https://en.cppreference.com/w/cpp/container/unordered_multiset) |
| **Key-Value Pair** | [std::unordered_map](https://en.cppreference.com/w/cpp/container/unordered_map) | [std::unordered_multimap](https://en.cppreference.com/w/cpp/container/unordered_multimap) |

[`std::hash`](https://en.cppreference.com/w/cpp/utility/hash) is defines
the default hash functions as function objects.

\* You may not use these containers for labs 18 and 19.

# Lab 19: Hash Tables with Open Addressing

Let’s take a look at the lab based on today’s lecture.
