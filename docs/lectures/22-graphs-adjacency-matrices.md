Graphs via Adjacency Matrices
=============================

Chapter 20

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/SKmRkxxduEY?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>



<script setup>
import dijkstra_shortest_path_diagram from '/images/graphs/dijkstra_shortest_path_example.svg'
</script>

## Intro

### Königsberg Bridge Problem

The river Pregel flows around the island of Kneiphof and then divides into two branches.

![Euler's first figure of the seven bridges of Königsberg problem from ‘Solutio problematis ad geometriam situs pertinentis.’](/images/graphs/Konigsberg-Euler.png "Euler's first figure of the seven bridges of Königsberg problem from ‘*Solutio problematis ad geometriam situs pertinentis*.’"){.light-only}

![Euler's first figure of the seven bridges of Königsberg problem from ‘Solutio problematis ad geometriam situs pertinentis.’](/images/graphs/Konigsberg-Euler-dark.png "Euler's first figure of the seven bridges of Königsberg problem from ‘*Solutio problematis ad geometriam situs pertinentis*.’"){.dark-only}

Starting at one land area, can you cross all 7 bridges exactly once and
return to the start?

In 1736, Euler invented graph theory by representing this problem as a
graph to solve the problem.

Euler determined that only 0 or 2 vertices (lands) can have an odd
number of edges (bridges). All 4 lands have an odd number of bridges, so
there is no solution.

### Graph Theory

Over the past 250 years, graph theory has been applied to a variety of problems, including:

- modeling and analysis of electrical circuits,

- chemical compounds,

- highway maps,

- finding the shortest route,

- project planning,

- linguistics,

- genetics,

- social science,

- etc.

## Set Theory Notation

- ***Member*** ($x \in A$): $x$ is an element of the set $X$.

- ***Subset*** ($A \subseteq B$): every element of $A$ that is an element of
  $B$.

- ***Intersection*** ($A \cap B$): contains all the elements in $A$ and
  $B$.  
  $A \cap B = \{x \mid x \in A$ and $x \in B\}$

- ***Union*** ($A \cup B$): set of all the elements that are in $A$ or
  in $B$.  
  $A \cup B = \{x \mid x \in A$ or $x \in B\}$

- ***Ordered Pairs*** ($A \times B$): set of all the ordered pairs of
  elements of $A$ and $B$.  
  $A \times B = \{(a, b) \mid a \in A, b \in B\}$

### Graph Definitions and Notations

***Graph*** $G \mid G = (V, E)$

- $V$ is a finite nonempty set of ***vertices*** of $G$.

- $E \subseteq V \times V$.  
  Elements in $E$ are the pairs of elements of $V$.  
  $E$ is the set of ***edges***.

### Directed Graphs

***Directed graph*** or ***digraph***: elements of $E(G)$ are ordered
pairs.

- Pairs ($u$, $v$) and ($v$, $u$) represent different edges.

<figure>

</figure>

<figure>

</figure>

### Undirected Graphs

- ***Undirected graph***: elements are not ordered pairs.

  - Pairs ($u$, $v$) and ($v$, $u$) represent the same edge.


### Graph Definitions and Notations

- ***Subgraph*** $H$ of $G$: if $V(H) \subseteq V(G)$ and
  $E(H) \subseteq E(G)$.

  - Every vertex and edge of $H$ is in $G$.

- ***Adjacent***: there is an edge from one vertex to the other; i.e.,
  $(u, v) \in E(G)$

- ***Loop***: edge to and from a single vertex, $e = (u, u)$

- ***Parallel edges***: associated with the same pair of vertices.

- ***Simple graph***: has no loops or parallel edges

- ***Connected vertices***: there is a path from $u$ to $v$.

- ***Path*** from $u$ to $v$ is if there is sequence of vertices
  $u_1, u_2, \ldots, u_n$ such that $u = u_1$, $u_n = v$, and
  $(u_i, u_i + 1)$ is an edge for all $i = 1, 2, \ldots, n - 1$.

- ***Simple path***: path in which all vertices, except possibly the
  first and last, are distinct.

- ***Cycle***: simple path in which the first and last vertices are the
  same.

- ***Connected***: paths exist from each vertex to all other vertices.

- If there is an edge from $u$ to $v$ (i.e., $(u, v) \in E(G)$), then
  $u$ is ***adjacent to*** $v$ and $v$ is ***adjacent from*** $u$.

- ***Strongly connected***: any two vertices in $G$ are connected.


### Graph Data Structures

To process and manipulate graphs, we must store graphs in computer memory.

A graph is commonly represented in one of two ways:

1.  Adjacency matrices

2.  Adjacency lists

## Adjacency Matrices

Given a graph, $G$, with $n$ vertices $(n > 0)$,  
$$V(G) = \{v_1, v_2, \ldots v_n\}$$

the ***adjacency matrix***, $A_G$ of $G$, is $n \times n$ matrix such
that  
$$\begin{aligned}
A_G(i, j) =
  \begin{cases}
	1 & \mathrm{if} (v_i, v_j) \in E(G) \\
	0 & \mathrm{otherwise}
  \end{cases}
\end{aligned}$$

### Undirected Example

![](/images/graphs/graph_for_matrix_undirected-dark.svg){.dark-only}

![](/images/graphs/graph_for_matrix_undirected.svg){.light-only}

|  | `[0]` | `[1]` | `[2]` | `[3]` | `[4]` |
|---:|:--:|:--:|:--:|:--:|:--:|
| `[0]` | `0` | **`1`** | **`1`** | `0` | `0` |
| `[1]` | **`1`** | `0` | **`1`** | **`1`** | **`1`** |
| `[2]` | **`1`** | **`1`** | `0` | **`1`** | **`1`** |
| `[3]` | `0` | **`1`** | **`1`** | **`1`** | `0` |
| `[4]` | `0` | **`1`** | **`1`** | `0` | `0` |

The adjacency matrix of an undirected graph is symmetric.

### Adjacency Matrix: Directed Example

![](/images/graphs/graph_for_matrix_directed-dark.svg){.dark-only}

![](/images/graphs/graph_for_matrix_directed.svg){.light-only}

|  | `[0]` | `[1]` | `[2]` | `[3]` | `[4]` |
|---:|:--:|:--:|:--:|:--:|:--:|
| `[0]` | `0` | **`1`** | **`1`** | `0` | `0` |
| `[1]` | `0` | `0` | **`1`** | **`1`** | **`1`** |
| `[2]` | **`1`** | `0` | `0` | **`1`** | **`1`** |
| `[3]` | `0` | `0` | `0` | **`1`** | `0` |
| `[4]` | `0` | `0` | `0` | `0` | `0` |

The adjacency matrix of a directed graph is asymmetric.

### Adjacency Matrix: Weighted Directed Example

![](/images/graphs/graph_for_matrix_weighted-dark.svg){.dark-only}

![](/images/graphs/graph_for_matrix_weighted.svg){.light-only}

|  | `[0]` | `[1]` | `[2]` | `[3]` | `[4]` |
|---:|:--:|:--:|:--:|:--:|:--:|
| `[0]` | $\infty$ | **`10`** | **`1`** | $\infty$ | $\infty$ |
| `[1]` | $\infty$ | $\infty$ | **`2`** | **`4`** | **`1`** |
| `[2]` | **`3`** | $\infty$ | $\infty$ | **`1`** | **`5`** |
| `[3]` | $\infty$ | $\infty$ | $\infty$ | **`6`** | $\infty$ |
| `[4]` | $\infty$ | $\infty$ | $\infty$ | $\infty$ | $\infty$ |

If the edges have weights, they are stored in the matrix.

## Operations Commonly Performed on a Graph

- Create the graph.

- Clear the graph (make the graph empty).

- Determine whether the graph is empty.

- Traverse the graph.

- Visualize the graph.

- Modify the graph.

## Graph Traversals

- Traversing a graph is like traversing a binary tree,  
  except that:

  - A graph may have cycles.

  - May not be able to traverse the entire graph from a single vertex.

- Most common graph traversal algorithms

  - Depth-first traversal

  - Breadth-first traversal

### Depth-First Traversal

Recursive depth-first traversal algorithm at a given node, $v$.

1.  Mark node $v$ as visited.

2.  Visit the node.

3.  For each vertex $u$ adjacent to $v$,  
	If $u$ is not visited,  
	begin the depth-first traversal at $u$.

### Depth-First Traversal: Example

Depth-first ordering of vertices (starting at `0`):  
` 0, 1, 4, 3, 2, 5, 7, 8 `  

### Breadth-First Traversal of a Graph

- Like traversing a binary tree, level by level.

- Nodes at each level are visited one after another.

- Use a queue to implement the breadth-first search algorithm.

### Breadth-First Traversal: Example

<figure>

</figure>

Breadth-first ordering of vertices (starting at `0`):  
` 0, 1, 3, 4, 2, 5, 7, 8 `  

## Shortest Path in a Weighted Graph

In a ***weighted graph***, every edge has a nonnegative weight.

- The ***weight of the path***, $P$, is the sum of the weights of all
  edges on the path $P$.

- The ***source*** is the first vertex of a path.

- The ***shortest path*** is the path with the smallest weight.

<figure>

</figure>

### Shortest Path Algorithm

We will implement the ***greedy algorithm***, developed by Dijkstra.

1.  Initialize an array, `smallestWeight`, all infinity and  
	`weightFound` to `false`.

2.  Set `smallestWeight[start]` to `0` and  
	`currentVertex` to `start`.

3.  Find the vertex, `v`, that is closest to the `currentVertex` for
	which the shortest path has not been determined.

4.  Mark `v` as the (next) vertex for which the smallest weight is
	found.

5.  For each vertex `w` in `G`, such that the shortest path from `start`
	to `w` has not been determined and an edge (`v`, `w`) exists, if the
	weight of the path to `w` via `v` is smaller than the current
	weight, update the weight of `w` to the weight of `v` plus the
	weight of the edge (`v`, `w`).

Given $n$ vertices, repeat steps 3 through 5, $n - 1$ times.

### Shortest Path Algorithm: Example

<ProgressiveDiagram :src="dijkstra_shortest_path_diagram" />

### Shortest Path Algorithm: Enhancements

This demonstrated algorithm keeps track of the total weight of the
shortest path. Consider what you would add to record the actual path.

Instead of using a sequence search to find the minimum weight, which is
$O(n)$, a priority queue could be used.

## Lab 22: Graphs via Adjacency Matrix

Let’s look at the lab based on today’s lecture.
