c000: Lc000               jsr Sc0a1
c003:                     lda $2b
c005:                     sta $fb
c007:                     lda $2c
c009:                     sta $fc
c00b: Lc00b               ldy #$00
c00d:                     sty $fe
c00f:                     jsr Sc125
c012:                     nop
c013:                     lda ($fb),y
c015:                     bne Lc01a
c017:                     jmp Lc08a

c01a: Lc01a               inc $fb
c01c:                     bne Lc020
c01e:                     inc $fc
c020: Lc020               jmp Lc02b

c023:                     4c 49 4e 45 20 23 20 00 
c02b: Lc02b               lda #$23
c02d:                     ldy #$c0
c02f:                     jsr bSTROUT
c032:                     ldy #$00
c034:                     lda ($fb),y
c036:                     tax
c037:                     inc $fb
c039:                     bne Lc03d
c03b:                     inc $fc
c03d: Lc03d               lda ($fb),y
c03f:                     jsr $bdcd
c042:                     lda #$3a
c044:                     jsr kCHROUT
c047:                     lda #$00
c049:                     sta $fd
c04b: Lc04b               inc $fe
c04d:                     jsr Sc125
c050:                     nop
c051:                     lda $fd
c053:                     ldy #$00
c055:                     jmp Lc10d

c058: Lc058               sta $fd
c05a:                     lda ($fb),y
c05c:                     bne Lc04b
c05e:                     lda $fd
c060:                     and #$f0
c062:                     lsr a
c063:                     lsr a
c064:                     lsr a
c065:                     lsr a
c066:                     clc
c067:                     adc #$41
c069:                     jsr kCHROUT
c06c:                     lda $fd
c06e:                     and #$0f
c070:                     clc
c071:                     adc #$41
c073:                     jsr kCHROUT
c076:                     lda #$0d
c078:                     jsr Sc0dc
c07b:                     inc $3f
c07d:                     bne Lc081
c07f:                     inc $40
c081: Lc081               inc $fb
c083:                     bne Lc087
c085:                     inc $fc
c087: Lc087               jmp Lc00b

c08a: Lc08a               lda #$99
c08c:                     ldy #$c0
c08e:                     jsr bSTROUT
c091:                     ldx $3f
c093:                     lda $40
c095:                     jmp Lc0e7

c098:                     60 4c 49 4e 45 53 3a 20 00 
c0a1: Sc0a1               lda #$f7
c0a3:                     ldy #$c0
c0a5:                     jsr bSTROUT
c0a8:                     lda #$03
c0aa:                     sta $fe
c0ac: Lc0ac               jsr kGETIN
c0af:                     cmp #$53
c0b1:                     beq Lc0b9
c0b3:                     cmp #$50
c0b5:                     bne Lc0ac
c0b7:                     inc $fe
c0b9: Lc0b9               jsr kCHROUT
c0bc:                     lda #$04
c0be:                     ldx $fe
c0c0:                     ldy #$ff
c0c2:                     jsr kSETLFS
c0c5:                     lda #$00
c0c7:                     sta $3f
c0c9:                     sta $40
c0cb:                     sta $02
c0cd:                     jsr kSETNAM
c0d0:                     jsr kOPEN
c0d3:                     ldx $fe
c0d5:                     jsr kCHKOUT
c0d8:                     jmp Lc149

c0db:                     60 
c0dc: Sc0dc               jsr kCHROUT
c0df: Lc0df               lda $028d
c0e2:                     and #$01
c0e4:                     bne Lc0df
c0e6:                     rts

c0e7: Lc0e7               jsr $bdcd
c0ea:                     lda #$0d
c0ec:                     jsr kCHROUT
c0ef:                     jsr kCLRCHN
c0f2:                     lda #$04
c0f4:                     jmp kCLOSE

c0f7:                                          93 53 43 52 45 45 4e 20 4f 
c100:                     52 20 50 52 49 4e 54 45 52 20 3f 20 00 
c10d: Lc10d               jmp Lc12c

c110:                     ea b1 fb c9 20 f0 06 
c117: Lc117               txa
c118:                     adc ($fb),y
c11a:                     eor $fe
c11c:                     tax
c11d: Lc11d               txa
c11e:                     jmp Lc058

c121:                     00 00 00 00 
c125: Sc125               inc $fb
c127:                     bne Lc12b
c129:                     inc $fc
c12b: Lc12b               rts

c12c: Lc12c               tax
c12d:                     lda ($fb),y
c12f:                     cmp #$22
c131:                     bne Lc139
c133:                     lda $02
c135:                     eor #$ff
c137:                     sta $02
c139: Lc139               lda $02
c13b:                     bne Lc117
c13d:                     lda ($fb),y
c13f:                     cmp #$20
c141:                     bne Lc117
c143:                     dec $fe
c145:                     jmp Lc11d

c148:                     00 
c149: Lc149               lda #$0d
c14b:                     jmp kCHROUT

c14e:                     00 00 00 
