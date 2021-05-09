---

title: Unix/Linux
date: 2017-12-14 23:31 UTC
tags:

---


**GRUB** - GNU GRand Unified Bootloader is a boot loader package from the GNU project. Allows user to select between multiple OSs or kernel configurations when booting.


**Boot Loader** - A small piece of software loaded when a system is powered on that loads OS and application data from non-volatile memory into RAM.


**Package** - `.deb` files are a package type for Debian and ubuntu systems. More generally,a package is a bunch of stuff bundled together in order to make a program or utility more portable and easier to install. Instead of having a bunch of disparate files, scripts, data, and utilities that would need to be collected and put together in order to use a program, everything can be put into one entity called a *package*.


**Directory** - You used to call this a folder


**Root** - When `root` is used on it's own it almost always refers to the *root user* or *root account*, as in the system administrator's account (the only user that has complete access to every command and file on the system). When the system asks

  ```ruby
  "...are you root?"
  ```
  this is what it is referring to.

  In the context of the file system, `root` refers to the topmost level directory in which all other directories and files are located. It is designated by a bare forward slash `/`. The use of the word refers to its place at the very top of the directory tree.

  The top-level directories right beneath `root` are usually written with a `/` preceding them. This is to avoid confusion with other similarly named directories by showing their location relative to `root`. For Example `/bin` and `/usr/local/bin`. These are both *Absolute Path Names* or *Full Path Names* because they specify the directory or file's position relative to `root` and always begin with a `/`

  In a UNIX-like operating system, each process has it's own idea or model of what the root directory is. In most cases this is the same as the system's actual root directory.

  Often times, there is also a `/root` directory inside of `/`. This is not the root directory but the root user's home directory.


**Working Directory** -


**Home Directory** -


**Xenial** - The adjective half of the code name for the 16.04 LTS release of Ubuntu.

   "What fortunate timing that our next LTS should be X, because “xenial” means “friendly relations between hosts and guests”, and given all the amazing work going into LXD and KVM for Ubuntu OpenStack, and beyond that the interoperability of Ubuntu OpenStack with hypervisors of all sorts, it seems like a perfect fit."


**Symbolic Links** - In Unix/Linux OS a symbolic link (often called symlinks) is a reference to another file that cannot modify the original referenced file. The link and target can be in any location relative to one another. The symbolic link points to the file which points to an *inode*. If the original file is deleted or modified, the symlink will be broken.


**Hard Links** A file that points to an existing *inode* in the file-system.


**Parentheses in the man pages** - When looking through help or manual documentations for BASH commands, they often appear with parentheses containing a number at the end. For example, `curl(1)`, `shutdown(8)`. These are merely the sections of the manual pages where the code can be found. The numbers refer to the following sections:

    1. Common UNIX command that can be used by all users. e.g. ls(1)
    2. Unix and C system calls e.g. mmap(2)
    3. C library routines for C programs e.g. system(3)
    4. Special files e.g. sudoers(4)
    5. System file formats e.g. lmhosts(5)
    6. Games e.g. fortune(6)
    7. Miscellaneous e.g. regex(7)
    8. System administration commands that is run by root only e.g. iwconfig(8)
    9. (?Linux specific) e.g.ksoftirqd(9)

The original sections go back to the Unix Programmers Manual created by Ken Thompson and Dennis Ritchie in 1971.


**Plan 9** - An experimental research operating system born out of the Computer Science Research Center at Bell Labs. Plan 9 is based on Unix concepts but built from the ground up for networks and distributed systems (distributed systems can act as a single system).


**Sessions**


**xterm**


**xterminal**


**X Windows System**


**xserver**


**Pipeline**


**PPID**


**PGID**


**SID**


**UART** - Universal Asynchronous Receiver and Transmitter


**Terminal** An instance of a user/computer interaction environment. 'Dumb Terminals' used to be where users would interact with a mainframe machine. There was no actual relevant processing power in the terminal - just a video output and keyboard. A place of input/output. In some cases, real time input/output through a command line interface. Today on a modern OS, there are objects often      referred to as 'Terminal Emulators' which often take the form of a command line interface in a window. These are emulating the same input output experiences as the dumb terminals of olde, a place to access the machine directly with language. Today we can have an arbitrary number of these emulated terminals, all sending and receiving different information to and from the operating system.

  > I was then working on the development of APL2, a nested array, algorithmic, symbolic language, and I was committed to the idea that what we were doing with computers was making languages that were better than natural languages for procedural thought. The idea was to do for  whole ranges of human thinking what mathematics has been doing for thousands of years in the quantitative arrangement of knowledge, and to help people think in more precise and clear ways. What I saw in the Xerox PARC technology was the caveman interface, you point and you grunt. A massive winding down, regressing away from language, in order to address the technological nervousness of the user. Users wanted to be infantilized, to return to a pre linguistic condition in the using of computers, and the Xerox PARC technology's primary advantage was that it allowed users to address computers in a pre linguistic way. This was to my mind a terribly socially retrograde thing to do, and I have not changed my mind about that. - *Eben Moglem http://www.cabinetmagazine.org/issues/1/i_moglen_1.php*

  The terminal is a container for shell or any other program. When you open a terminal it will always be running some program inside of it. So, by default, when you launch Terminal you get a terminal emulator window with Bash running inside of it.

  It provides input to the program and output through 2 channels: stdout and stderr. A shell like Bash has three major modes: Login, Interactive, and Script.

  The terminal doesn't run bash commands on it's own. It lets you communicate with the Bash process that it runs.

  The terminal used to be a real, physical piece of HW in front of a user. These (physical) terminals contained none of the useful logic that a user might want to interact with, instead they were merely a keyboard (input) and a video display (output). Early terminals didn't even have a video display and instead only had a mechanical printer that printed the output onto paper. These were called teletypewriter or teletyper (later terminals with video screens were known as glass teletypes) and eventually tty for short. This name stuck and terminals (real or virtual) are still often referred to as TTYs. When a user used a TTY, they literally told the computer to literally print the output. These terms are still in use today as metaphors. When you tell a program to print output, your telling it to display it instead of writing it to a file or keep it hidden.

  These terminals were connected to a mainframe computer via a cable and this mainframe is what ran the users programs or their calculations. Usually, there were many terminals connected to one mainframe and the program that interpreted input from a terminal and passed was called a shell. The shell was just another program that was running on the big mainframe.

  Today, a terminal (or, more precisely, a terminal editor) is just a machine that passes your keystrokes to an underlying program and displaying (in some way) whatever comes back.

  The command prompt or command line is really just the little blinking cursor in the terminal where you enter commands that you want the OS or whatever specific program you're using to execute.


**Terminals vs Consoles vs Shells vs Command Line?**

  *Terminal*:
  > A piece of hardware or software that inputs to and outputs (via video display or printer) from a (usually?) general purpose computer.

  > In the modern sense, a terminal window is a GUI application, from where we can access an user's console.

  *Console*:
  > A piece of hardware that does something. A video game console is a console but not a terminal. Is a sewing machine a console?

  > An instrument panel containing the controls for a computer.

  > In a kernel context, console has another specific meaning: it's the terminal where boot messages are written.

  *Shell*:
  > An application for running commands to talk to hardware and software using language. DooM is not a shell.

  > A shell is a program that provides the traditional, text-only user interface for Linux and other Unix-like operating systems.

  *Command Line*:
  > A thing you put commands into.

  > A command line is the space to the right of the command prompt on an all-text display mode on a computer monitor (usually a CRT or LCD panel) in which a user enters commands and data.

  They are all (traditionally)  text based computer interfaces. Is there much of a difference anymore? Decades ago the shell was a program, the “terminal” was a front-end wrapper for the “shell” and the “console” was the physical connection to the computer (a keyboard and video output). Terminal and Consoles used to exclusively refer to the physical devices that a human would use to interact with a computer (including even the furniture components - a chair and desk).

  Just like with many things I've learned about computing so far, many of these terms are interchangeable and contextual. Sometimes even arbitrary. When a console or terminal is mentioned I think it is usually a purely text-based way to enter data or a command line interface being referred to. When a shell is mentioned, (usually) a text based way to pass commands, start applications, and navigate a file system all on the same window or screen is being referred to. This “Shell” is wrapped around another program. It could be a text based interface to access the program or a GUI. At this point they are all software applications.

  The terms also may or may not be related to other uses of the word. Terminal for example: airport terminal, terminal velocity, terminate, Terminus Est. Words all relating to some end or final point. I suppose computer terminal refers to where the end user interacts with the machine whether that’s by voice, gesture, or keyboard input. The final point of the machine where the human begins. Perhaps the terminal could just be a display or a microphone. Console: game console, entertainment console, console jockey. The physical object that contains the terminal? or the physical object that contains the human interacting with the console. The physical object that the user physically touches?

  * Terminal (software) - Terminals used to be physical devices ( a monitor and a keyboard). Terminals are used for entering commands and data into and displaying data from a computer. Today we use software abstractions of terminals. I think the terminal, traditionally is merely where the user interacts with the machine. It may not provide total control or the functionality of a console.

  * A shell can offer either a command line interface or a graphical user interface. It allows the user to access an os’s services. The command line interface form of a shell puts up a prompt and waits for you to type commands into it. It executes these commands then returns another prompt. Windows uses the Windows Shell which provides the familiar desktop environment: the GUI.

  * Command Line - CMD or windows Command Prompt is an example of a command line interpreter. The Command line in CMD appears in a terminal

  * Console - On Windows a Console program is one that has a console window. cmd.exe is a console program. The console in windows - cmd.exe - prompts the user (with a command prompt) to enter a text command (command line) then uses a CLI (command line interpreter) to execute the command.

  Nitrous.io has a file (text) editing component, file browsing component, console component, and a terminal component. “The Nitrous Web IDE also provides a full shell at the bottom of the screen.” The console component is inside a shell which “allows you to handle your command line tasks”. The terminal, I think, is just the console but expanded to the full screen without the graphical directory tree and text editor. In this case the console is the terminal when it shares the screen with other components. The terminal is a full Linux terminal running bash (or is the terminal inside bash?). Linux virtual machine running on a server.


**Alias** - Another name for code that already exists. For example: `shutdown now` is a command and a parameter that is already in BASH, it can be aliased to `sdn` or anything else.


**Shell Scripting** -


**Script v. Alias** -


**wget & curl** -

  > Wget is a stand-alone command line utility that's intended primarily for retrieving internet content quickly and simply.

  > Curl on the other hand is basically a terminal front end for the powerful libcurl library. Libcurl provides a very powerful set of tools for working with URLs in all their forms and flavors, and is available for almost all languages and platforms. Curl basically gives you the ability to use this library in shell scripts.


**Everything Is A File** - One of the core tenants of the Unix Philosophy. This is why your hard-drive or even your keyboard can be viewed in the filesystem like another file. These "files" can have standard file attributes such as an owner and access permissions.


**inode** A unique integer that pointed to by files on the disk. Files pointing to the same inode are representations of the same data. Data can be linked to from multiple places in a volume through hardlinks.


**DotFiles** - A file with a dot preceding the file name. Dotfiles are often used to hold configuration data for other programs as they are hidden by default, reducing clutter when viewing a projects file tree and making them less likely to be accidentally modified.
> In Unix-like operating systems, any file or folder that starts with a dot character (for example, /home/user/.config), commonly called a dot file or dotfile, is to be treated as hidden – that is, the ls command does not display them unless the -a flag (ls -a) is used. -  *Wikipedia*

```
It would be very useful if we could manage all the configuration stored in dotfiles in VCS. That way you can keep track of changes over time and restore configuration for any application to a previous state. Other benefits include backup and restore of configuration and syncing configuration to different machines.

Most dotfiles have are very simple. They are plaintext files written in a scripting language or structured data format (JSON, YAML) that exist at the root of a users home directory. The easiest approach is to just initialize a git repository in your home directory and commit changes to your dotfiles as you change them. This has a few disadvantages. Your home directory likely has vastly more data than you would ever want in a repository and it is content that you would rather not make public (sensitive).

Can we do better? Add everything to `.gitignore` and force add all directories that we want to include in our dotfiles repo? We can!

Use external applications to manage dotfiles.

Use GNU Stow to manage dotfiles. Just symlinks everything to where it should be?

Steps involved:
1. Create a `dotfiles` directory in your home directory.
```

**Vim** - **V**i **Im** proved   Vim  is  a  text editor that is upwards compatible to Vi.  It can be used to edit all kinds of plain text.  It is especially useful for editing programs. - *man vi* in Linux Terminal.


**Vi** - The ancestor of Vim, vi was written in 1976 by Bill Joy.


**POSIX** - Portable Operating System Interface (POSIX) is a set of standards encompassing APIs, command line shells, utilities, with the goal being software compatibility with variants and offshoots of Unix.


**Unix-like**


**Grep** - stands for the editor command that it simulates, g/re/p (Global Regular Expression Print). A program created by Ken Thompson for Doug McIlroy to aid in his voice synthesizer program. grep allows a user to search for a data pattern in a file without having to resort to an editor to go inside the file.


**Unix** - An operating system (but today, really more like a design philosophy) created in the late 1960s at Bell Labs by Ken Thompson and Dennis Ritchie. Characterized by a 'modular' design incorporating many small daemons and utilities that perform their specific tasks very well.
  > The shell? The Kernel? Do these count as these utilities and daemons? Could the file-system be thought of just another little utility that talks to the others that make up the operating system that could be swapped out?

  In Unix, everything is (or is presented as) a file, even hardware devices. This is why Unix uses one monolithic file structure, at which the top (bottom?) is root. Contrast this with windows where different volumes have different drive letters (There is no 'C' drive in Unix, only root).
  > DOS was never based on Unix at all, which is why Windows uses a backslash for file paths while everything else uses a forward slash. - *howtogeek.com*

  Hardware devices as files for example, in the /proc directory there is a file called cpuinfo that stores relevant information about the cpu.
  > Remember, /proc/cpuinfo isn’t actually a text file containing this information – the Linux kernel and the proc file system are exposing this information to us as a file. This allows us to use familiar tools to view and work with the information. - *howtogeek.com*


  **/dev** - In the /dev directory, you’ll find files that represent devices – as well as files that represent other special things. For example, /dev/cdrom is your CD-ROM drive. /dev/sda represents your first hard drive, while /dev/sda1 represents the first partition on your first hard drive.

Want to mount your CD-ROM? Run the mount command and specify /dev/cdrom as the device you want to mount. Want to partition your first hard drive? Run a disk-partitioning utility and specify /dev/sda as the hard disk you want to edit. Want to format the first partition on your first hard drive? Run a formatting command and tell it to format /dev/sda1.

In practice, it’s more accurate to say that “everything is a stream of bytes” than “everything is a file.” /dev/random isn’t a file, but it certainly is a stream of bytes. And, although these things technically aren’t files, they are accessible in the file system – the file system is a universal “name space” where everything is accessible.
