Lc000               jsr Sc0a1
                    lda $2b
                    sta $fb
                    lda $2c
                    sta $fc
Lc00b               ldy #$00
                    sty $fe
                    jsr Sc125
                    nop
                    lda ($fb),y
                    bne Lc01a
                    jmp Lc08a
                    
Lc01a               inc $fb
                    bne Lc020
                    inc $fc
Lc020               jmp Lc02b
                    
                    4c 49 4e 45 20 23 20 00 
Lc02b               lda #$23
                    ldy #$c0
                    jsr bSTROUT
                    ldy #$00
                    lda ($fb),y
                    tax
                    inc $fb
                    bne Lc03d
                    inc $fc
Lc03d               lda ($fb),y
                    jsr $bdcd
                    lda #$3a
                    jsr kCHROUT
                    lda #$00
                    sta $fd
Lc04b               inc $fe
                    jsr Sc125
                    nop
                    lda $fd
                    ldy #$00
                    jmp Lc10d
                    
Lc058               sta $fd
                    lda ($fb),y
                    bne Lc04b
                    lda $fd
                    and #$f0
                    lsr a
                    lsr a
                    lsr a
                    lsr a
                    clc
                    adc #$41
                    jsr kCHROUT
                    lda $fd
                    and #$0f
                    clc
                    adc #$41
                    jsr kCHROUT
                    lda #$0d
                    jsr Sc0dc
                    inc $3f
                    bne Lc081
                    inc $40
Lc081               inc $fb
                    bne Lc087
                    inc $fc
Lc087               jmp Lc00b
                    
Lc08a               lda #$99
                    ldy #$c0
                    jsr bSTROUT
                    ldx $3f
                    lda $40
                    jmp Lc0e7
                    
                    60 4c 49 4e 45 53 3a 20 00 
Sc0a1               lda #$f7
                    ldy #$c0
                    jsr bSTROUT
                    lda #$03
                    sta $fe
Lc0ac               jsr kGETIN
                    cmp #$53
                    beq Lc0b9
                    cmp #$50
                    bne Lc0ac
                    inc $fe
Lc0b9               jsr kCHROUT
                    lda #$04
                    ldx $fe
                    ldy #$ff
                    jsr kSETLFS
                    lda #$00
                    sta $3f
                    sta $40
                    sta $02
                    jsr kSETNAM
                    jsr kOPEN
                    ldx $fe
                    jsr kCHKOUT
                    jmp Lc149
                    
                    60 
Sc0dc               jsr kCHROUT
Lc0df               lda $028d
                    and #$01
                    bne Lc0df
                    rts
                    
Lc0e7               jsr $bdcd
                    lda #$0d
                    jsr kCHROUT
                    jsr kCLRCHN
                    lda #$04
                    jmp kCLOSE
                    
                                         93 53 43 52 45 45 4e 20 4f 
                    52 20 50 52 49 4e 54 45 52 20 3f 20 00 
Lc10d               jmp Lc12c
                    
                    ea b1 fb c9 20 f0 06 
Lc117               txa
                    adc ($fb),y
                    eor $fe
                    tax
Lc11d               txa
                    jmp Lc058
                    
                    00 00 00 00 
Sc125               inc $fb
                    bne Lc12b
                    inc $fc
Lc12b               rts
                    
Lc12c               tax
                    lda ($fb),y
                    cmp #$22
                    bne Lc139
                    lda $02
                    eor #$ff
                    sta $02
Lc139               lda $02
                    bne Lc117
                    lda ($fb),y
                    cmp #$20
                    bne Lc117
                    dec $fe
                    jmp Lc11d
                    
                    00 
Lc149               lda #$0d
                    jmp kCHROUT
                    
                    00 00 00 