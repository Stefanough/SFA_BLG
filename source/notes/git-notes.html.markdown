---

title: Git
date: 2017-12-14 22:14 UTC
tags: 

---

Git is...

GitHub is...

`$ git commit -a -m "super important commit message"` - Stage modified files for commit (but not new files) and commit with one command.

`$ git help <command>` - help documentation for specific commands 
`$ git remote -v show` - shows remote server names and urls

**General Git Procedure**

`$ git commit -m "commitment message"`

**staging vs adding**

`$ git add` is synonymous with `$ git stage`

**Gist vs Repository**


**Git Clone Procedure**

`$ git clone <repo>` - creates a new directory with the repository's name and pulls repo's contents

**Git init Procedure**

`$ git init <name>` - creates a new directory with the `.git/` directory and its associated config files inside.

**Forking vs Cloning**

**Git ignore**

* navigate to repository
* `$ touch .gitignore` to create a .gitignore file

Does this work retroactively? If I add a filetype to .gitignore will they be removed from the repo retroactively.

- create repo with .gitignore
- commit and push to server
- create several .txt files and .md files
- commit and push to server
- add `*.md` to .gitignore

*the .gitignore does not remove items retroactively. It only prevents items from being added or commited to the repository.*


git workflow
------------
    * `git add`

Help in Windows: git help
                 git help "command"

Help in Linux: git --help
               git <command> --help

Navigation:
git rev-parse --show-toplevel     shows the top leve (root) directory for the current repo

Hella Useful:
git ls-remote --get-url           shows the remote address where data will be pushed?
git push -u origin master         pushes current changes to remote server or address


```
Try these commands:----------------------------------------------------------------------------
command---------------------------Description--------------------------------------------------
git l                             Show commit history
git show(1)                       Show various types of objects.
git instaweb(1)                   Instantly browse your working repository in gitweb.
git show-branch(1)                Show branches and their commits.
git-ls-tree(1)                    List the contents of a tree object.
git-update-index(1)               Register file contents in the working tree to the index.
git-mktree(1)                     Build a tree-object from ls-tree formatted text.
git-checkout-index(1)             Copy files from the index to the working tree.
git-for-each-ref(1)               Output information on each ref.


git-ls-files(1)                   Show information about files in the index and the working tree.


git-ls-remote(1)                  List references in a remote repository.


git-rev-list(1)                   Lists commit objects in reverse chronological order.
git-config(1)                     Get and set repository or global options.
git-checkout(1)                   Checkout a branch or paths to the working tree.
git-commit(1)                     Record changes to the repository.
git-update-index(1)               Register file contents in the working tree to the index.



ENVIRONMENT VARIABLES:
GIT_INDEX_FILE                    This environment allows the specification of an alternate index
			                            file. If not specified, the default of $GIT_DIR/index is used.

GIT_DIR                           If the GIT_DIR environment variable is set then it specifies a
			                            path to use instead of the default .git for the base of the repository.
			                            The --git-dir command-line option also sets this value.



GIT_WORK_TREE                     Set the path to the root of the working tree. This can also be
			                            controlled by the --work-tree command line option and the core.worktree
														      configuration variable.
```


-------------------------------------------------------------
create a new repository on the command line:

echo "# death" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/Stefanough/death.git
git push -u origin master

-------------------------------------------------------------
push an existing repository from the command line:

git remote add origin https://github.com/Stefanough/death.git
git push -u origin master

-------------------------------------------------------------


```
Anatomy of git command
git commit -m "message about commit here"
 |    |     |              |______________________________________
 |    |     |___________________________________                 |
 |    |___________________                     |	         |
 |                       |		       |		 |
initialize the    commiting changes    message option     describe changes
git command       to current branch                       in this commit.
```

What are the steps involved in the Git workflow?


make changes to local files (the tree)
make a commit locally to the tree object?
push that commit to the remote repository?

advantages over just keeping your working files in Google drive?


git -init : create new empty repo
