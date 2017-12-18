---

title: Vim
date: 2017-12-17 02:55 UTC
tags:

---

###Really just my Vim cheatsheet

**.vimrc**

* `.vimrc` - Vim's configuration file is in the home dir by default. Can be accessed in vim with the variable $MYVIMRC

* `:so $MYVIMRC` - reload the currently active .vimrc file. `so` is short for `source`.


**Open files in vim**

* `$ vim file.name` - opens a file in vim or creates a new file if one doesn't exist.
* `$ vim -p file1 file2` - opens multiple files in separate tabs.
* `$ vim -p *` - opens all files in current dir recursively.


**Closing Vim**

* `:qa` - close all tabs and quit vim.
* `:wqa` - save, then close all open tabs and quit vim.


**Vim temporay files** - When configured, Vim will create backup (suffixed with a '~'), swap (with a .swp extension), and undo (suffixed with an .un extension) files.

- In your `.vimrc:`
* `set nobackup` - disables backup files
* `set noundo` - disables undo files
* `set noswapfile` - disables swap files.


**Replace**

* `r` - replace one character
* `R` - enter *replace* mode


**Splits**

* `:vsp` - vertical split copying the current buffer.
* `:sp` - horizontal split copying the current buffer.
* <C-W><C-W> - switch between splits.
* <C-J> - my remap in .vimrc


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


**Visual aka Selecting**

* `v` - enter VISUAL mode to select individual characters
* `V` - enter VISUAL LINE mode to select whole lines
* `<ctrl>` + `v` - enter VISUAL BLOCK mode to select blocks of text


**Manipulate Selected Text**

* `u` - convert to lowercase
* `U` - convert to uppercase


**Search Highlighting**

* `:noh` - remove search highlights untill next search is preformed
* `:nohlsearch` - remove search highlights until they are reenabled


**Undo and Redo**

* `u`: undo last change (can be repeated to undo preceding commands)
* `<ctrl>` + `r`: Redo changes which were undone (undo the undos). Compare to `.` to repeat a previous change, at the current cursor position. `<ctrl>` + `r` (hold down Ctrl and press r) will redo a previously undone change, wherever the change occurred.


**Find and Replace**

* `:%s/foo/bar/g` - Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.
* `:%s/\\//gc` - Find each occurrence of '\\' (single backslash) and replace with no character but ask for confirmation first.
* `:%s/\n\n/\r/gc` - Find each occurrence of two consecutive newlines? and replace with single newline (change double space into single space).
* `:%s/\n / /gc` - Find each occurrence of a newline and remove (change double space to single space) but ask for confirmation first.
* `:s/foo/bar/g` - Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
* `:%s/foo/bar/gc` - Change each 'foo' to 'bar', but ask for confirmation first.
* `:%s/\<foo\>/bar/gc` - Change only whole words exactly matching 'foo' to 'bar'; ask for confirmation.


**Repeat Last Command**

* `@` repeats the last command-line change (a command invoked with the `:`)


**Insert Date and Time**

* `:pu=strftime('%c')` - Formated as 'Sat 01 Jul 2017 06:20:05 PM PDT'


**Copying and Pasting**

* `:%y` - Selct and copy all into Vim's register. This copied text can only be pasted in the same instance of vim?
* `"+y` - Copy to system register (cliboard). *NB- Requires +xterm_clipboard*
* `"+p` - paste from system register (clipboard) while in Normal Mode.
* `ctrl + shift + v` - This works for pasting while in Insert Mode.
