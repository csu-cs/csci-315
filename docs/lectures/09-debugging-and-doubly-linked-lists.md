Debugging, Doubly-Linked Lists, Project 1
=========================================

Chapter 16

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/gJH2Wlqvw6k?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Debugging with GDB

### What is GDB?

- ***GDB*** stands for ***GNU Project Debugger*** and was first written
  in 1986.

- A debugging tool for C++ (and other languages).

![Logo for GDB](/images/debugging/gdb-logo.svg "Logo for GDB")

- Lets you step through the code one instruction at a time to see what
  is happening.

- Loads executable files that were compiled with debug information
  (`-g`).

### Compiling a Program for Debugging

`g++ -g <source> -o <executable>`

### Launching and Exiting GDB

- `gdb` Start GDB.
- `gdb <program>` Start GDB.
- `gdb --args` Start GDB and pass arguments to executable.
- `quit` Exit GDB.

### Run a Program to be Debugged

- `run` Run the executable that was previously set.
- `file` Set the executable to run.

### Breakpoints

- `break <where>` Set a new breakpoint.
- `enable <breakpoint#>` Enable a disabled breakpoint
- `disable <breakpoint#>` Disable a breakpoint.
- `delete <breakpoint#>` Remove a breakpoint.
- `clear` Delete all breakpoints.

### Stepping through Lines of Code
- `step` Go to next instruction (source line), diving into function calls.
- `next` Go to next instruction (source line) in this function.
- `continue` Continue execution until the next breakpoint.
- `finish` Continue until the current function returns.

### Variables and Memory

- `print` Print content of variable/memory location.
- `display` Like `print` but shows the information with each step.
- `undisplay` Remove the `display` with the given number.
- `info locals` Print the local variables or arguments in the current stack frame.

## GDB in VS Code

### Prerequisites to GDB in VS Code

- If running in WSL, install the WSL extension.

- Install the C++ extension.

- Open the lab/project folder (not just a source file or the whole
  repository).

- Open a C++ file.

### Setup Project for GDB in VS Code

1.  Open a C++ File in the Folder.

2.  Click on the “Run” menu at the top.

3.  Click on the “Add Configuration” menu item and select “G++
    (GDB/LLDB)”.

4.  Click “Add Configuration” on the bottom right.

5.  Select “C/C++: (gdb) Launch”.

6.  Modify the “name”, “program”, “args”, and “cwd” fields as desired.

<https://code.visualstudio.com/docs/cpp/launch-json-reference>

### Use `.gitignore` files

There are often files you do not want to share (executable, debug
configuration).

Git will not track files and folders specified in a `.gitignore` file.

``` plain
.vscode/*
obj/*
main
test-runner
```

Doubly-Linked List
------------------

### What if we want to traverse the list in reverse?

Three Options:

1.  We can use recursion to iterate to the end and then perform the
    operation when we “unwind.”

2.  We can use a helper data structure (a stack).

3.  We can implement a ***doubly-linked list*** type, where every node
    has a next and previous pointer.

    ![Example of a doubly-linked list](/images/doubly-linked-lists/dll_example1.svg "Example of a doubly-linked list."){width="520px" .light-only}

    ![Example of a doubly-linked list](/images/doubly-linked-lists/dll_example1-dark.svg "Example of a doubly-linked list."){width="520px" .dark-only}

### Prepending a Doubly-Linked List

Step 0:

![Initial State](/images/doubly-linked-lists/dll_prepend1.svg "Initial State before prepending to a doubly-linked list."){width="520px" .light-only}

![Initial State](/images/doubly-linked-lists/dll_prepend1-dark.svg "Initial State before prepending to a doubly-linked list."){width="520px" .dark-only}


Step 1:

![Create the new node](/images/doubly-linked-lists/dll_prepend2.svg "Create the new node."){width="520px" .light-only}

![Create the new node](/images/doubly-linked-lists/dll_prepend2-dark.svg "Create the new node."){width="520px" .dark-only}

Step 2:

![Update pNewNode->pNext to mpHead](/images/doubly-linked-lists/dll_prepend3.svg "Update `pNewNode->pNext` to `mpHead`."){width="520px" .light-only}

![Update pNewNode->pNext to mpHead](/images/doubly-linked-lists/dll_prepend3-dark.svg "Update `pNewNode->pNext` to `mpHead`."){width="520px" .dark-only}

Step 3:

![Update mpHead->pPrev to pNewNode.](/images/doubly-linked-lists/dll_prepend4.svg "Update `mpHead->pPrev` to `pNewNode`."){width="520px" .light-only}

![Update mpHead->pPrev to pNewNode.](/images/doubly-linked-lists/dll_prepend4-dark.svg "Update `mpHead->pPrev` to `pNewNode`."){width="520px" .dark-only}

Step 4:

![Update mpHead to pNewNode.](/images/doubly-linked-lists/dll_prepend5.svg "Update `mpHead` to `pNewNode`."){width="520px" .light-only}

![Update mpHead to pNewNode.](/images/doubly-linked-lists/dll_prepend5-dark.svg "Update `mpHead` to `pNewNode`."){width="520px" .dark-only}


### Appending a Doubly-Linked List

Step 0:

![Initial State](/images/doubly-linked-lists/dll_append1.svg "Initial State before appending to a doubly-linked list."){width="520px" .light-only}

![Initial State](/images/doubly-linked-lists/dll_append1-dark.svg "Initial State before appending to a doubly-linked list."){width="520px" .dark-only}

Step 1:

![Create the new node](/images/doubly-linked-lists/dll_append2.svg "Create the new node."){width="520px" .light-only}

![Create the new node](/images/doubly-linked-lists/dll_append2-dark.svg "Create the new node."){width="520px" .dark-only}

Step 2:

![Update pNewNode->pNext to mpHead](/images/doubly-linked-lists/dll_append3.svg "Update `pNewNode->pNext` to `mpTail`."){width="520px" .light-only}

![Update pNewNode->pNext to mpHead](/images/doubly-linked-lists/dll_append3-dark.svg "Update `pNewNode->pNext` to `mpTail`."){width="520px" .dark-only}

Step 3:

![Update mpTail->pNext to pNewNode.](/images/doubly-linked-lists/dll_append4.svg "Update `mpTail->pNext` to `pNewNode`."){width="520px" .light-only}

![Update mpTail->pNext to pNewNode.](/images/doubly-linked-lists/dll_append4-dark.svg "Update `mpTail->pNext` to `pNewNode`."){width="520px" .dark-only}

Step 4:

![Update mpTail to pNewNode.](/images/doubly-linked-lists/dll_append5.svg "Update `mpTail` to `pNewNode`."){width="520px" .light-only}

![Update mpTail to pNewNode.](/images/doubly-linked-lists/dll_append5-dark.svg "Update `mpTail` to `pNewNode`."){width="520px" .dark-only}


Intro. to the Standard Template Library (SLT)
---------------------------------------------

[Go here for lecture notes on the STL.](17-standard-template-library)

## Homework

- Lab 9: *Doubly-Linked Lists*

- Project 1: *Large Map*
