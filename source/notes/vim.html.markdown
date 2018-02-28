---

title: Vim
date: 2017-12-17 02:55 UTC
tags:

---

###Really just my Vim cheatsheet


**Auto Change Directory**

* `:set autochdir` - Tells Vim to change the pwd to whatever is holding the file being viewed. Essentially tells vim to follow you.


**Getting Help in vim**

* Please help

**Wrapping Lines**

* `:set wrap!` - toggles line wrap.

**Open files in vim**

* `$ vim file.name` - opens a file in vim or creates a new file if one doesn't exist.
* `$ vim -p file1 file2` - opens multiple files in separate tabs.
* `$ vim -p *` - opens all files in current dir in new tabs. Sub directories will be opened in Vim's explorer.


**Closing Vim**

* `:qa` - close all tabs and quit vim.
* `:wqa` - save, then close all open tabs and quit vim.


**Vim temporary files** - When configured, Vim will create backup (suffixed with a '~'), swap (with a .swp extension), and undo (suffixed with an .un extension) files.

- In your `.vimrc:`
* `set nobackup` - disables backup files
* `set noundo` - disables undo files
* `set noswapfile` - disables swap files.


**Replace**

* `r` - replace one character
* `R` - enter *replace* mode
* `ci <delimiter>` - when cursor is on `"`, `'`, `(`, `{`, etc, remove internal text and enter insert

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

**Navigation**

* `<ctrl>` + `d` - move cursor forward by 1/2 screen
* `<ctrl>` + `u` - move cursor back by 1/2 screen
* `<ctrl>` + `f` - move cursor forward by 1/2 screen
* `<ctrl>` + `b` - move cursor back by 1/2 screen
* `:<line_number>` - move cursor to specified line number
* `0` - move cursor to beginning of line
* `^` - move cursor to first character in a line


**Refresh .vimrc**

* `:source ~/.vimrc` - refresh .vimrc without exiting vim


**Selecting**

* `v` - enter VISUAL mode to select individual characters
* `V` - enter VISUAL LINE mode to select whole lines
* `<C>v` - enter VISUAL BLOCK mode to select blocks of text
* `yi<[{('">` - select all within a bracket delimited region while cursor is inside


**Manipulate Selected Text**

* `u` - convert to lowercase
* `U` - convert to uppercase

**Replace Selcted**

* `c<replacement>` - when a block is selected, use `c` to remove and enter insert mode in one step

**Search Highlighting**

* `:noh` - remove search highlights until next search is preformed
* `:nohlsearch` - remove search highlights until they are re-enabled


**Undo and Redo**

* `u`: undo last change (can be repeated to undo preceding commands)
* `<ctrl>` + `r`: Redo changes which were undone (undo the undos). Compare to `.` to repeat a previous change, at the current cursor position. `<ctrl>` + `r` (hold down Ctrl and press r) will redo a previously undone change, wherever the change occurred.


**Find and Replace**

* `:%s/foo/bar/g` - Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.
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

* `:%y` - Select and copy all into Vim's register. This copied text can only be pasted in the same instance of vim?
* `"+y` - Copy to system register (clipboard). *NB- Requires +xterm_clipboard*
* `"+p` - paste from system register (clipboard) while in Normal Mode.
* `ctrl + shift + v` - This works for pasting while in Insert Mode.

**Explorer in Vim**

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
* `]s` - Move cursor to next misspelled word.
* `[s` - Move cursor to previous misspelled word.
* `:set nospell` - Turn off spell check highlighting.

**External Commands**

* `<C-z>` - 'Pause' Vim session and open shell. `$ fg` to return to vim.

**.vimrc**

* `.vimrc` - Vim's configuration file is in the home dir by default. Can be accessed in vim with the variable $MYVIMRC

* `:so $MYVIMRC` - reload the currently active .vimrc file. `so` is short for `source`.

custom vimrc stuff:

```
nmap ,cs :let @+=expand("%")<CR>
nmap ,cl :let @+=expand("%:p")<CR>
```
* `,cs` to copy just the pwd and the file name to the clipboard. `,cl` to copy the full path to the clipboard.
