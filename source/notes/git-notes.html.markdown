---

title: Git
date: 2017-12-14 22:14 UTC
tags: 

---

**Go back one commit**

1. `$ git reset HEAD~`
   - This command moves the HEAD back one commit but leaves changes associated with that commit preserved on disk. This is equivalent to passing the `--soft` tag which is the default behavior. If you want to revert the repository's state on disk back to the way it looked with the previous commit, pass the `--hard` flag with the command.
2. *do stuff to files*
3. `$ git add .`
   - Re-add all changes in tracked files.
4. `$ git commit -m '<message>'`
   - New commit message for the corrected commit.

**Untrack an already tracked file after modification**

`$ git rm  --cached <filename>`

**Undoing git rm**

1. `$ git reset`
2. `$ git checkout -- $(git ls-files -d)`

*git log** - view commit history

**Staging Area**
**working directory**

**Clean directory** - what is a clean directory?

**Committing** - Committing is kind of like a meta-save. You're committing changes you've made to code to the branch you're working in. Like a snapshot of the current state of the code.

If I have a master branch and I make a checkout a new branch `styling_fix`. I make some changes and save those to the project files but I don't commit. The state of the code is still the "current state" from when made the new branch. If I switch back to `master` branch has the state of any of the branches changed? No. I can switch between branches and the files will remain unchanged.

If I go back into branch `styling_fix` and commit the changes, the state change has been recorded. I can switch back to master and see the project files in a different state.

`$ git branch -d <branch>` - Delete unwanted branch.

`$ git branch` - view available branches and current working branch.

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

*the .gitignore does not remove items retroactively. It only prevents items from being added or committed to the repository.*

git workflow
------------
    * `git add`

Help in Windows: git help
                 git help "command"

Help in Linux: git --help
               git <command> --help

Navigation:
git rev-parse --show-toplevel     shows the top level (root) directory for the current repo

Hella Useful:
git ls-remote --get-url           shows the remote address where data will be pushed?
git push -u origin master         pushes current changes to remote server or address

```ps
Try these commands:------------------------------------------------------------------
command-----------------Description--------------------------------------------------

git l                   Show commit history
git show(1)             Show various types of objects.
git instaweb(1)         Instantly browse your working repository in gitweb.
git show-branch(1)      Show branches and their commits.
git-ls-tree(1)          List the contents of a tree object.
git-update-index(1)     Register file contents in the working tree to the index.
git-mktree(1)           Build a tree-object from ls-tree formatted text.
git-checkout-index(1)   Copy files from the index to the working tree.
git-for-each-ref(1)     Output information on each ref.


git-ls-files(1)         Show information about files in the index and the working tree.


git-ls-remote(1)        List references in a remote repository.


git-rev-list(1)         Lists commit objects in reverse chronological order.
git-config(1)           Get and set repository or global options.
git-checkout(1)         Checkout a branch or paths to the working tree.
git-commit(1)           Record changes to the repository.
git-update-index(1)     Register file contents in the working tree to the index.



ENVIRONMENT VARIABLES:
GIT_INDEX_FILE          This environment allows the specification of an alternate index
		        file. If not specified, the default of $GIT_DIR/index is used.

GIT_DIR                 If the GIT_DIR environment variable is set then it specifies a
		        path to use instead of the default .git for the base of the
                        repository. The --git-dir command-line option also sets this value.



GIT_WORK_TREE           Set the path to the root of the working tree. This can also be
		        controlled by the --work-tree command line option and the core.work
                        tree configuration variable.
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
 |    |___________________                     |                 |
 |                       |                     |                 |
initialize the    commiting changes    message option     describe changes
git command       to current branch                       in this commit.
```

What are the steps involved in the Git workflow?


make changes to local files (the tree)
make a commit locally to the tree object?
push that commit to the remote repository?

advantages over just keeping your working files in Google drive?


git -init : create new empty repo

**Add colleague** -
`$ git remote add <alias> <url>` - Adds an upstream remote called 'alias' at the url.
`$ git pull <alias> master` - pulls from the master branch of the remote called 'alias'