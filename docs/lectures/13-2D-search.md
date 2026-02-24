Depth-First and Breadth-First Search
====================================

Maze Solving

Learning Outcomes
-----------------

After completing this lecture and the related lab, students will be able to:

1. Explain the conceptual differences between Depth-First Search (DFS) and Breadth-First Search (BFS) algorithms.

2. Describe how recursion, stacks, and queues support systematic exploration of a 2D maze.

3. Implement DFS and BFS algorithms in C++ to determine whether a maze can be solved.

4. Compare the performance and pathfinding results of DFS and BFS in terms of completeness, optimality, and memory use.

5. Debug and trace recursive and iterative search algorithms to observe traversal order and backtracking.

6. Extend maze-solving algorithms to handle advanced cases such as weighted moves or warp locations.

7. Relate maze traversal techniques to broader search problems, including graph traversal and web crawling.

## Maze Solving Lecture Video

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/rwHMSmn6HTI?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Project 2 Overview Video

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/nei9AOExrOw?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## 🧩 Overview

- Goal: Write programs to **solve 2D mazes** using **Depth-First Search (DFS)** and **Breadth-First Search (BFS)**.
- Reinforces key Data Structures concepts:
  - Recursion
  - Stacks and Queues
  - Searching algorithms
  - Structs, pointers, and heap memory
- Application links to **Project 2** and upcoming **Binary Search Trees**. 

## 🧱 Representing the Maze

- Maze stored as a **1D array** (for heap allocation) visualized in 2D.
- Defined constant values:
  - `O` = Open path
  - `W` = Wall
  - `V` = Visited (or use a separate 1D array to track visited to keep the maze values constant).

- Each position tracked using a `Point` struct:
  ```cpp
  struct Point {
    int row;
    int col; 
    int distance; // optional for BFS 
  }; 
  ```

- Helper functions:
  - Convert between 2D coordinates and 1D index.
  - Overloaded `==` operator for comparing points.
  - `printMaze()` visualizes traversal.

## 🔍 Depth-First Search (DFS)

### Concept

- Explore one path **deeply before backtracking**.
- Implemented **recursively** or using a **stack**.
- Great for finding *a* solution, but **not necessarily the shortest**.

### Algorithm 

1. Base cases:
   - Out of bounds → stop
   - Hit a wall (`W`) → stop
   - Already visited (`V`) → stop
   - Reached end → success 
2. Mark current cell as visited. 
3. Recursively explore neighbors (e.g., up, right, down, left). 
4. If no direction leads to the goal → backtrack.

### Notes

- Recursive DFS uses the **call stack**.
- Iterative DFS uses an explicit `std::stack<Point>`.
- Order of exploration affects path pattern.
- Pros:
  - Simple to implement.
- Cons:
  - Can be inefficient (explores long wrong paths).
  - Not guaranteed to find the shortest path.

## 🌐 Breadth-First Search (BFS)

### Concept

- Explores **all possible moves one step at a time**.
- Implemented using a **queue** (`std::queue<Point>`).
- Guaranteed to find the **shortest path**.

### Algorithm 
1. Enqueue the start point. 
2. While queue not empty:
   - Dequeue a point (`current`).
   - If it’s the end → done.
   - For each valid move (up, down, left, right):
   - If unvisited and open, mark visited and enqueue new point. 
3. Track `distance` for shortest path calculation.

### Notes
- BFS processes nodes **in order of distance** (first-in, first-out).
- Useful for **shortest-path problems**.
- Higher memory use, but predictable runtime growth.

## ⚖️ DFS vs BFS Comparison 

| Feature              | DFS      | BFS | 
|---------------------:|----------|-----| 
| Data Structure       | Stack (or recursion) | Queue | 
| Search Style         | Deep     | Broad | 
| Finds Shortest Path? | ❌ No   | ✅ Yes | 
| Overall Memory Usage | Lower    | Higher | 
| Implementation       | Often recursive | Iterative | 
| Backtracking         | Implicit | Not needed |

Depth-First Search (DFS) generally uses less memory than Breadth-First Search (BFS) because BFS must keep many nodes in memory at once, while DFS only keeps one active path.

## 🚀 Extensions

### Heuristic Search (A*)

- Improves DFS by prioritizing moves that appear closer to the goal.
- Trades **accuracy** for **speed** using “good-enough” paths.

### Project Extensions

- **Priority Queue / Insert with Priority**
  - Used to simulate priority-based traversal.
- **Mazes with Warps**
  - Special numeric cells act as teleporters.
  - Warp target computed via:  
    ```
    row = value / width
    col = value % width 
    ```
  - Warps cost 1 step like normal moves.

## 🧠 Key Takeaways

- DFS = good for *existence* of a path.
- BFS = good for *shortest* path.
- Use recursion or stacks/queues to manage state.
- Maze solving provides a practical foundation for:
- Search algorithms
- Graph traversal
- Pathfinding logic (used later in tree and graph topics)

## Lab, Project, and Exam

Take a look at Lab 13 and Project 2.

[Study for the Midterm Exam.](/guides/midterm-study-guide) 