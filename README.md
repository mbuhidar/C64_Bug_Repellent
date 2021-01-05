Bug Repellent is a utility printed in Ahoy! magazine
in the mid-eighties to check the accuracy of programs
typed-in from the magazine.  Line codes were printed
in the magazine after each program listing to check
against the output of Bug Repellent to quickly identify
lines that had errors.

Code extensions:
repellent.ahoy: verbatim text as typed in from magazine
repellent.bas:  program listing in ASCII text
repellent.prg:  program tokenized for C64 using petcat


******************************************************
C-64 BUG REPELLENT
By Michael Kleinert and David Barron

The program listed below will allow you to quickly 
debug any Ahoy! program you type in on your C-64.

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