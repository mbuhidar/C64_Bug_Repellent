Bug Repellent is a utility printed in Ahoy! magazine
in the mid-eighties to check the accuracy of programs
typed-in from the magazine.  Line codes were printed
in the magazine after each program listing to check
against the output of Bug Repellent to quickly identify
lines that had errors.

There were three versions of Bug Repellent during the
history of Ahoy magazine.  

Version 1 first appeared in Issue 4 and ended in Issue 5.
Version 2 first appeared in Issue 6 and ended in Issue 40.
Version 3 from Issue 41 to the end of publication.

Code extensions:
filename.ahoy: verbatim text as typed in from magazine  
filename.bas:  program listing in PETSCII text  
filename.prg:  program tokenized for C64 using petcat  
filename.d64:  disk image in .d64 format

Code checked out with Bug Repellent.  (Meta - I know.)
******************************************************
C-64 BUG REPELLENT
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
