Debugging in C++ with GDB
=========================

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/P5ThqxwWiVU?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Introduction

### Common Types of Bugs

-  **Syntax Errors**: Mistakes in the code that prevent it from compiling.
-  **Logical (Semantic) Errors**: The program runs but produces incorrect results.

### What is Debugging?

-  The process of finding and fixing errors (bugs) in a program.
-  Can involve various techniques, including print statements, code reviews, and using debugging tools.

### Why Debug with Debuggers?

-  Even the best programmers make mistakes.
-  Debugging is an essential skill for every programmer.
-  Learning to use a debugger effectively can save you hours of frustration.

### Debugging Approaches

-  Print statements (`std::cout`).
-  Code reviews and pair programming.
-  Debugging tools like GDB.

## Debugging with GDB

### What is GDB?

- ***GDB*** stands for ***GNU Project Debugger*** and was first written
  in 1986.

- A debugging tool for C++ (and other languages).

![Logo for GDB, designed by Jamie Guinan, who wrote, “For a fish, the archer fish is known to shoot down bugs from low hanging plants by spitting water at them.”](/images/debugging/gdb-logo.svg "Logo for GDB, designed by Jamie Guinan, who wrote, “For a fish, the archer fish is known to shoot down bugs from low hanging plants by spitting water at them.”")

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

## GDB in VSCodium or VS Code

### Prerequisites

1.  Install the [C/C++ Debug (gdb)](https://open-vsx.org/extension/KylinIdeTeam/cppdebug) extension.

2.  If running in WSL, install the [Open Remote - WSL](https://open-vsx.org/extension/jeanp413/open-remote-wsl) extension.
    +   Ensure that the [C/C++ Debug (gdb)](https://open-vsx.org/extension/KylinIdeTeam/cppdebug) extension is installed within WSL.

3.  Open the lab/project folder (not just a source file or the whole repository).
    +   If using WSL, make sure to connect to WSL (remote connection).

4.  Open a C++ file.

### Project Setup

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
