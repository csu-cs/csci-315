Computer Setup Overview
=======================

In the early lectures and posted video on WSL, we discuss how to set up your
computer for this course. This is just a summary of the process for quick
reference. For details consult the lecture slides and videos.

Linux Environment
-----------------

For this course, you will use any Linux environment you choose. I will use a
Debian-based distribution like Ubuntu, so you may want to do the same to match
the examples.

Recommendations:

-   For Windows, use *Ubuntu 24.04* (or newer) or *Debian* on the [Windows 
    Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install). 
    See [this video on the setup](https://youtu.be/ID4DNOuGujA).

    <div class="youtube">
    <div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/ID4DNOuGujA?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
    </div>

-   For macOS on Apple Silicon, you have two options:
    1.  Dual-boot with [Asahi Linux](https://asahilinux.org/). See
        [this video on the setup](https://youtu.be/10thOSWGrpc).
    2.  Run Ubuntu in a VM using [UTM](https://mac.getutm.app/). See [this guide
        for the setup process](https://osxdaily.com/2024/07/08/how-to-run-ubuntu-linux-on-apple-silicon-mac/).

-   For macOS with an Intel CPU, you can use Ubuntu dual-boot or use a Virtual
    Box VM.

Install Software Tools
----------------------

If you are using a Debian-based distribution, like Ubuntu, run the following
commands.

```bash
sudo apt update
sudo apt -y install build-essential git valgrind gnuplot
```

While you are at it, you may want to update any other outdated packages with
this command.

```bash
sudo apt upgrade
```

Git
---

Most of all the assignments and resources will be accessed and submitted via the
course repository.

1.  Install git in your Linux environment (as shown in the previous section).

2.  Set the global git configuration. Replace what is in the double quotes
    below.

    ```bash
    git config --global credential.helper store  
    git config --global user.name "Your Name"  
    git config --global user.email "you@student.csuniv.edu"
    ```

    :::warning
    Passwords will be saved as plain text on your computer.
    :::


3.  Create a [GitHub](https://github.com/) account (if needed) and log
    in. Submit your username to your instructor via Blackboard (Lab 0).

4.  Create a [GitHub Personal Access Token
    (Classic)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
    to use as a password when pushing and pulling. (There are other
    authentication methods you may use instead, but public access tokens are the
    simplest to set up.)

    -   I suggest selecting "No expiration" for the token expiration.
    -   Select only `repo` as the scope of the token.

### Set Up Personal Fork of the Repository

You are now ready to use the git repository for this course, which is hosted on
GitHub.

1.  Click the email link to become a collaborator with the course repository.

2.  Fork the [course repository](https://github.com/csu-cs/CSCI-315-2025-Fall/).

3.  Clone your fork of the class repository.

    ```shell
    git clone <your_repo>
    ```

4.  Change directories to be within your repository.

    ```shell
    cd <your_repo>
    ```

5.  Set the merge method when pulling changes.

    ```shell
    git config pull.rebase false
    ```

### Add the course repository as an upstream remote to your local repository.

A remote is a copy of the repository in a different location (usually a server)
that you may pull updates from and push your committed changes to. You cannot
push changes to the course repository, but, throughout the semester, you must
pull updates from the course repository to your forked repository.

![Adding an Upstream Repository](/images/setup/upstream_repo.svg){width=400px .light-only}

![Adding an Upstream Repository](/images/setup/upstream_repo-dark.svg){width=400px .dark-only}

1.  In the command line, use `cd` to set the current working directory to
    the root of your repository.

    ```bash
    cd <your_repo>
    ```

2.  Check your current remotes. Before adding a new remote, you should see 
    only two links that point to your fork on GitHub after typing this command.

    ```bash
    git remote -v
    ```

3.  Add the course repository as a new remote named upstream.

    ```bash
     git remote add upstream https://github.com/csu-cs/CSCI-315-2025-Fall.git
    ```

4.  Set the merging method for divergent branches.

    ```bash
    git config pull.rebase false # merge
    ```

5.  Confirm it is working by pulling the latest changes.

    ```bash
     git pull upstream master
    ```

6.  Save those updates (if any) to your fork on GitHub.

    ```bash
     git push
    ```

### Add a Webhook to the Auto-Grader

See the instructions in Lab 5.

### Golden 6 Commands of Git

| **Command**    | **Purpose**                                                 |
|:--------------:|-------------------------------------------------------------|
| `init`         | create a new local repository                               |
| `clone <repo>` | make a copy of a repository                                 |
| `add <file(s)>`     | add one or more files to the staging area (index)      |
| `commit -m "<message>` | save the files permanently in the version history with a message |
| `push`         | sync the local repository to a remote repository            |
| `pull`         | receive content from a remote repository                    |
