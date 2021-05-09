---

title: Vim
date: 2017-12-17 02:55 UTC
tags:

---

# Vim Notes

## Questions
* How to manage pwd? set, modify, etc
* How to install and use multiple versions of Vim
* How to build from source?
  * Include changes at https://github.com/vim/vim/pull/5061
* Search within a project directory?
* Project Drawer?
* modeline?

## Basics

### Modes
Vim is modal, duh!
- normal mode
- `i`nsert mode
- `r`eplace mode
- `v`isual selection mode
- insert normal mode -- `<C-o>` while in insert mode to enter normal mode where one command can be executed before returning to insert mode automatically.
- `:`, `/` Command Mode (or _ex_ mode). These are commands prefixed by `:` or `/`. After running the command, the editor will imediately return to normal mode

### Buffers

### Registers

### Operators
Operators are the commands issued to Vim. `d` is the delete operator and when followed by another, will delete a specified amount of text.

### Setting Options
the `:set` ex command is used to change settings for current vim session for the current vim buffer. `:set`
Options can be
* A boolean that can be toggled.
* A string value.
* A list of flags where flags can be added (`+=`), removed (`-=`), or the list can be overwritten (`=`).

#### formatoptions
view format options with `:set formatoptions ?`. Vim's default flags are `tqlnr`.
view available formatoptions flags with `:help fo-table`.

## Really just my Vim cheat sheet

**Getting Help in Vim**
* `:h<CR>` - open the main help file for Vim.

**How to Read Vim Help Files**

**Navigation**
* `<C-o>` backwards in list (jump list) of previous line positions only after explicitly navigating by line number.
* `<C-i>` forwards in list of previous line positions.
* `<m-a>` - marks a spot in a file that can be returned to. `\`-a\` returns to that position.
* `g;` - Move backwards in change list.
* `g,` - Move forwards in change list.

**Scrolling Relative to Cursor**
* `z<CR>` - redraw view with current line at the top of the window.
* `zz` - bring current line to middle of the view.
* `zb` - bring current line to the bottom of the view.

**File System Location**
* `<C-g>`, `:f`  - Print truncated path of current file in Vim command line.
* `1 <C-g>`, `:f!` - Print full path of current file in Vim command line.
* `:pwd` - print current working (project) directory.

**Auto Change Directory**

* `:set autochdir` - Tells Vim to change the pwd to whatever is holding the file being viewed. Essentially tells Vim to follow you.


**Wrapping Lines**

* `:set wrap!` - toggles line wrap.

**Line Break**

* `:set linebreak` - break lines on whole words.:

**Open files in Vim**

* `$ vim file.name` - opens a file in Vim or creates a new file if one doesn't exist.
* `$ vim -p file1 file2` - opens multiple files in separate tabs.
* `$ vim -p *` - opens all files in current dir in new tabs. Sub directories will be opened in Vim's explorer.


**Closing Vim**

* `:qa` - close all tabs and quit Vim.
* `:wqa` - save, then close all open tabs and quit Vim.


**Vim temporary files** - When configured, Vim will create backup (suffixed with a '~'), swap (with a .swp extension), and undo (suffixed with an .un extension) files.

- In your `.vimrc:`
* `set nobackup` - disables backup files
* `set noundo` - disables undo files
* `set noswapfile` - disables swap files.


**Replace**

* `r` - replace one character
* `R` - enter *replace* mode
* `ci<delimiter>` - when cursor is on `"`, `'`, `(`, `{`, etc, remove internal text and enter insert

**Splits**

* `:vsp` - vertical split copying the current buffer.
* `:sp` - horizontal split copying the current buffer.
* `<C-W><C-W>` - switch between splits.
* `nmap <C-J> <C-W><C-W>` - my remap in .vimrc
* `<C-w> T` - Move current split window to a new tab.


**Line Manipulation**

* `J` - Join (remove newline character) selected lines or line that the cursor is on with the line below *with* added whitespace.
* `gJ` - Join selected lines without added whitespace


**Tabs**

* `gt` - switch to next tab
* `tabedit <file>` - edit specified file in new tab
* `:ls` to get buffer number `N` `:tabnew +Nbuf` to reopen closed tab `N`.

**Navigation**

* `<ctrl>` + `d` - move cursor forward by 1/2 screen
* `<ctrl>` + `u` - move cursor back by 1/2 screen
* `<ctrl>` + `f` - move cursor forward by 1/2 screen
* `<ctrl>` + `b` - move cursor back by 1/2 screen
* `:<line_number>` - move cursor to specified line number
* `0` - move cursor to beginning of line
* `^` - move cursor to first character in a line


**Refresh .vimrc**

* `:source ~/.vimrc` - refresh .vimrc without exiting Vim


**Selecting**

* `v` - enter VISUAL mode to select individual characters
* `V` - enter VISUAL LINE mode to select whole lines
* `<C>v` - enter VISUAL BLOCK mode to select blocks of text
* `yi<[{('">` - select all within a bracket delimited region while cursor is inside


**Manipulate Selected Text**

* `u` - convert to lowercase
* `U` - convert to uppercase

**Replace Selected**

* `c<replacement>` - when a block is selected, use `c` to remove and enter insert mode in one step

**Search Highlighting**

* `:noh` - remove search highlights until next search is preformed
* `:nohlsearch` - remove search highlights until they are re-enabled


**Undo and Redo**

* `u`: undo last change (can be repeated to undo preceding commands)
* `<ctrl>` + `r`: Redo changes which were undone (undo the undos). Compare to `.` to repeat a previous change, at the current cursor position. `<ctrl>` + `r` (hold down Ctrl and press r) will redo a previously undone change, wherever the change occurred.


**Find and Replace**

* `:%s/foo/bar/g` - Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.
* `:.,$s/foo/bar/g` - Find and replace 'foo' with 'bar' from the current to the last line.
* `:%s/\\//gc` - Find each occurrence of '\\' (single backslash) and replace with no character but ask for confirmation first.
* `:%s/\n\n/\r/gc` - Find each occurrence of two consecutive newlines? And replace with single newline (change double space into single space).
* `:%s/\n / /gc` - Find each occurrence of a newline and remove (change double space to single space) but ask for confirmation first.
* `:s/foo/bar/g` - Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
* `:%s/foo/bar/gc` - Change each 'foo' to 'bar', but ask for confirmation first.
* `:%s/\<foo\>/bar/gc` - Change only whole words exactly matching 'foo' to 'bar'; ask for confirmation.
* `:%s/\s\+$//gc` - remove all trailing whitespaces and ask for confirmation


**Repeat Last Change**

* `@` repeats the last command-line change (a command invoked with the `:`)
* `.` Period repeats the last change made in normal mode (and insert mode?)

**Insert Date and Time**

* `:pu=strftime('%c')` - Formatted as 'Sat 01 Jul 2017 06:20:05 PM PDT'


**Copying and Pasting**

* `:set paste` enter paste mode to paste text in insert mode without unwanted indentations.
* `:set nopaste` exit paste mode.

* `:%y` - Select and copy all into Vim's register. This copied text can only be pasted in the same instance of Vim?
* `"+y` - Copy to system register (clipboard). *NB- Requires +xterm_clipboard*
* `"+p` - paste from system register (clipboard) while in Normal Mode.
* `yi<delimiter>` - copy everything between delimiter (`'`, `"`, `(`, for example)
* `ctrl + shift + v` - This works for pasting while in Insert Mode.
* `P` - paste from Vim's register before cursor.
* `p` - paste from Vim's register after cursor.


**Registers for Copy/Paste**

* `"<char>y` - yank to the register named by the given character.
* `"<char>p` - paste from the register named by the given character.


**Paste to Command Line**

* `<C-R><char>` - while in the command line `:` paste from the given register.
* `<C-R>"` - in the cl, paste from the default register (what you yank to with `y` or `d`).


**netrw explorer in Vim**

* `:Explore` - Open Vim's built-in file explorer in the current window. If the current file has unwritten modifications, the window will be split horizontally. Use Vim navigation and press `Enter` to open a file or dir.
* `:Explore!` - Same as above but splits the window vertically.
* `:Sexplore` - Always splits the window (horizontally bu default) and opens the explorer.
* `:Sexplore!` - Same as above but on a vertical split
* `:Texplore` - Creates a new tab and opens the explorer.
* `r` - Reverse sort order of items.
* `%` - Create new file in the explorer. Interactive file naming included.
* `d` - Create new dir in the current dir.

**Spell Checking in Vim**

* `:setlocal spell spelllang=en_us` - Activate spell check and specify the language.
* `:set spell` - Turn on spell check.
* `]s` - Move cursor to next misspelled word.
* `[s` - Move cursor to previous misspelled word.
* `:set nospell` - Turn off spell check.
* `:set spellfile=~/.vim/spell/en.utf-8.add` - set the location of the spell file.
* `zg` - add word to spell file
* `z=` - Interactive lookup of misspelled word in dictionary including spell file.
* `zw` - Mark the word as _wrong_. If it already exists in your spell file it will be turned into a comment line.

**Environment Variables**
* `:echo $MYVIMRC` - expand environment variable in Vim command line.
* `$MYVIMRC` - working `.vimrc` file.

**External Commands**

* `<C-z>` - 'Pause' Vim session and open shell. `$ fg` to return to Vim.

**.vimrc**

* `.vimrc` - Vim's configuration file is in the home dir by default. Can be accessed in Vim with the variable $MYVIMRC

* `:so $MYVIMRC` - reload the currently active .vimrc file. `so` is short for `source`.

Custom vimrc stuff:

```
nmap ,cs :let @+=expand("%")<CR>
nmap ,cl :let @+=expand("%:p")<CR>
```
* `,cs` to copy just the pwd and the file name to the clipboard. `,cl` to copy the full path to the clipboard.

**File Recovery**
If work is lost, a swap file `.swp` may be able to help recover some changes.
* `:rec <path/to/swap/file>` - Will try to recover from swap.

**Recording Macros**
* `q<a-z>` - Press `q` to begin recording then a letter `<a-z>` for the specified register. Press `q` again to stop recoding.
* `@<a-z>` - Press `@` and then specified register `<a-z>` to play back the recorded macro.
* `@@` - Replay last played recorded macro.

## Display/Appearance

**Line Numbers**
* `:set nu!` - toggle visible line numbers.
* `:set relativenumber!` - toggle relative line numbers.

## Plugins

**NERDtree**

* `m` - press `m` in NERDtree to show the file system menu

