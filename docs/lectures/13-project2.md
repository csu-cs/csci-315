Project 2
=========



Project 2 integrates file I/O, string parsing, validation, and traversal into one cohesive system. You will build a simplified HTML parser that extracts tags and links, verify structural correctness using a proper stack discipline (not simple counting), and implement a [DFS or BFS](13-2D-search) crawler that counts unique reachable pages while avoiding duplicates and missing files.

The most important advice is to

-   design your data structures before coding,
-   store parsed results by filename so you never reparse unnecessarily,
-   separate parsing from balance checking,
-   track visited pages during crawling to prevent infinite recursion,
-   and thoroughly test edge cases (especially malformed nesting and broken links) with your own HTML files rather than relying only on the provided examples.

## Overview

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/nei9AOExrOw?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Data Structure Design

Your parser must store data so that:

-   `isBalanced()` does not reparse the file

-   `visitPageAmount()` can access links efficiently

-   Files are not reparsed unnecessarily

## Final Implementation Checklist

<input type="checkbox" /> Read file character-by-character

<input type="checkbox" /> Extract tags correctly

<input type="checkbox" /> Handle `<a href="...">...</a>` carefully

<input type="checkbox" /> Store parsed data by filename

<input type="checkbox" /> Implement stack-based balance check

<input type="checkbox" /> Implement DFS or BFS for crawling

<input type="checkbox" /> Avoid double parsing

<input type="checkbox" /> Avoid double counting

<input type="checkbox" /> Handle missing files correctly

<input type="checkbox" /> Create additional test HTML files