
Introduction to the Course
==========================

## Learning Objectives

1.  Understand what a data structure is and why it matters.
2.  Become familiar with the course environment and expectations.
3.  Provide advice on how to succeed in this course.
4.  Get your computer set up for the course.

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/I0cg59m8gKE?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Defining the Topic

### What is a Data Structure?

-   A ***data structure*** is a scheme for organizing data in computer
    memory.

-   Common data structures:
    -   lists,
    -   arrays,
    -   stacks,
    -   queues,
    -   heaps,
    -   trees, and
    -   graphs.

#### Why?

-   How the data is ***organized*** affects the performance of different
    tasks.

-   Computer programmers choose data structures based on the ***nature
    of the data*** and the ***processes performed*** on that data.


#### Binary Trees

-   A ***binary tree*** is common data structure organized like an
    upside-down tree.

-   Each spot on the tree, called a ***node***, holds an item of data
    along with a left pointer and a right pointer.

![Binary Tree](/images/intro/binary_tree1.svg "Binary Tree"){width=250px .light-only}

![Binary Tree](/images/intro/binary_tree1-dark.svg "Binary Tree"){width=250px .dark-only}

-   The ***pointers*** are lined up so that the structure forms the
    upside-down tree with a single node at the top (called the *root node*)
    and branches increasing on the left and right as you go down the tree.

#### Queues

A ***queue*** is an example of a commonly used simple data
structure. A queue has a beginning and end, called the front
and back of the queue

![Queue](/images/intro/queue.svg "Queue"){width=200px .light-only}

![Queue](/images/intro/queue-dark.svg "Queue"){width=200px .dark-only}

Data enters the queue at one end and leaves at the other.
Because of this, data exits the queue in the same order in
which it enters the queue, like people in a checkout line at a
supermarket.

#### Discussion

-   Can you think of a way you organize information in your daily life?

-   Why might different situations require different ways of organizing?

-   Decisions, decisions: When to choose one over other?

## Important Considerations

### Our First Goal

Finalize a solid conceptual foundation for Computer Science.

-   The Parable of Wise & Foolish Builders: [Matthew
    7:24-27](https://www.biblegateway.com/passage/?search=Matthew+7%3A24-27&version=ESV).

-   Previously, you reworked existing examples.

-   Now that you have a bag of tricks (tools/data structures), solve
    this problem!

#### How you will be assessed.

1.  Solve numerous programming problems.

2.  Fix broken code.

3.  Fix the performance issues.

4.  Demonstrate your understanding of how your program compiles.

#### Related Goals

-   Analyze a problem: find errors and performance issues.

-   Generate reports explaining performance issues and solutions.

-   Demonstrate a basic understanding of the Unix/Linux environment.

-   Become a competent programmer, who can get a job as a junior
    programmer.

    -   This is the last "programming class".

# New Expectations

| Class        | Expectations                                   |
|--------------|------------------------------------------------|
| CSCI 215/217 | Create simple programs in an environment with limited possible syntax errors.|
| CSCI 235     | Create simple programs from well-defined specifications, solid test cases, and example programs.|
| CSCI 325     | CSCI 235 plus group work, OOP, and generics.|
| ***CSCI 315*** | Create both simple and somewhat complex programs from well-defined specifications and create your own test cases (no example programs!).|
| CSCI 415    | Create advanced data structures, derive specifications from vague requirements, and perform basic research of emerging technologies.|


### Both Science AND Engineering

![Science vs. Engineering](/images/intro/sci-and-eng.webp "Science vs. Engineering")

"Science is about knowing, engineering is about doing."  
-[Henry Petroski](https://en.wikipedia.org/wiki/Henry_Petroski)

-   Science and Engineering are both in Computer ***Science***.

-   This course has more ***science*** than previous courses.

-   Consider which way you tend to lean.

### Do Not Drop!

![Queue](/images/intro/course-flowchart.svg "Prerequisite Chart"){width=700px .light-only}

![Queue](/images/intro/course-flowchart-dark.svg "Prerequisite Chart"){width=700px .dark-only}

### My Experience Taking this Course

![My Class Schedule](/images/intro/hayes-2005schedule.webp "My Busy Class Schedule")

-  A challenging, but rewarding class.
-  Can be successful, even with a busy schedule.

![Me, in AH 208, working on Data Structures](/images/intro/hayes-20050405-ah208.jpg "Me, in AH 208 working on Data Structures at 4:30 PM on April 5, 2005.")


### Workload

-   Most students consider this class to have the highest workload.

-   This class prepares you for work experience.

Passing Data Structures Data Structures is a ***marathon***, **not** a
*sprint*.

-   About 24 labs, 3 projects, an ethics paper, and 2
    exams.


::: warning
-   *The pass rate of a student becoming 3 weeks behind is 0%*.

-   If you are behind, please see me!
:::

![image](/images/intro/grandville_tortoise.jpg "Illustration from the 1855 edition of La Fontaine's Fables"){width=400px}



### Passing Data Structures

Advice from a student who passed D.S. and Calc. 2 together while playing
football.

-   Do some Data Structure & Calculus 2 each day.

-   Do not get behind.

-   If get stuck, ***ensure your code compiles*** to get partial credit.

-   If behind, don't try to catch up; take the 0 and move on.


## Dev. Environment

### Unix/Linux Environment

For this course, you may use any Linux environment.

-   I use Ubuntu in the *Windows Subsystem for Linux* (**WSL**).

-   Another good option is [Linux Mint](https://linuxmint.com/) within
    [VirtualBox](https://www.virtualbox.org/).  
    Make sure you ***install*** Linux.

-   Other options:

    -   [Mint](https://linuxmint.com/), [Ubuntu](https://ubuntu.com),
        [Fedora](https://getfedora.org/),
        [CentOS](https://www.centos.org/), etc., should work fine.

    -   macOS: Dual-boot with [Asahi Linux](https://asahilinux.org/).
        See [this video](https://youtu.be/10thOSWGrpc) on the setup.

    -   Windows CLI is not compatible with some required tools.

    -   Unix OSs like
        [BSD](https://en.wikipedia.org/wiki/Berkeley_Software_Distribution)
        & [Solaris](https://www.oracle.com/solaris): I haven't tried,
        but it should be fine.

See the [Computer Setup Guide](/guides/setup-overview) for more information.

### Setting up WSL with Ubuntu/Debian on Windows 11

-   Follow the [Official Installation
    Guide](https://docs.microsoft.com/en-us/windows/wsl/install) to
    install Ubuntu 24.04 or later.

-   For a lab machine, add Ubuntu in WSL from your account (ask for
    help).

-   Our lab has Windows 11 with the Windows Subsystem for Linux
    ***enabled***.

-   You will need to install Ubuntu on Windows.

-   Please login with your standard CSCI login.

-   Install Ubuntu from the Microsoft Store or by running the command:  
    `wsl --install -d ubuntu`{.bash}


### CLI Environment We will be using the Command Line Interface (CLI).

#### Why?

-   It forces you to understand more of what is actually happening.

    -   Most GUIs are "paint" on top of other programs

-   For many tasks, you can accomplish a lot more in less time.

![Geeks and repetitive tasks.](/images/intro/cli-vs-gui.svg "Geeks and repetitive tasks."){width=500px  .light-only}

![Geeks and repetitive tasks.](/images/intro/cli-vs-gui-dark.svg "Geeks and repetitive tasks."){width=500px .dark-only}

#### Terminal

-   The ***terminal*** (terminal emulator) is a text-only window in a
    graphical user interface (GUI) that emulates a console.

-   It is where we use our CLI.

-   Run whatever you want (xterm, LilyTerm, Alacritty, LXTerminal,
    Extraterm, etc.)!

Opening a Terminal

-   The terminal window shows a standard prompt.

-   Prompts display all kinds of information, but they are not part of
    the commands you are giving to your system.

![image](/images/intro/terminal-open.png "Example of opening a terminal in Linux Mint"){width=400px}


![image](/images/intro/terminal.png "Example of an open terminal window"){width=400px}

Install Required Software On your Linux box (Mint, Ubuntu, Ubuntu on
Windows), install the basic packages for our course.

```
sudo apt update
sudo apt install -y build-essential git valgrind gnuplot
```

## Git — A Version-Control System

Git:

-   Developed by [Linus
    Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds).
-   Very Popular
-   Open Source and Free!
-   Just a folder in a directory
-   Distributed -- every copy (clone) has everything.


Other Version-Control Systems:

-   Subversion (SVN)
-   Concurrent Versions System (CVS)
-   Perforce
-   Mercurial


## Getting Set Up for This Course

Before continuing, complete all of the step in the [Quickstart Guide](/guides/setup-overview).

After that, review the [Basic Unix Commands](/lectures/01-basic-unix).