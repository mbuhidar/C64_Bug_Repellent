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
filename.ahoy: verbatim text as typed in from magazine  
filename.prg:  program tokenized for C64 

Excerpts from the magazines below:

******************************************************
C-64 BUG REPELLENT (Version 2 - Jun84-Apr87)
By Michael Kleinert and David Barron

The program listed below will allow you to quickly 
debug any Ahoy! program up until May 1987 you type
in on your C-64.  Starting with the May 1987 issue,
a different Bug Repellent version was used.

Type in, SAVE, and RUN the Bug Repellent.  Type NEW,
then type in or LOAD the Ahoy! progrnm you wish to
check.  When it's done, SAVE your program (don't RUN
it!) and type SYS 49152 [RETURN].  You'll be asked
if you want the line value codes displayed on the 
screen or dumped to the printer.  If you select screen,
it will appear there.

The table will move quickly, too quickly for most
mortals to follow.  To pause the listing, depress and 
hold the SHIFT key.  To pause for an extended period,
depress SHIFT LOCK.  As long as it is locked, the 
display will remain frozen.  

Compare the table your machine generates to the table
in Ahoy! that follows the program you're entering.
If you spot a difference, an error exists in the line.
Jot down the numbers of lines where contradictions
occur, LIST each line, spot the errors, and correct
them.
******************************************************
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
prompts defaults to disk drive and begins your files with “OOBACKUP”)

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
******************************************************
