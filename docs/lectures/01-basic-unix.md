Basic Unix Commands
===================

## Learning Outcomes

By the end of this lecture, you should be able to:

1.  Identify and use common Unix/Linux commands for file and directory management.
2.  Choose and operate basic text editors in a Unix environment.
3.  Understand and apply file permissions and user/group management commands.
4.  Use input/output redirection and pipes to manipulate command-line data.
5.  Utilize regular expressions for pattern matching in file operations.
6.  Locate and interpret system and user information using Unix commands.

## Text Editors

Choosing a text editor is an important step in your Unix/Linux journey. You will use your editor frequently, so investing time to learn one well will pay off.

### Types of Text Editors

- **Terminal-based editors:**  
  - *Vi, Vim, Neovim*: Lightweight, available on almost every system, but have a steep learning curve. Once learned, they are very fast and efficient.
    - See the [cheat sheets](https://vim.rtorr.com/).
    - Try `vimtutor` in the terminal for a hands-on tutorial.
  - *Emacs*: Highly customizable and powerful, but also has a learning curve.
  - *nano*: Simple and beginner-friendly, available on most systems.

- **Graphical editors:**  
  - [VS Code](https://code.visualstudio.com/): Popular, extensible, and user-friendly.
  - gVim: Graphical version of Vim.
  - Xemacs: Graphical Emacs.
  - gedit: Simple, similar to Notepad.
  - Sublime Text: Powerful, modern editor (unlimited free trial).
  - Kate, Tea, Jed: Other graphical options.

::: tip
People can be passionate about their editor of choice. Try a few and see what works best for you.
:::

### Vi, Vim, Neovim

Lightweight with a high learning curve, but *fast* once learned.

|       |                           |
|:-----:|:--------------------------|
| `:q`  | to quite from vim         |
| `:wq` | to write change and quit  |
| `:q!` | to quit without saving    |
| `ESC` | to exit from editing mode |
|  `i`  | to insert                 |
|  `x`  | to delete a char          |
| `dd`  | to delete a line          |
|  `/`  | to text search            |

-   The same on every machine.
-   See the [cheat sheets](https://vim.rtorr.com/).
-   Type `vimtutor` in the terminal for an iterative tutorial.

![Vi Meme](/images/bash/vi-meme.png "Meme emphasizing the speed and clarity users have with the tried-and-true Vi or it's directives."){width=350px"}

![Vim screenshot](/images/bash/vim.png "Example of using Vim to edit C++ code")

### EMACS (Editor MACroS)

-   Lots of features -- tons of capabilities
-   LISP
-   Your hand may be warped from all the hotkeys.
-   Not always the same on every machine

![EMACS meme](/images/bash/emacs-meme.png "EMACS is powerful and highly customizable."){width=300px"}

### nano

-   Simple! The same on every machine.
-   The commands are at the bottom of your screen.
    -   **`^`** stands for `Ctrl`.
    -   `Ctrl` + `G` displays the help screen.
-   Good for quick edits, but not powerful enough for software development.

![Nano Screenshot](/images/bash/nano.png "Example of using nano to edit C++ code."){width=400px"}

![EMACS meme](/images/bash/nano-meme.png "Don't use nano as your primary editor for coding."){width=300px"}

## Directory Operations

### `ls` -- List files and directories.

`ls` displays a list of files in the current working directory, like `dir` in DOS.

|      |                                                |
|:-----|:-----------------------------------------------|
| `-a` | Display hidden (start with a ‘`.`’) files.     |
| `-A` | Do not display ‘`.`’ and ‘`..`’.               |
|      | ‘`.`’ means current directory.                 |
|      | ‘`..`’ means upper layer directory.            |
| `-l` | Display file lists with long format.           |
| `-s` | Display file size.                             |
| `-h` | Display sizes in a more human readable format. |

### `cd` -- Change directories (change the working directory).

Usage: `cd <DIRECTORY>`  

|               |                                      |
|:--------------|:-------------------------------------|
| `cd /usr/bin` | Change the directory to `/usr/bin`.  |
| `cd ..`       | Change to the parent directory.      |
| `cd /`        | Change to the root directory.        |
| `cd ~`        | Change to the user’s home directory. |

### Making Directories

`mkdir DIRECTORY` -- Create the DIRECTORY(ies) that do not already
exist.

|                         |                                            |
|:------------------------|:-------------------------------------------|
| `mkdir temp`            | Make a directory named `temp`.             |
| `mkdir temp2`           | Make a directory named `temp2`             |
| `mkdir temp/insideTemp` | Make `insideTemp` directory within `temp`. |

### Removing Directories

`rmdir DIRECTORY` -- Remove the DIRECTORY(ies) if they are empty.

|  |  |
|:---|:---|
| `rmdir temp` | Remove a directory named `temp`. |
| `rmdir temp2` | Remove a directory named `temp2` |
| `rmdir temp/insideTemp` | Remove the `insideTemp` directory that is within `temp`. |

`rm -r DIRECTORY` -- Remove directories and their contents recursively.

### Directory Usage

-   Any command that accepts a file or folder as a parameter assumes
    that the file is in the present working directory (PWD) unless told
    otherwise.

-   Use relative or absolute paths to indicate where a file is.

-   Absolute paths start with a `/` and the path begins from the highest
    level.

-   Relative paths NEVER start with a `/` and are how to get to the file
    from the PWD.

-   `..` is your parent directory, useful in relative paths

## File Operations

### **`cp`** -- Copy SOURCE to DEST. Usage: `cp [OPTIONS] SOURCE DEST`

-   `cp data1.txt data2.txt`

-   `cp data3.txt temp`

-   Options:  

    |      |                                            |
    |:-----|:-------------------------------------------|
    | `-i` | Ask before overwrite.                      |
    | `-v` | Display copying process.                   |
    | `-R` | Recursive copy, including sub-directories. |

-   `cp -R * backup` -- Copy all files in current directory into
    `backup`.

### **`rm`** -- Remove the FILE(s).

Usage: `rm [OPTIONS] [FILES]`

-   `rm data1.txt`

-   `rm *`

-   Options:  

    |      |                                                    |
    |:-----|:---------------------------------------------------|
    | `-f` | Force remove files.                                |
    | `-r` | Recursive remove files, including sub-directories. |
    | `-v` | Display removing process.                          |


-   `rm -f *.txt` -- Removes all files ending in .txt from the current
    directory.

-   `rm -r *` -- Removes all files and folders from the current
    directory.

### Other File Operations

-   `mv` -- Move files or rename a file.

    -   `mv data1.txt ..`

    -   `mv data1.txt data4.txt`

-   `pwd` -- Print (present) working directory.

-   `file` -- Display file type.

    -   `file filename`

    -   `file *`

-   `head` -- Displays the first 10 lines of each FILE.

    -   `head data1.txt` shows first 10 lines of `data1.txt`

    -   `head -20 data1.txt` shows first 20 lines

-   `tail` -- Displays the last 10 lines of each FILE.

    -   `tail data1.txt` shows last 10 lines of `data1.txt`

-   `wc` -- Displays line count, unique *word count*, and total *word
    count* for each FILE (and a total line if more than one FILE is
    specified).

-   `find` -- Find files and directories (and perform operations on
    them).

    -   `-name` -- the filename you are looking for

    -   `-print` -- output results

    -   `find /usr -name config -print`  
        Displays where all the files named `compress` are located.

-   `grep` -- Search for PATTERNS in each FILE.

    -   Usage: `grep [OPTIONS] PATTERNS [FILE].`

-   `ln` -- Create a link to TARGET with the name LINK_NAME.

    -   Usage: `ln [OPTIONS] TARGET LINK\_NAME`

    -   `-s` Create a symbolic link.

    -   `ln -s target.txt newname.txt`

    -   More later on linking.

## Redirects

### Input/Output (I/O)

There are three standard input/output devices.

|          |                     |
|:---------|:--------------------|
| `stdin`  | keyboard input      |
| `stdout` | Monitor output      |
| `stderr` | Error output device |

![Input/Output for a Process](/images/bash/io.svg "Input/Output for a Process"){width="350px" .light-only}

![Input/Output for a Process](/images/bash/io-dark.svg "Input/Output for a Process"){width="350px" .dark-only}

The Pipe Operator (**`|`**)

-   Redirect output of one program to another.

-   For Example,  
    `ls -al /etc | more`

    ![Piping](/images/bash/io_pip.svg "The output of ls is piped as the input to more"){width="350px" .light-only}

    ![Piping](/images/bash/io_pip-dark.svg "The output of ls is piped as the input to more"){width="600px" .dark-only}

-   This can continue on

-   What Data Structure does this look like?

### I/O Redirect to Files

-   Use `<` and `>` to redirect I/Os

-   `cat > output.dat`

-   Use Ctrl-d to quit

-   `cat >> output.dat`

    -   Append new output to the end of output.dat.

-   `cat !> output.dat`

    -   Force overwrite output.dat.

-   `more` -- Pause viewing output.

    -   `ls -al | more`

    -   `more data1.txt`

    -   Type `:q` to exit.

-   `less` -- Hmmm, what does less do?

-   `cat` -- Display or *concatenate* files.

    -   `cat data1.txt | more`

    -   `cat data1.txt >> data2.txt`

    -   `cat data1.txt data2.txt >> data3.txt`

-   `tac` -- Hmmm, what does `tac` do?

### Looking up how a command works.

-   The `--help` argument displays how to use (almost) any command.

    -   `ls --help`

-   `man` -- Display the *manual* for a command.

    -   `man ls`

-   `info` -- Displays the information about a command.

    -   `info ls`

## Regular Expressions (RegEx)

Sets of special characters that help you match a pattern.  

|       |                                                      |
|:-----:|:-----------------------------------------------------|
|  `*`  | All possible combination(s)                          |
|       | `des*` – desk, desktop, description,                 |
|  `?`  | Any single character                                 |
|       | `des?` – desk, des9,                                 |
|       | `ls -al *.ps`                                        |
|       | `cat ??go`                                           |
|       | `more *a*b?`                                         |
| `[ ]` | Symbols in the square brackets                       |
|       | `ls -al [ms]oon` displays files named: moon and soon |
|       | `more [a-p]ount` displays contents of files named:   |
|       | aount, bount, count, , pount                         |

## User Administration

### User-Management Tools

-   `useradd` -- Adds a new user account to the system. Its options
    permit the sysadmin to specify the user's home directory and initial
    group or to create the user with the default home directory and
    group assignments.

-   `useradd -D` -- Displays default settings for new users

-   `useradd -G` -- Sets the system defaults for creating the users'
    home directory, account expiration date, default group, and command
    shell. See the specific options in `man useradd`. Used without any
    arguments, it displays the defaults for the system. The default set
    of files for a user are found in `/etc/skel`.

    -   `ls -al /etc/skel` -- will list the files with the defaults.

-   `userdel` -- Will completely remove a user's account (thereby
    eliminating that user's home directory and all files it contains).

-   `passwd` -- Change a user's *password*.

-   `usermod` -- Changes several user attributes. The most commonly used
    arguments are -s to change the shell and -u to change the UID. No
    changes can be made while the user is logged in or running a
    process.

-   `chsh` -- Changes the user's default shell. For Fedora, Debian, and
    others, the default shell is `/bin/bash`, known as the Bash (or
    Bourne Again Shell).

`useradd winnie -p gu1tarplayeR -s /bin/bash -u 507`


![Adding a user with a GUI](/images/bash/useradd.png "Adding a user with a GUI."){width=400px}

### Group Hug

Groups establish relationships among users where they  
share a common set of permissions.

-   All the groups are listed in `/etc/group` file.

-   Group-Management Tools:

    -   Add a new group with the `groupadd` command.  
        `groupadd www-data`

    -   Change the group ownership of a file with the `chgrp` command.  
        `chgrp www-data /srv/www`

    -   Add the approved user to the group with `usermod`.  
        `usermod -G www-data  shelley`

    -   Make `shelley` the group administrator with `gpasswd`, so that
        she can add new users to the group.  
        `gpasswd -A shelley`

### User Accounts

-   Usually, `/etc/passwd` holds user account information. Each user,
    regardless of type, will have a one-line entry of account
    information stored in this text file.

-   The superuser is known by the name *root*.

-   User IDs and Group IDs

-   File Permissions:

    |         |                                           |
    |:--------|:------------------------------------------|
    | `chgrp` | Changes the group ownership of a file.    |
    | `chown` | Changes the owner of a file.              |
    | `chmod` | Changes the access permissions of a file. |

-   The password file is `/etc/passwd`, and it is the database file for
    all users on the system. The format of each line is as follows:  
    `username:password:uid:gid:gecos:homedir:shell`  

-   Example:  

    ```txt
    root:x:0:0:root:/root:/bin/bash
    sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
    rpc:x:32:32:Portmapper RPC user:/:/sbin/nologin
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    nfsnobody:x:65534:65534:Anonymous NFS User:/var/lib/nfs:/sbin/nologin
    mailnull:x:47:47::/var/spool/mqueue:/sbin/nologin
    ```

File Permissions using **`chmod`** Try `ls -l`.  

```txt
- rwxr-xr-x joe acctg archive.sh
- rw-rw-r-- joe acctg orgchart.gif
- rw-rw-r-- joe acctg personnel.txt
- r--rw-r-- joe acctg public.html
d rwxr-xr-x joe acctg sales
- rw-r----- joe acctg topsecret.inf
- rwxr-xr-x joe acctg wordmatic
```

The first set of three letters after the file type describes the
permissions the owner of the file has.  

An `r` in the first position means you are permitted to read the file.  
A `w` in the second position means you may write to or delete the file.  
An `x` in the third position means you may execute the file.  

A hyphen represents a denied permission at its position.

File Permissions using **`chmod`** The most succinct way to use `chmod`
is with numbers. Each permission is assigned a value:  
r = 4, w = 2, x = 1, Therefore,  

|           |                 |            |
|:---------:|:----------------|:----------:|
| **Value** | **Meaning**     | **Binary** |
|     0     | No permission   |   `000`    |
|     1     | Execute only    |   `001`    |
|     4     | Read only       |   `100`    |
|     5     | Read & Execute  |   `101`    |
|     6     | Read & Write    |   `110`    |
|     7     | Full permission |   `111`    |

Using **`chmod`** With `chmod` you have three numbers: first for the
owner, second for group, third for everyone else.

Let's look at some examples.  

|          |                              |
|---------:|:-----------------------------|
|  Before: | `-rwxr-xr-x  archive.sh`     |
| Command: | `chmod 754 archive.sh`       |
|   After: | `-rwxr-xr-- archive.sh`      |
|  Before: | `-rw-r--r-- topsecret.txt`   |
| Command: | `chmod 600 topsecret.txt`    |
|   After: | `-rw------- topsecret.txt`   |
|  Before: | `-rw-------  publicity.html` |
| Command: | `chmod 665 publicity`        |
|   After: | `-rw-rw-r--  publicity.html` |

### Become Root!

-   Temporarily changing the user identity with the `su` command.  
    `su - root`

-   In many Linux distributions, the root user is disabled by default.
    Instead, `sudo` can be added to the beginning of a command to
    temporally grant the command root permissions. This gives admins
    greater control of what has the power to do anything on the system.

### System Information

-   Get the name, version, and other details about the current machine
    and the operating system.  
    `uname -a`

-   The `-a` argument stands for all. Other arguments provide more
    specific information.

## Lab 01

On Blackboard:

1.  Follow the instructions for Lab 01.

2.  This lab will be manually graded.

3.  Future labs will be submitted via your fork of the class git
    repository.

Don't forget:

0.  Submit your GitHub username on Blackboard so I can grant you access.

1.  Fork repository from GitHub.

2.  Clone your forked copy to your computer.
