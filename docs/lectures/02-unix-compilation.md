C++ Development in Linux
========================

Learning Outcomes
-----------------

After studying this lecture, students should be able to:

- Linux Philosophy
  - Describe the core principles of the Unix/Linux philosophy.
  - Identify and navigate the Linux file system hierarchy.
  - Explain the purpose of regular files, directories, and device files in Linux.

- C++ Software Development
  - Explain the purpose and role of a compiler.
  - Describe the stages of the compilation process in C/C++.
  - Interpret and use basic `g++` command-line options.
  - Differentiate between source files, object files, and executables for modularized code.
  - Understand the benefits of separating interface (header) with guards and implementation (source) files.
  - Use make and basic Makefile rules to automating multi-file C++ compilation tasks.
  - Diagnose common compiler and linker errors using output messages.

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/0Tfb_EXSrAo?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>


## Linux Philosophy

### The Linux File Structure and Inodes

- In Linux, [everything is a
  file](https://en.wikipedia.org/wiki/Everything_is_a_file)! Well,
  almost.

- Drives, ports, devices (e.g., printers) are file descriptors.

- A file has a name and an [***inode*** (index
  node)](https://en.wikipedia.org/wiki/Inode) that stores its metadata
  or “administrative information.”

  - creation/modification date

  - permissions

  - properties are stored in the file’s inode

  - a special block of data in the file system

  - contains administrative information

  - contains the length of the file

  - where on the disk it’s stored

### Directories

- Directories (a.k.a. folders) are also files.

- A directory is a file that holds the ***inode*** (index node) numbers
  and names of other files.

- Each directory entry is a link to a file’s inode; remove the filename
  and you remove the link.

- You can see the inode number for a file by using `ls -i`.

- If the last link to a file is deleted, the inode and the referenced
  data and are marked as free (soft delete).

- This allows deletion when there are multiple hard links to the same
  file to be managed correctly.

Files are arranged in directories, which may contain sub-directories.

| Directory | Description                                        |
|:----------|:---------------------------------------------------|
| `/`       | Contains all of the system’s files in directories. |
| `/home`   | Contains a sub-directory for each user’s home.     |
| `/bin`    | System programs (“binaries”)                       |
| `/etc`    | System configuration files                         |
| `/lib`    | System libraries                                   |
| `/dev`    | Physical devices and device interfaces             |
|           |                                                    |

![Example Directories Tree](/images/unix-compilation/directory_tree.svg "Example Directories Tree"){width=300px .light-only}

![Example Directories Tree](/images/unix-compilation/directory_tree-dark.svg "Example Directories Tree"){width=300px .dark-only}

### Files and Devices

- Even hardware devices are very often represented (mapped) by files.

- You can mount a CD-ROM drive as a file:

  - `mount -t iso9660 /dev/sr0 /mnt/cdrom`

  - `cd /mnt/cdrom` \# navigate to the mounded drive

- You can mount a USB drive as a file:

  - `mkdir /media/usb-drive` \# Make a folder ot be the mount point.

  - `fdisk -l` \# look at list of available drives

  - `mount /dev/sdc1 /media/usb-drive/`

  - `cd /media/usb-drive`

### `/dev/console`

- This device represents the system console.

- Error messages and diagnostics are often sent to this device.

- On Linux, it’s usually the “active” virtual console.

### `/dev/tty`

- The special file `/dev/tty` is an alias for the controlling terminal
  of a process.

  - keyboard

  - screen

  - window

- `/dev/tty` allows a program to write directly to the user, without
  regard to which pseudo-terminal or hardware terminal the user is
  using.

### /dev/null

- This is the null device.

- All output written to this device is discarded.

- Unwanted output (a.k.a., a student’s email complaint/rant) is often
  redirected to `/dev/null`.

- `echo I do not want to see this. > /dev/null`

- `cp /dev/null empty_file`

## Compilation

### Introduction

As a programmer or system administrator, you should know how to program
under Linux.

We are going to learn how to use:

-  `g++` to compile a C++ program under Linux.
-  `gdb` and `ddd` to debug.
-  `make` to automate compilation.
-  `valgrind` to perform memory analysis.
-  `gnuplot` to create performance graphs.
-  `perf` to identify performance issues (time permitting).


### Compiling C++ Programs

We start with the simple case of a single source-code file.

Create a `.cpp` file similar to the one listed here.

```cpp
#include <iostream>

int main()
{
	std::cout << "Hello, World!\n";

	return 0;
}
```

### Compile

- Compile using  
  `g++ test.cpp`

- What file is generated?

- Name your compiled executable by using  
  `g++ test.cpp -o test`

- Run the generated executable file.  
  `./test`

### Creating Debug Ready Code

```bash
g++ -g test.cpp -o test
```

- The `-g` flag tells the compiler to use debug info.

- The compile file size is much larger.

- We may still remove this debug information using the strip command.  
  `strip test`

### Sanitizers for Better Runtime Error Detection

The following add additional run-time checking.

``` bash
g++ -g -fsanitize=return -fsanitize=undefined -fsanitize=address test.cpp -o test
```

-   `-fsanitize=return` Shows error when returning without a value from non-void function.
-   `-fsanitize=undefined` Detects some undefined behaviors.
-   `-fsanitize=address` Detects memory addressability issues.

See all options at
<https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html>

### Adding Optimizations

- The compiler can help improve the performance of your code via
  optimizations.

- `g++ -O test.cpp -o test`

- The `-O` flag tells the compiler to optimize the code.

- Usually can define an optimization level by adding a number to
  the `-O` flag.

### Getting Extra Compiler Warnings

- ***Error messages*** – Erroneous code that does not comply with the
  C++ standard.

- ***Warnings*** – Codes that usually tend to cause errors during
  runtime.

- To receive extra compiler warnings, use the `-Wall -Wextra`
  arguments.  
  `g++ -Wall -Wextra test.cpp -o test`

  - Useful to improve the quality of our source code

  - Expose bugs that will really bug us later

### Even More Compiler Warnings

``` Bash
g++ -Wall -Wextra -Wpedantic -Wconversion -Wshadow test.cpp -o test
```

- `-Wall` all the warnings about constructions that some users consider questionable, and that are easy to avoid
-  `-Wextra` some extra warning flags that are not enabled by `-Wall`
- `-Wpedantic` warnings demanded by strict ISO C++
- `-Wconversion` implicit conversions that may alter a value
- `-Wshadow` whenever a local variable or type declaration shadows another variable, parameter, type, class member, etc.

See all options at
<https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html>

### Compiling Multi-Source Programs

- Compile them with:

  - `g++ main.cpp a.cpp b.cpp -o hello`

- Comments:

  - If external symbols are needed, use the `extern` keyword.

  - Source file order becomes important.

  - As program size increases, so does compilation time.

![Processing a C++ Program](/images/unix-compilation/development_process.svg "Processing a C++ Program"){width=350px .light-only}

![Processing a C++ Program](/images/unix-compilation/development_process-dark.svg "Processing a C++ Program"){width=350px .dark-only}

### Selective Recompilation After Isolated Changes

- With the previous command, all source files are always recompiled,
  even when only one of them changed.

- To overcome, we compile in multiple steps.

  ``` bash
  g++ -c main.cpp # Create main.o
  g++ -c a.cpp    # Create a.o
  g++ -c b.cpp    # Create b.o
  g++ main.o a.o b.o -o hello # link files
  ```

- `-c` tells the compiler to only create an object file.

- The final command links the objects into an executable.

## Makefile

### Automating Program Compilation

- A ***makefile*** is a collection of instructions that should be used
  to compile your program.

- Once you modify some source files, and type the command `make` (or
  `gmake` if using GNU’s make), your program will be recompiled using as
  few compilation commands as possible.

### Makefile Structure

- Variable Definitions – Define values for variables for reuse.

  ``` makefile
  CPPFLAGS  = -Wall -Wextra -Wconversion -Wshadow -Wpedantic
  CPPFLAGS += -g -fsanitize=return -fsanitize=undefined -fsanitize=address
  SRCS = main.cpp file1.cpp file2.cpp
  CC = g++
  ```

### Makefile Structure

- Dependency Rules – Define the conditions a given file needs to be
  recompiled, and how to compile it.

  ``` makefile
  main.o: main.cpp
      g++ ${CPPFLAGS} -c main.cpp
  ```

  - Recompile if any of the files after a `:` change.

  - You *must* use hard tabs in makefiles! (Spaces will NOT work.)

  - `# is a comment`

### Single Source Makefile Example

``` makefile
# First,  list your variable(s)
CC = g++
# First rule, which creates the program.
#    By convention, the first rule is usually all.
all: main
# compiling the source file, main.o depends on main.c
main.o: main.cpp
        ${CC} -g -Wall -Wextra -c main.cpp
# ${CC} uses the value of CC variable, case sensitive
# linking the program, the program name is main
main: main.o
        ${CC} -g main.o -o main
# cleaning everything that can be recreated with "make"
# (basically, objects, the executable, and temp files).
clean:
        rm -f main main.o
```

### Multi-Source-File Example

``` makefile
CPPFLAGS = -g -Wall -Wextra -Wconversion -Wshadow -Wpedantic
# Top-level rule to compile the whole program.
all: prog
# The program is made of several source files.
prog: main.o file1.o file2.o
    g++ main.o file1.o file2.o -o prog
# Rule for file "main.o".
main.o: main.c file1.h file2.h
    g++ ${CPPFLAGS} -c main.cpp
# Rule for file "file1.o".
file1.o: file1.c file1.h
    g++ ${CPPFLAGS} -c file1.cpp
# Rule for file "file2.o".
file2.o: file2.cpp file2.h
    g++ ${CPPFLAGS} -c file2.cpp
# Rule for cleaning files generated during compilations.
clean:
    rm -f prog main.o file1.o file2.o
```

### Phony Targets

- Make assumes that all the targets are files.

- We may want to run commands that do not represent files.  

  ``` makefile
  # Rule for cleaning files generated during compilations.
  clean:
      rm -f prog main.o file1.o file2.o
  ```

- We can identify special targets that are not files.

  ``` makefile
  # Allow the clean target to run even if there is a file named "clean"
  .PHONY: clean
  ```

### How can we put the object files in a sub-directory?

``` makefile
# Make an object folder and put a .gitignore file in it.
obj:
  mkdir obj && echo *.o > obj/.gitignore

# The thing to the right of | is an order-only rule
obj/main.o: main.cpp | obj
  g++ ${CPPFLAGS} -c main.cpp -o obj/main.o

obj/a.o : a.cpp | obj
  g++ ${CPPFLAGS} -c a.cpp -o obj/a.o

obj/b.o : b.cpp | obj
  g++ ${CPPFLAGS} -c b.cpp -o obj/b.o

main: obj/main.o obj/a.o obj/b.o
  g++ ${CPPFLAGS} obj/main.o obj/a.o obj/b.o -o main
```

### Multi-Source Make

- Commands can be anything; usually they are g++ to compile or link.

- Commands can be multiline, use tabs

- Other tools:
  - `makedepend` Finds dependencies for your program.
  - `configure` Finds libraries your program make need.

- We are going to focus only on `make` for this class.

## System Architecture

### System Calls And Device Drivers

- System calls access and control files and devices.

- At the heart of the operating system, the kernel, are some device
  drivers.

- The low-level functions used to access the device drivers, the system
  calls, include:
  + `open` Open a file or device
  + `read` Read from an open file or device
  + `write` Write to a file or device
  + `close` Close the file or device
  + `ioctl` Pass control information to a device driver

### System Calls And Device Drivers

Using low-level system calls directly for input and  
output can be very inefficient.

- Why?

  - Performance penalty in making a system call.

  - The hardware has limitations

- Standard libraries provide a higher-level interface to devices and
  disk files.

![System Calls](/images/unix-compilation/system_calls.svg "Programs generally run in user space and use libraries to make system class that are handled by the operating system kernel. They operating system may then use device drivers to interact with hardware."){width=300px .light-only}

![System Calls](/images/unix-compilation/system_calls-dark.svg "Programs generally run in user space and use libraries to make system class that are handled by the operating system kernel. They operating system may then use device drivers to interact with hardware."){width=300px .dark-only}

## Valgrind

### What is Valgrind?

- A tool to perform:

  - memory debugging,

  - memory leak detection, and

  - memory profiling.

- Valgrind accomplishes this by running your program inside of its
  virtual machine and capturing all your memory accesses/requests.

### Memory Debugging: A Successful Run

``` plain
==2231== Memcheck, a memory error detector
==2231== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
==2231== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
==2231== Command: ./a.out
==2231==
==2231==
==2231== HEAP SUMMARY:
==2231==     in use at exit: 0 bytes in 0 blocks
==2231==   total heap usage: 0 allocs, 0 frees, 0 bytes allocated
==2231==
==2231== All heap blocks were freed -- no leaks are possible
==2231==
==2231== For counts of detected and suppressed errors, rerun with: -v
==2231== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```

- Notice Valgrind keeps track of:

  - (heap) memory used on exit

  - How much heap memory was allocated & deallocated.

  - How many memory errors (out-of-bounds memory access) were detected.

- `2231` is the process ID, which is unimportant for this course.

### Memory Leak Detection

Consider this obvious memory leak:

``` c++
int main()
{
  int *pArr = new int[512];

  return 0;
}
```

```bash
g++ -g test.cpp && valgrind ./a.out
```

``` plain
==2476== HEAP SUMMARY:
==2476==     in use at exit: 4,096 bytes in 1 blocks
==2476==   total heap usage: 1 allocs, 0 frees, 4,096 bytes allocated
==2476==
==2476== LEAK SUMMARY:
==2476==    definitely lost: 4,096 bytes in 1 blocks
==2476==    indirectly lost: 0 bytes in 0 blocks
==2476==      possibly lost: 0 bytes in 0 blocks
==2476==    still reachable: 0 bytes in 0 blocks
==2476==         suppressed: 0 bytes in 0 blocks
```

- ***Definitely lost*** means we lost

- ***Indirectly lost*** means, we lost and it could be hard to find.

- ***Possibly lost*** means Valgrind was not able to determine if the
  memory was deallocated or not.

- ***Still reachable*** means you have a dangling pointer.

### Memory Usage detection

A better version:

``` c++
int main()
{
  int *ints = new int[1024];

  delete[] ints;
  return 0;
}
```

```bash
g++ -g test.cpp && valgrind ./a.out
```

``` plain
==2591== HEAP SUMMARY:
==2591==     in use at exit: 0 bytes in 0 blocks
==2591==   total heap usage: 1 allocs, 1 frees, 4,096 bytes allocated
==2591==
==2591== All heap blocks were freed -- no leaks are possible
```

Notice that Valgrind can tell us how much heap memory we are using even
though we freed (deallocated) it.

### Memory Access Error Detection

Now let’s use Valgrind to detect an off-by-one memory error.

``` c++
int main() {
  int *ints = new int[1024];

  for (int i = 0; i <= 1024; i++) {
    ints[i] = i;
  }

  delete[] ints;
  return 0;
}
```

Do you see the error?

``` plain
==2615== Invalid write of size 4
==2615==    at 0x400673: main (in ~/t/a.out)
==2615==  Address 0x5a03040 is 0 bytes after a block of size 4,096 alloc'd
==2615==    at 0x4C298A0: operator new[](unsigned long) (vg_replace_malloc.c:389)
==2615==    by 0x40064E: main (in ~/t/a.out)
==2615==
==2615==
==2615== HEAP SUMMARY:
==2615==     in use at exit: 0 bytes in 0 blocks
==2615==   total heap usage: 1 allocs, 1 frees, 4,096 bytes allocate
```

Well that tells us the error, but where is it?

### Getting A Little More Help

Compile with debug flags (`-g`)!

```bash
g++ -g test.c && valgrind ./a.out
```

``` plain
==2634== Invalid write of size 4
==2634==    at 0x400673: main (test.c:7)
==2634==  Address 0x5a03040 is 0 bytes after a block of size 4,096 alloc'd
==2634==    at 0x4C298A0: operator new[](unsigned long) (vg_replace_malloc.c:389)
==2634==    by 0x40064E: main (test.c:4)
==2634==
==2634==
==2634== HEAP SUMMARY:
==2634==     in use at exit: 0 bytes in 0 blocks
==2634==   total heap usage: 1 allocs, 1 frees, 4,096 bytes allocated
==2634==
==2634== All heap blocks were freed -- no leaks are possible
```

### Conclusion

- Valgrind can be used to detect memory leaks and memory access errors.

- Valgrind provides other tools to profile memory usage and cache usage,
  but those are beyond the scope of this class.

- Why doesn’t C++ does not have built-in memory debugging like Java?

## In the Future

### Gnuplot: Generates Simple Graphs

Gnuplot command-line graphing utility for Linux.

We will use it soon to observe the performance of our data structures
and algorithms.

## Lab 02

### Git: Adding an Upstream Repository

Is your forked repository missing the updates  
from the course repository?  

### Git: Adding an Upstream Repository

``` bash
# See your current remote repositories
git remote -v

# Add the course repository as a remote repository
git remote add upstream https://github.com/csu-cs/CSCI-315-2025-Spring.git

# Set the merging method for divergent branches
git config pull.rebase false # merge

# Get the latest updates for the class repository
git pull upstream master

# Save these changes on your GitHub fork
git push
```

