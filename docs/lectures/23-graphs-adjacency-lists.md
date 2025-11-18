Graphs via Adjacency Lists
==========================

Chapter 20

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/fzfo-tmQTWI?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import prims_mst_diagram from '/images/graphs/prims_mst_example.svg'
</script>

## Review

### Graph Data Structures

To process and manipulate graphs, we must store  
graphs in computer memory.

A graph is commonly represented in one of two ways:

1.  Adjacency matrices

2.  Adjacency lists

### Adjacency Matrix: Weighted Directed Example

![A weighted directed graph and it's representation using adjacency matrix.](/images/graphs/adjacency_matrix.svg "A weighted directed graph and it's representation using adjacency matrix."){.light-only}

![A weighted directed graph and it's representation using adjacency matrix.](/images/graphs/adjacency_matrix-dark.svg "A weighted directed graph and it's representation using adjacency matrix."){.dark-only}

If the edges have weights, they are stored in the matrix.

### Limitations of Adjacency Matrices

1.  Wasted space, $O(n^2)$. It stores a weight for an edge  
    from every vertex to every other vertex.  
    Most graphs are sparse.

2.  Slow iteration over edges.

3.  Slow add/delete of vertices.

4.  ***Cannot represent parallel edges.***

## Adjacency Lists

Implemented using a vector of lists. Each node of a list represents an
edge (destination and edge pair).

![A graph and it's representation using adjacency lists.](/images/graphs/adjacency_lists.svg "A graph and it's representation using adjacency lists."){.light-only}

![A graph and it's representation using adjacency lists.](/images/graphs/adjacency_lists-dark.svg "A graph and it's representation using adjacency lists."){.dark-only}


## Minimal Spanning Trees

A ***Spanning Tree*** is a subset of the edges in the graph that
connects all vertices without creating any cycles.

A ***Minimum Spanning Tree*** is a spanning tree that minimizes the
total edge cost.

A graph has a spanning tree if and only if it is connected.

### Spanning Tree: Examples

Suppose an airline’s connections are represented by the following graph.
The edge weights are the costs. How can the airline minimize costs while
still being able to fly to every city?

![Example graph to find a spanning tree of.](/images/graphs/spanning_tree_0.svg "Example graph to find a spanning tree of."){.light-only}

![Example graph to find a spanning tree of.](/images/graphs/spanning_tree_0-dark.svg "Example graph to find a spanning tree of."){.dark-only}

![Example spanning tree of a graph with cost $6 + 2 + 5 + 5 + 8 + 7 = 33$.](/images/graphs/spanning_tree_1.svg "Example spanning tree of a graph with cost $6 + 2 + 5 + 5 + 8 + 7 = 33$."){.light-only}

![Example spanning tree of a graph with cost $6 + 2 + 5 + 5 + 8 + 7 = 33$.](/images/graphs/spanning_tree_1-dark.svg "Example spanning tree of a graph with cost $6 + 2 + 5 + 5 + 8 + 7 = 33$."){.dark-only}

![Example spanning tree of a graph with cost $4 + 2 + 5 + 5 + 2 + 10 = 28$.](/images/graphs/spanning_tree_2.svg "Example spanning tree of a graph with cost $4 + 2 + 5 + 5 + 2 + 10 = 28$."){.light-only}

![Example spanning tree of a graph with cost $4 + 2 + 5 + 5 + 2 + 10 = 28$.](/images/graphs/spanning_tree_2-dark.svg "Example spanning tree of a graph with cost $4 + 2 + 5 + 5 + 2 + 10 = 28$."){.dark-only}

The minimal spanning tree for the above graph is $25$. See if you can manually identify which edges it would include ($4 + 2 + 5 + 5 + 2 + 7 = 25$).

### Minimal Spanning Tree Algorithms

Well-known algorithms to find a minimal spanning tree  
of an ***undirected*** and ***connected*** graph.

- Kruskal’s algorithm (published 1956)

- Prim’s algorithm (rediscovered in 1957)

  - Builds the tree iteratively by adding edges until a minimal spanning
    tree is obtained.

  - Start with a designated vertex, called the source vertex.

  - At each iteration, a new edge that does not complete a cycle is
    added to the tree.

### Prim’s Minimal Spanning Tree Algorithm

<ProgressiveDiagram :src="prims_mst_diagram" />

### Prim’s Algorithm: Pseudo Code

Local Variables in `prims()`:

- `EDGES_IN_MST`: the vertex count.

- ***Priority*** Queue of Edges (initially empty). The Edge type
  contains from and to vertices and the weight.

- `wasVisited``[Node Count]`: set to all `false`.

- `totalCost = 0`

- `edgeCount = 0`

- List of Edges in MST (initially empty).

```C++
Function: prims(startIdx):
  enqueueEdges (startIdx, wasVisited, edgeQueue);
  while (!edgeQueue.empty() && edgeCount < EDGES_IN_MST)
    edge = edgeQueue.dequeue()
    if (!wasVisited[edge.destination])
      mstEdges.enqueue(edge)
      ++edgeCount
    totalCost += edge.weight
    enqueueEdges (edge.destination, wasVisited, edgeQueue)
  return (edgeCount != EDGES_IN_MST) ? -1 : totalCost
```

```C++
Function enqueueEdges (fromVertex, wasVisited[], edgeQueue):
// Mark the current node as visited.
wasVisited[nodeIdx] = true;

// Iterate over all edges going outward from the current node.
// Add edges to unvisited nodes the queue
for (const auto &edge : AdjacencyMatrix[nodeIdx])
  if (!wasVisited[edge.destination])
    edgeQueue. enqueue({fromVertex, edge.destination, edge.weight});
```

## Performance

What operations are faster with an Adjacency Matrix?

What operations are faster with an Adjacency List?

When would each implementation be more memory efficient?

## Summary

- A ***graph*** $G$ is a pair, $G = (V, E)$.

- In an ***undirected graph*** $G = (V, E)$,  
  the elements of $E$ are unordered pairs.

- In a ***directed graph*** $G = (V, E)$,  
  the elements of $E$ are ordered pairs.

- $H$ is a ***subgraph*** of $G$ if every vertex of $H$ is a vertex of
  $G$ and every edge is an edge in $G$.

- Two vertices in an undirected graph are ***adjacent*** if there is an
  edge between them.

- ***Loop***: an edge incident on a single vertex.

- ***Simple graph***: no loops and no parallel edges.

- ***Simple path***: all the vertices, except possibly the first and
  last vertices, are distinct.

- ***Cycle***: a simple path in which the first and last vertices are
  the same.

- An undirected graph is ***connected*** if there is a path from any
  vertex to any other vertex.

- The ***shortest path algorithm*** gives the shortest distance for a
  given node to every other node in the graph.

- In a ***weighted graph***, every edge has a nonnegative weight.

- A ***rooted tree*** is a tree in which a particular vertex is
  designated as a root.

- A tree $T$ is called a ***spanning tree*** of graph $G$ if $T$ is a
  subgraph of G such that $V(T) = V(G)$.

## Lab 23: Graphs via Adjacency Lists

Let’s look at the lab based on today’s lecture.
