c000: Lc000 jsr Sc0a1 ; jump to c0a1 with return

- A:00 X:00 Y:01 SP:f2 ..-...Z.

  c0a1: Sc0a1 lda #$f7 ; load a with low byte of message data 
  c0a3:       ldy #$c0 ; load y with high byte of message data

- A:F7 X:00 Y:C0 SP:f0 N.-.....
  
    c0f7:                           93 53 43 52 45 45 4e 20 4f ; clr/hm SCREEN O
    c100:       52 20 50 52 49 4e 54 45 52 20 3f 20 00 ; R PRINTER ?  
    
  c0a5:       jsr bSTROUT ; output message at y,a=c0f7 ('screen or printer?')

  c0a8:       lda #$03 ; load a with literal $03
  c0aa:       sta $fe ; store $03 in $fe

- A:03 X:00 Y:C0 SP:f0 N.-.....
        $fe=#$03

  c0ac: Lc0ac jsr kGETIN ; load a with character from keyboard buffer

        a='S' or #$53

  c0af:       cmp #$53 ; compare a with $53 ('S' for screen)
  c0b1:       beq Lc0b9 ; if a is 'S' output message at c0??
    
    c0b9: Lc0b9 jsr kCHROUT ; output message in a, in this case 'S'
        a=#$53 

    c0bc:       lda #$04
    c0be:       ldx $fe (content is $03)
    c0c0:       ldy #$ff

- A:04 X:03 Y:FF SP:f0 N.-.....
    
    c0c2:       jsr kSETLFS ; set output channel to 3 (printer).
____________________________________________________________________

- A:04 X:03 Y:FF SP:f0 N.-.....

    c0c5:       lda #$00
    c0c7:       sta $3f
    c0c9:       sta $40
    c0cb:       sta $02
    ; insure that $02, and BASIC line number address low/high bytes

- A:00 X:03 Y:FF SP:f0 N.-.....

        $3f=#$00 (low byte of BASIC line number)
        $40=#$00 (hi byte of BASIC line number)
        $02=#$00 (unused memory location)

    c0cd:       jsr kSETNAM ; set filename

        a=#$00 (length of file name), 

    c0d0:       jsr kOPEN ; open logical file based on SETLFS and SETNAM
    c0d3:       ldx $fe ; currently $03 - redundant?
    c0d5:       jsr kCHKOUT ; open channel for output (not needed for screen)
    c0d8:       jmp Lc149

c149: Lc149 lda #$0d ; character for RETURN

- A:0D X:03 Y:FF SP:f0 N.-.....

c14b:       jmp kCHROUT ; print a return to the screen and uses RTS in routine

______________________________________________________________________________

c003:       lda $2b ; pointer to beginning of BASIC area (low byte)
c005:       sta $fb ; store BASIC pointer low byte in $fb (unused memory space)
c007:       lda $2c ; pointer to beginning of BASIC area (high byte)
c009:       sta $fc ; store BASIC pointer hi byte in $fc (unused memory space)
c00b: Lc00b ldy #$00
c00d:       sty $fe ; store $00 in $fe (unused memory space)

- A:08 X:03 Y:00 SP:f0 N.-.....
$fb=$01, $fc=$08, $fe=$00
              
c00f:       jsr Sc125 ; increment the fb/fc pointers to BASIC location 

  c125: Sc125 inc $fb ; increment BASIC pointer low byte to next character
  c127:       bne Lc12b ; if low byte is not zero, return
  c129:       inc $fc ; if low byte is zero, increment high byte and return

A:08 X:03 Y:00
$fb=$02, $fc=$08, $fe=$00

  c12b: Lc12b rts

c012:       nop
c013:       lda ($fb),y 
            ; load a with contents of byte 2 of basic mem -> a=$08             

A:08 X:03 Y:00
$fb=$02, $fc=$08, $fe=$00

c015:       bne Lc01a ; if next low byte not 0, goto c01a
c017:       xxx jmp Lc08a ; if next low byte is 0, goto c08a 

c01a: Lc01a inc $fb ; routine to increment lo/hi bytes 
c01c:       bne Lc020
c01e:       xxx inc $fc
c020: Lc020 jmp Lc02b ; goto print next line output

A:08 X:03 Y:00
$fb=$03, $fc=$08, $fe=$00

c023:       4c 49 4e 45 20 23 20 00 ; "LINE #" 
c02b: Lc02b lda #$23 ; low byte of data loc
c02d:       ldy #$c0 ; high byte of data loc
c02f:       jsr bSTROUT ; prints "LINE #"
c032:       ldy #$00
c034:       lda ($fb),y ; $fb contains pointer to byte 3 in basic mem
              a=contents of 0803 -> $0a for decimal 10
              
A:0a X:03 Y:00
$fb=$03, $fc=$08, $fe=$00

c036:       tax ; transfer a to x
c037:       inc $fb

A:0a X:0a Y:00
$fb=$04, $fc=$08, $fe=$00

c039:       bne Lc03d ; not zero so skip inc $fc
c03b:       xx inc $fc xx
c03d: Lc03d lda ($fb),y
              a=hi byte of next basic line addr-> $00
c03f:       jsr $bdcd ; prints BASIC line number to screen
              prints line number.  hi byte in a ($00), lo byte in x ($0a)
c042:       lda #$3a ; character for ":"
c044:       jsr kCHROUT ; print ":" to screeni

A:3a X:0a Y:00
$fb=$04, $fc=$08, $fe=$00
___________________________________________________________________________

c047:       lda #$00
c049:       sta $fd

***************************************************************************

c04b: Lc04b inc $fe

A:00 X:0A Y:00
$fb=04, $fc=08, $fd=00, $fe=01

c04d:       jsr Sc125

  c125: Sc125 inc $fb ; increment BASIC pointer low byte to next character
  c127:       bne Lc12b ; if low byte is not zero, return
  c129:       inc $fc ; if low byte is zero, increment high byte and return

A:00 X:0A Y:00
$fb=05, $fc=08, $fd=00, $fe=01

  c12b: Lc12b rts

c050:       nop
c051:       lda $fd ; $fd=$00
c053:       ldy #$00

A:00 X:0A Y:00
$fb=05, $fc=08, $fd=00, $fe=01

c055:       jmp Lc10d

    c10d: Lc10d jmp Lc12c

    c12c: Lc12c tax

A:00 X:00 Y:00
$fb=05, $fc=08, $fd=00, $fe=01

    c12d:       lda ($fb),y
                  a=$22 (value for " in 10 "G"

A:22 X:00 Y:00
$fb=05, $fc=08, $fd=00, $fe=01

    c12f:       cmp #$22 ; compare with quote symbol "
    c131:       xxx bne Lc139 ; ZF is 0, so don't branch

c133:       lda $02

A:00 X:00 Y:00
$fb=05, $fc=08, $fd=00, $fe=01, $02=00

c135:       eor #$ff
c137:       sta $02

    c139: Lc139 lda $02
        mem $02 contains #$ff now

A:ff X:00 Y:00
$fb=05, $fc=08, $fd=00, $fe=01, $02=ff

    c13b:       bne Lc117 ; a is not 0, so branch

         c117: Lc117 txa
           a=$00
         c118:       adc ($fb),y
           a=$00+$22=$22
         c11a:       eor $fe
           $22 xor $01 -> $23
         c11c:       tax
           x=$23
         c11d: Lc11d txa
           a=$23

A:23 X:23 Y:00
$fb=05, $fc=08, $fd=00, $fe=01, $02=ff

         c11e:       jmp Lc058

c058: Lc058 sta $fd
          $fd=$23

c05a:       lda ($fb),y
          a=$22

A:22 X:23 Y:00
$fb=05, $fc=08, $fd=23, $fe=01, $02=ff

c05c:       bne Lc04b

****************************************************************************

c04b: Lc04b inc $fe

A:22 X:23 Y:00
$fb=05, $fc=08, $fd=23, $fe=02, $02=ff

c04d:       jsr Sc125

  c125: Sc125 inc $fb ; increment BASIC pointer low byte to next character

A:22 X:23 Y:00
$fb=06, $fc=08, $fd=23, $fe=02, $02=ff

  c127:       bne Lc12b ; if low byte is not zero, return
  c12b: Lc12b rts

c050:       nop
c051:       lda $fd ; $fd=$23
c053:       ldy #$00
c055:       jmp Lc10d

    c10d: Lc10d jmp Lc12c

    c12c: Lc12c tax
    c12d:       lda ($fb),y
                  a=$47 (value for G in 10 "G"

A:47 X:23 Y:00
$fb=06, $fc=08, $fd=23, $fe=02, $02=ff

    c12f:       cmp #$22 ; compare with quote symbol "
    c131:       bne Lc139 ; not equal so branch

    c139: Lc139 lda $02
                  a=$ff
    c13b:       bne Lc117 ; a is ff, so branch

A:ff X:23 Y:00
$fb=06, $fc=08, $fd=23, $fe=02, $02=ff

         c117: Lc117 txa
           a=$23
         c118:       adc ($fb),y
           a=$47+$23=$6a
         c11a:       eor $fe
           $6a xor $02 -> $68
         c11c:       tax
           x=$68
         c11d: Lc11d txa
           a=$68

A:68 X:68 Y:00
$fb=06, $fc=08, $fd=23, $fe=02, $02=ff

         c11e:       jmp Lc058

c058: Lc058 sta $fd

A:68 X:68 Y:00
$fb=06, $fc=08, $fd=68, $fe=02, $02=ff

c05a:       lda ($fb),y
          a=$47

c05c:       bne Lc04b

**************************************************************************

c04b: Lc04b inc $fe

A:68 X:68 Y:00
$fb=06, $fc=08, $fd=68, $fe=03, $02=ff

c04d:       jsr Sc125

  c125: Sc125 inc $fb ; increment BASIC pointer low byte to next character
  c127:       bne Lc12b ; if low byte is not zero, return
  c129:       inc $fc ; if low byte is zero, increment high byte and return

A:68 X:68 Y:00
$fb=07, $fc=08, $fd=68, $fe=03, $02=ff

  c12b: Lc12b rts

c050:       nop
c051:       lda $fd
c053:       ldy #$00
c055:       jmp Lc10d

    c10d: Lc10d jmp Lc12c

    c12c: Lc12c tax

    c12d:       lda ($fb),y
                  a=$22 (value for 2nd quote in 10 "G"

A:22 X:68 Y:00
$fb=07, $fc=08, $fd=68, $fe=03, $02=ff

    c12f:       cmp #$22 ; compare with quote symbol "
    c131:       xxx bne Lc139 ; equal so don't branch

c133:       lda $02
c135:       eor #$ff
c137:       sta $02

    c139: Lc139 lda $02
                  a=$00
    c13b:       bne Lc117 ; a is 0, don't branch

A:00 X:68 Y:00
$fb=07, $fc=08, $fd=68, $fe=03, $02=00

c13d:       lda ($fb),y ; a=$22
c13f:       cmp #$20
c141:       bne Lc117 ; not equal, so branch

         c117: Lc117 txa
           a=$68
         c118:       adc ($fb),y
           a=$68+$22=$8a
         c11a:       eor $fe
           $8a xor $03 -> $89
         c11c:       tax
           x=$89
         c11d: Lc11d txa
           a=$89

A:89 X:89 Y:00
$fb=07, $fc=08, $fd=68, $fe=03, $02=00

         c11e:       jmp Lc058

c058: Lc058 sta $fd
          $fd=$89

A:89 X:89 Y:00
$fb=07, $fc=08, $fd=89, $fe=03, $02=00

c05a:       lda ($fb),y
          a=$22

c05c:       bne Lc04b ; a is not zero so branch

****************************************************************************

c04b: Lc04b inc $fe

A:22 X:89 Y:00
$fb=07, $fc=08, $fd=89, $fe=04, $02=00

c04d:       jsr Sc125

  c125: Sc125 inc $fb ; increment BASIC pointer low byte to next character

A:22 X:89 Y:00
$fb=08, $fc=08, $fd=89, $fe=04, $02=00

  c127:       bne Lc12b ; if low byte is not zero, return
  c12b: Lc12b rts

c050:       nop
c051:       lda $fd ; $fd=$89
c053:       ldy #$00
c055:       jmp Lc10d

    c10d: Lc10d jmp Lc12c

    c12c: Lc12c tax
    c12d:       lda ($fb),y
                  a=$00 (value for end of 10 "G"

A:00 X:89 Y:00
$fb=08, $fc=08, $fd=89, $fe=04, $02=00

    c12f:       cmp #$22 ; compare with quote symbol "
    c131:       bne Lc139 ; not equal so branch

    c139: Lc139 lda $02
                  a=$00
    c13b:       bne Lc117 ; a is 00, so don't branch

c13d:       lda ($fb),y
c13f:       cmp #$20
c141:       bne Lc117

A:00 X:89 Y:00
$fb=08, $fc=08, $fd=89, $fe=04, $02=00

         c117: Lc117 txa
           a=$89
         c118:       adc ($fb),y
           a=$89+$00=$89
         c11a:       eor $fe
           $89 xor $04 -> $8d
         c11c:       tax
           x=$8d
         c11d: Lc11d txa
           a=$8d

A:8d X:8d Y:00
$fb=08, $fc=08, $fd=89, $fe=04, $02=00

         c11e:       jmp Lc058

c058: Lc058 sta $fd

A:8d X:8d Y:00
$fb=08, $fc=08, $fd=8d, $fe=04, $02=00

c05a:       lda ($fb),y
          a=$00

c05c:       bne Lc04b ; ZF=0 so don't branch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A:00 X:8d Y:00
$fb=08, $fc=08, $fd=8d, $fe=04, $02=00

c05e:       lda $fd
              a=$8d  ; (should be #$8c to work)!!!
c060:       and #$f0 ; get high nibble of #$8d -> #$80
              a=$80
c062:       lsr a
c063:       lsr a
c064:       lsr a
c065:       lsr a
c066:       clc ; clear carry flag
                a=$08
c067:       adc #$41
                a=$08 + $41 => $49

A:49 X:8d Y:00
$fb=08, $fc=08, $fd=8d, $fe=04, $02=00

c069:       jsr kCHROUT ; should be $49 for I - check!
c06c:       lda $fd ; #$8d
c06e:       and #$0f ; get low nibble of #$8d -> #$0d
c070:       clc
c071:       adc #$41
                a=$0d + $41 => $4e               
c073:       jsr kCHROUT ; 
                ; should be $4d for M? Can get with extra zero at end of line


c076:       lda #$0d ; RETURN character
c078:       jsr Sc0dc ; jump to output with shift pause logic

   c0dc: Sc0dc jsr kCHROUT ; output y, a -> RETURN character
   c0df: Lc0df lda $028d ; shift key indicator
   c0e2:       and #$01 ; AND with accumulator
   c0e4:       bne Lc0df ; if a not is zero (shift held), branch to shift check
   c0e6:       rts



































































c143:       dec $fe
              $fe=$01
c145:       jmp Lc11d

         c11d: Lc11d txa
           a=$70
         c11e:       jmp Lc058

c058: Lc058 sta $fd
          $fd=#$70
c05a:       lda ($fb),y
          a=$47
c05c:       bne Lc04b



















c05e:       lda $fd
c060:       and #$f0
c062:       lsr a
c063:       lsr a
c064:       lsr a
c065:       lsr a
c066:       clc
c067:       adc #$41
c069:       jsr kCHROUT
c06c:       lda $fd
c06e:       and #$0f
c070:       clc
c071:       adc #$41
c073:       jsr kCHROUT
c076:       lda #$0d
c078:       jsr Sc0dc ; jump to output with shift pause logic
c07b:       inc $3f
c07d:       bne Lc081
c07f:       inc $40
c081: Lc081 inc $fb
c083:       bne Lc087
c085:       inc $fc
c087: Lc087 jmp Lc00b




























c143:       dec $fe
c145:       jmp Lc11d







c058: Lc058 sta $fd
c05a:       lda ($fb),y
c05c:       bne Lc04b
c05e:       lda $fd
c060:       and #$f0
c062:       lsr a
c063:       lsr a
c064:       lsr a
c065:       lsr a
c066:       clc
c067:       adc #$41
c069:       jsr kCHROUT
c06c:       lda $fd
c06e:       and #$0f
c070:       clc
c071:       adc #$41
c073:       jsr kCHROUT
c076:       lda #$0d
c078:       jsr Sc0dc ; jump to output with shift pause logic
c07b:       inc $3f
c07d:       bne Lc081
c07f:       inc $40
c081: Lc081 inc $fb
c083:       bne Lc087
c085:       inc $fc
c087: Lc087 jmp Lc00b

c08a: Lc08a lda #$99
c08c:       ldy #$c0
c08e:       jsr bSTROUT
c091:       ldx $3f
c093:       lda $40
c095:       jmp Lc0e7

c098:       60 4c 49 4e 45 53 3a 20 00 ; RTS LINES: 
c0a1: Sc0a1 lda #$f7 ; load a with low byte of message data 
c0a3:       ldy #$c0 ; load y with high byte of message data
c0a5:       jsr bSTROUT ; output message at y,a=c0f7 ('screen or printer?')
c0a8:       lda #$03 ; load a with literal $03 (end of text char??)
c0aa:       sta $fe ; store $03 in $fe
c0ac: Lc0ac jsr kGETIN ; load a with character from keyboard buffer
c0af:       cmp #$53 ; compare a with $53 ('S' for screen)
c0b1:       beq Lc0b9 ; if a is 'S' output message at c0??
c0b3:       cmp #$50 ; compare a with $50 ('P' for printer)
c0b5:       bne Lc0ac ; if a is not 'P' goto get input again
c0b7:       inc $fe
c0b9: Lc0b9 jsr kCHROUT ; output message at y,a
c0bc:       lda #$04
c0be:       ldx $fe
c0c0:       ldy #$ff
c0c2:       jsr kSETLFS
c0c5:       lda #$00
c0c7:       sta $3f
c0c9:       sta $40
c0cb:       sta $02
c0cd:       jsr kSETNAM
c0d0:       jsr kOPEN
c0d3:       ldx $fe
c0d5:       jsr kCHKOUT
c0d8:       jmp Lc149

c0db:       60 ; shift-@ character?? 
c0dc: Sc0dc jsr kCHROUT
c0df: Lc0df lda $028d ; shift key indicator
c0e2:       and #$01 ; AND with accumulator
c0e4:       bne Lc0df ; if a not is zero (shift held), branch to shift check
c0e6:       rts

c0e7: Lc0e7 jsr $bdcd ; prints line number to the screen
c0ea:       lda #$0d
c0ec:       jsr kCHROUT
c0ef:       jsr kCLRCHN
c0f2:       lda #$04
c0f4:       jmp kCLOSE

c0f7:                           93 53 43 52 45 45 4e 20 4f ; clr/hm SCREEN O
c100:       52 20 50 52 49 4e 54 45 52 20 3f 20 00 ; R PRINTER ?  
c10d: Lc10d jmp Lc12c

c110:       ea b1 fb c9 20 f0 06 ; ? reverse1 ? reverseI sp ? F? 
c117: Lc117 txa
c118:       adc ($fb),y
c11a:       eor $fe
c11c:       tax
c11d: Lc11d txa
c11e:       jmp Lc058

c121:       00 00 00 00 
c125: Sc125 inc $fb ; increment BASIC pointer low byte to next character
c127:       bne Lc12b ; if low byte is not zero, return
c129:       inc $fc ; if low byte is zero, increment high byte and return
c12b: Lc12b rts

c12c: Lc12c tax
c12d:       lda ($fb),y
c12f:       cmp #$22
c131:       bne Lc139
c133:       lda $02
c135:       eor #$ff
c137:       sta $02
c139: Lc139 lda $02
c13b:       bne Lc117
c13d:       lda ($fb),y
c13f:       cmp #$20
c141:       bne Lc117
c143:       dec $fe
c145:       jmp Lc11d

c148:       00 
c149: Lc149 lda #$0d
c14b:       jmp kCHROUT

c14e:       00 00 00 
