---

title: Some Definitions
date: 2018-01-02 09:26 UTC
tags: 

---


When I started teaching myself to program, I got stuck on questions like “what exactly is a terminal? What is it the terminus of?”, or “what is the difference between a console and the command line and a shell?” This makes progress difficult when a tutorial throws these terms at you all at once. Are they all interchangeable or do they each have a unique meaning?

After feeling helpless and confused during the initial barrage of this new terminology, here are ways I think about them that make the most sense:

* Terminal (software) - Terminals used to be physical devices (a monitor and a keyboard). We use terminals to enter commands and data into and display data from a computer. Today we use software abstractions of terminals. Traditionally, I think the terminal is just where a user interacts with a computer. It may not provide total control or the functionality of a console, but is where the machine ends (terminates) and the user begins.

* Console - I think of consoles as a more general form of terminals. That is, an interface that may not even provide character input and output. Before computers had screens or keyboard input, the console was the point where a user would control the machine. A computer’s console could be as simple as a row of toggle switches. I imagine a console, whether physical or emulated, as being a low level entry point to a computer or piece of software.

* Shell - A shell can offer either a command line interface or a graphical user interface. It is a low-level OS construct that wraps (like a shell) around the kernel and It allows the user to access its services. The command line interface form of a shell displays a prompt and waits for you (or “prompts” you) to type commands into it. It executes these commands then returns another prompt.

* Command Line - The command line is where actual text commands are input. Whether you think of yourself as using the console, terminal or shell, the command line is where you are entering commands for the system.

If you’re like me, and you need to have a somewhat intuitive grasp of what someone means when they refer to a shell versus a command line or a terminal, I hope this short list can help.
