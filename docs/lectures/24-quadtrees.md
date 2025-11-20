Quadtrees
=========

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/E8bUcEwwWPU?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

<script setup>
import insertion_diagram from '/images/quadtrees/insertion_example.svg'
</script>

## Outline

- Motivation

- Explanation

- Time Complexity

- Implementation

- Variations of the Quadtree

## Motivation

Suppose we have a set of 2D points and we want to
be able to query how many points lie in a particular rectangle.

A brute force approach would be $O(n)$ in the number of points.

We want a way to more efficiently count points contained within 
a rectangular region.

## Explanation

Each node in a *Quadtree* has a bounding rectangle.
If the node is not a leaf then it has 4 children,
splitting the rectangle into four quadrants.

Points are also attached to nodes.
We define a constant specifying the maximum number of points
associated with each node.

## Insertion

<ProgressiveDiagram :src="insertion_diagram" />
<br />

![3D representation of the points inserted into the quadtree](/images/quadtrees/inserted_points_3d.svg "3D representation of the points inserted into the quadtree"){.light-only}

![3D representation of the points inserted into the quadtree](/images/quadtrees/inserted_points_3d-dark.svg "3D representation of the points inserted into the quadtree"){.dark-only}

## Query

- Use recursion to count the number of points in a  
  given range.

- Consider only nodes that overlap with the query range.

## Time Complexity

If the points are distributed uniformly in the root’s  
range, then insertions and queries are ***logarithmic***.

However, if they are not uniformly distributed  
then it can degrade to ***linear time***.

## Quadrant Contains a Point

$(c_x - \frac{1}{2}w) \le p_x < (c_x + \frac{1}{2}w)$

$(c_y - \frac{1}{2}h) \le p_y < (c_y + \frac{1}{2}h)$

## Region Intersects a Quad

$$\begin{aligned}
      \text{left} &< c_x + \frac{1}{2}w\\[5pt]
      \text{right} &> c_x - \frac{1}{2}w\\[5pt]
      \text{top} &> c_y - \frac{1}{2}h\\[5pt]
      \text{bottom} &< c_y + \frac{1}{2}h\  
    
\end{aligned}$$

## Types of Quadtrees

- ***Region*** quadtree – Divides region into sub-quadrants based on the
  areas with more detailed information.

  - Image processing – only subdivide if pixels differ in color.

  - Variable resolution data field – each parent has the average value
    of its children.

- ***Point*** quadtree – Divide the region at the point that is inserted
  (like a binary tree but with 4 pointers). [$k$-d
  trees](https://en.wikipedia.org/wiki/K-d_tree) are preferred.

- ***Point-region (PR)*** quadtree – What we implemented.

- ***Edge*** quadtree – Stores lines/curves with approximation.

- ***Polygonal map (PM)*** quadtree – stores polygons.

- ***Compressed*** quadtrees – only storing subtrees whose leaves have
  interesting data and removing empty intermediate nodes.

## Conclusion

- Quadtrees are used to efficiently query the number of points contained
  within various rectangular ranges.

- Quadtrees are most efficient when the points are uniformly
  distributed.

## Lab 24: Quadtrees

Let’s take a look at the lab based on today’s lecture.
