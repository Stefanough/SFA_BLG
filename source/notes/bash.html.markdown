---

title: Bash
date: 2017-12-28 22:46 UTC
tags:

---

**Scrolling in Bash**

* `Ctrl` + `Shift` + `up` - scroll up by one line
* `Ctrl` + `Shift` + `down` - scroll down by one line
* `Shift` + `PageUp` - scroll up one whole page
* `Shift` + `PageDown` - scroll down one whole page

**grep**

* `$ grep <pattern> ./*` - grep all files in current directory.

**Return to Previous Directory**

* `$ cd -`

**Installing/Uninstalling programs**

* `$ sudo apt remove <application_name>` - Removes all packaged data, but leaves small (modified) user config files behind, in case the remove was an accident.
* `$ sudo apt purge <application_name>` -  You can get rid of these leftovers by calling `purge` even on already removed packages. Note that this does not affect any data or configs stored in your home directory.

**Creating and Populating files**

* `$ touch <file_name>` - create new file
* `$ echo "This text will show up in a new file like magic!" > new_file.txt` - create a new file and populate with text

**APT commands**

* `$ sudo apt-add-repository <repo>` - add a package provider
* `$ apt list --installed` - list all installed packages

**Command Chaining and Piping**

* `$ sudo apt list update && apt list --upgradable` - update package list and list upgradable packages, two commands in succession.
* `$ <command> && <command>` - The general way to chain commands.
 * `&&` executes the right-hand command of `&&` only if the previous one succeeded.
 * `||` executes the right-hand command of `||` only it the previous one failed.
 * `;` executes the right-hand command of `;` always regardless whether the previous command succeeded or failed. Unless set -e was previously invoked, which causes bash to fail on an error.

**Formatting, Partitioning, and Other Disk Things**

* `$ fdisk -l | grep '^Disk'` - List All Detected Physical Disks

**List Partitions**

* `$ fdisk -l` - all disk partitions
* `$ fdisk -l /dev/sdb` - single disk partitions

**Safely Remove USB Drive**

* `$ udisksctl power-off -b /dev/sd*` - where `*` is the letter corresponding to the removable drive

**View Disk Status**

* `$ df`

**Unzip a .tgz package**

* `$ tar -xzvf /path/to/your/file.tgz`
 * `x` for extract
 * `v` for verbose mode
 * `z` for gnuzip
 * `f` for file and should come right before file name

**Zip a directory**

* `$ zip -r foo foo` creates foo.zip which contains all the files and directories inside the directory foo/ in the current directory.

**Run Process in Background**

* `$ <command> &` appending an & to the end of a command runs it in a subshell

**create directory and cd into it**

* `$ mkdir <directory_name> && cd $_`

**recursively make a directory accessible:**

* `$ sudo chown -R real_stefan: .bundle`

**Packaging Multiple Files**

* `$ for i in */; do zip -r "${i%/}.zip" "$i"; done` - loops through files in current directory and adds them to the package.

**Restart Wifi**

* `$ sudo service network-manager restart`

**Edit Path**

* Firstly, check your original path: `$ echo $PATH`
* It should show something like this: `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games`
* Now add your program to that path, ensuring your using the entire path all the way from / to your program: `$ export PATH=$PATH:/path/to/my/program`
* This sets your PATH variable to the existing PATH plus what you add to the end. Check that it has been added: `$ echo $PATH`

**Three Random Words**

* `$ shuf usr/share/dict/words | head -n3`

**mv**

* `$ mv <source> <target_directory>` - rename `source` to `dest` or move `source` to `directory`

**move or copy multiple files**

* `$ mv -t <target_directory> file1 file2 file3` - move multiple files to target
* `$ cp -t <target_directory> file1 file2 file3` - copy multiple files to target

**rename file**

* `$ mv <file_oldname> <file_newname>`

**rename directory**

* `$ mv ~/old_dir ~/new_dir`

**cp**

* `$ cp <source> <target_directory>` - copy file from source directory

**empty trash**

* `$ trash-empty` - NB: requires trash-cli package

**read standard terminal output to clipboard**

* `$ <command> | xsel -ib` - NB: requires xsel package

**Install a `.deb` package**

* `$ sudo dpkg -i /path/to/package.deb` to install package
* `$ sudo apt-get install -f` to fix any dependencies

**Suspend from Command Line**

* `$ systemctl suspend` without root privileges
* `$ sudo pm-suspend` requires root privileges

**Give Execute Permission to a File or Script**

* `$ chmod +x /path/to/your_script_or_file.sh`

**Reset bash after modifying bash dotfile (or other things)**

* `$ exec bash`

**Read Standard Terminal Output to Vim**

* `$ <command> | vim -`

**See File info**

* `$ stat <file.name>`
* `$ file <file.name>`

**Remove Files/folders**

* `$ rm <file.name>` - deletes a file
* `$ rm -r <directory>` - deletes a non-empty directory and all of its contents
* `$ shred <file.name>` - over writes file with random bytes a default of three times without removing the file
* `$ shred -z <file.name>` - the same as above but writes zeros as the final step
* `$ shred -u <file.name>` - shreds and removes the file.
* `$ srm <file.1> <file.2>` - securely removes files or directories

**Searching From the Command Line**

**ls**

* `$ ls *.<extension>` - list all files of specific extension in current directory
* `$ ls *.{<extension1>,<extension2>}` - list all files of multiple extensions

**find**

* `$ find directory/to/search -name 'name_of.file'`
* `$ find . -name 'name_of.file'` - begins search in current directory, must be exact file name including extension
* `$ find . -iname '*.zip'` - begins search in current directory and lists all zip files
* `$ find . -maxdepth <x> -name "*~"` - finds all files with a file name that contains a "~" at a depth of <x> nested directories.
* `$ find . -maxdepth <x> -name "*.filetype" -delete` - finds and deletes all files of a specific file type at a depth of <x> nested directories.

**locate**

* `$ locate "pattern"` - search all visible directories for pattern
>* NB: `locate` uses a cache of the file system. Files are cached infrequently and therefore a newly created file may not be found by `locate`