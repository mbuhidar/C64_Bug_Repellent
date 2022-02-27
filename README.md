Bug Repellent is a utility printed in Ahoy! magazine
in the mid-eighties to check the accuracy of programs
typed-in from the magazine.  Line codes were printed
in the magazine after each program listing to check
against the output of Bug Repellent to quickly identify
lines that had errors.

There were three versions of Bug Repellent during the
history of Ahoy magazine.  

- Version 1 first appeared in Issue 4 (Apr84) and ended in Issue 5 (May84)
- Version 2 first appeared in Issue 6 (Jun84) and ended in Issue 40 (Apr87)
- Version 3 from Issue 41 (May87) until the end of publication

Code extensions:
- filename.ahoy: verbatim text as typed in from magazine  
- filename.prg:  program tokenized for C64 

Programs were entered, error-checked, and converted for C64
using Python tool ```retro-typein-tools``` available via
```pip3 install retro-typein-tools``` for Python 3.6 or later.

Excerpts directly from the magazines below:

******************************************************************************
C-64 BUG REPELLENT (Version 1 - Apr84-May84)
By Michael Kleinert and David Barron

If you're an Ahoy! reader, chances are that from time to time you type in
programs listed in the back. Unfortunately, man is not perfect and you've probably made errors typing them in. Another sad but true fact is that you then
had to check the nonworking programs line by line, hoping to spot your errors.
This has never been fun, and never will be.
In order to alleviate this situation, we've developed a system for the
Commodore 64 that allows for a quick check of your program. Each line is
represented by two letters. You check your code against the code listed in
Ahoy!, and if there difference, an error exists in that line. This system
allows for a fast and easy error check before running the program.

In the program listings section you'll find the program we're speaking of,
titled C-64 Bug Repellent. It is a basic loader for an assembly language
program that resides at $C000 or 49152 (all you non-assemblers stop worrying
and keep reading!). Before you start to type in a program from Ahoy!, run
Bug Repellent. It will take care of what it has to and then disappear into a
cloud of floppy disks. Once it’s run, type NEW and proceed to type in the
Ahoy! program you've selected. When that’s done, save your program (do not run
it!) and type:

SYS 49152 [RETURN]

You will be asked if you want the line value codes displayed on the screen or
dumped to the printer. If you select printer, make sure it’s on. A table of
codes will be sent to your printer. If you select screen, the table will appear
there. This table will move quickly, too quickly for most mortals. In order to
satisfy its human operators the program allows you to pause the listing. This
is done by depressing and holding the SHIFT key. To pause for an extended
period of time, depress SHIFT LOCK. As long as it’s locked, the display remains
frozen.

Compare the table your machine generates to the table in Ahoy! that follows the
program you're entering. If you spot a difference, jot down the number of the
line where the contradiction occurs. When you're done with the comparison, go
back and LIST each line where an error occurred, spot the error, and correct it.

Another nifty feature of the program is its ability to inform you as to how
many lines your program is. This is another quick way to check whether you
entered every line, or missed a few.

We hope our program makes computing a bit more enjoyable for you. Don't put up
with disgusting bugs in your programs any longer!

******************************************************************************

C-64 BUG REPELLENT (Version 2 - Jun84-Apr87)
By Michael Kleinert and David Barron

The program listed below will allow you to quickly debug any Ahoy! program up
until May 1987 you type in on your C-64.  Starting with the May 1987 issue,
a different Bug Repellent version was used.

Type in, SAVE, and RUN the Bug Repellent.  Type NEW, then type in or LOAD the
Ahoy! program you wish to check.  When it's done, SAVE your program (don't RUN
it!) and type SYS 49152 [RETURN].  You'll be asked if you want the line value
codes displayed on the screen or dumped to the printer.  If you select screen,
it will appear there.

The table will move quickly, too quickly for most mortals to follow.  To pause
the listing, depress and hold the SHIFT key.  To pause for an extended period,
depress SHIFT LOCK.  As long as it is locked, the display will remain frozen.  

Compare the table your machine generates to the table in Ahoy! that follows the
program you're entering. If you spot a difference, an error exists in the line.Jot down the numbers of lines where contradictions occur, LIST each line, spot
the errors, and correct them.

******************************************************************************

BUG REPELLENT FOR THE 64 & 128 (Version 3 - May87 onwards)
By Buck Childress

Please note: the Bug Repellent programs listed here are for Ahoy! program
published from the May 1987 issue onward! For older programs, use the older
version.

Type in, save, and run Bug Repellent. You'll be asked if you want automatic
saves to take place. If so, you're prompted for the device, DISK (D) or
TAPE (T). You then pick a starting file number, 0 through 99. Next, you enter
a name, up to 14 characters long. At this point, Bug Repellent verifies your
entries and gives you a chance to change them if you want. If no changes are
needed, Bug Repellent activates itself. (Pressing RETURN without answering the
prompts defaults to disk drive and begins your files with “OOBACKUP”

As you enter program lines and press RETURN, a Bug Repellent code appears at
the top of your screen. If it doesn’t match the code in the program listing, an
error exists. Correct the line and the codes will match.

If used, automatic saves take place every 15 minutes. When the RETURN key is
pressed on a program line, the screen changes color to let you know that a save
will begin in about three seconds. You may cancel the save by pressing the RUN
STOP key. The file number increments after cach save. It resets to 00 if 99 is
surpassed. After saving, or cancelling, the screen returns to its original color
and the timer resets for 15 minutes.

When you've finished using Bug Repellent, deactivate it by typing SYS 49152 
[RETURN] for the Commodore 64 or SYS 4864 [RETURN] for the Commodore 128.

******************************************************************************
