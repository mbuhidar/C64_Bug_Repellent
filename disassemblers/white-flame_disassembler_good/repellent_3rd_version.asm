Lc000               lda #$4f
                    jsr kCHROUT
                    ldx #$26
                    ldy #$c0
                    cpy $0303
                    bne Lc018
                    ldx #$83
                    ldy #$a4
                    lda #$46
                    jsr kCHROUT
                    2c 
Lc018               lda #$4e
                    jsr kCHROUT
                    stx $0302
                    sty $0303
                    jmp Lc124
                    
Lc026               jsr bINLIN
                    stx $7a
                    sty $7b
                    jsr $0073
                    tax
                    beq Lc026
                    ldx #$ff
                    stx $3a
                    bcc Lc03c
                    jmp $a496
                    
Lc03c               jsr bLINGET
                    jsr bCRUNCH
                    lda $0200
                    beq Lc04c
                    lda #$4f
                    sta $0302
Lc04c               jmp bINSLIN
                    
Lc04f               lda #$00
                    sta $02
                    sta $fb
                    sta $fc
                    sta $fe
                    clc
                    adc $14
                    eor $fe
                    inc $fe
                    clc
                    adc $15
                    eor $fe
                    tax
Lc066               inc $fe
                    ldy $fc
                    lda $0200,y
                    sta $fd
                    cmp #$22
                    bne Lc079
                    lda $02
                    eor #$ff
                    sta $02
Lc079               cmp #$20
                    bne Lc081
                    lda $02
                    beq Lc089
Lc081               txa
                    clc
                    adc $fd
                    eor $fe
                    tax
                    2c 
Lc089               dec $fe
                    inc $fc
                    ldy $fd
                    bne Lc066
                    txa
                    and #$f0
                    lsr a
                    lsr a
                    lsr a
                    lsr a
                    clc
                    adc #$81
                    sta Lc12b + 1
                    txa
                    and #$0f
                    clc
                    adc #$81
                    sta $c12d
                    ldx #$00
Lc0a9               lda Lc12b,x
                    beq Lc0ba
                    sta $0400,x
                    lda $0286
                    sta $d800,x
                    inx
                    bne Lc0a9
Lc0ba               lda #$26
                    sta $0302
                    lda Lc130
                    beq Lc0db
                    lda $a1
                    cmp #$d4
                    bcs Lc0ce
                    lda $a0
                    beq Lc0db
Lc0ce               inc d020_vBorderCol
                    ldy #$00
Lc0d3               jsr kSTOP
                    bne Lc0de
                    jsr Sc121
Lc0db               jmp Lc026
                    
Lc0de               inx
                    bne Lc0d3
                    iny
                    bne Lc0d3
                    jsr $e544
                    lda #$00
                    tay
                    ldx Lc131
                    jsr kSETLFS
                    lda Lc131 + 1
                    ldx #$33
                    ldy #$c1
                    jsr kSETNAM
                    lda #$2b
                    ldx $2d
                    ldy $2e
                    jsr kSAVE
                    ldx #$01
Lc105               lda $c133,x
                    tay
                    iny
                    tya
                    cmp #$3a
                    bcc Lc111
                    lda #$30
Lc111               sta $c133,x
                    cmp #$30
                    bne Lc11b
                    dex
                    bpl Lc105
Lc11b               jsr Sc121
                    jmp bREADY
                    
Sc121               dec d020_vBorderCol
Lc124               lda #$00
                    tax
                    tay
                    jmp kSETTIM
                    
Lc12b               ldy #$01
                    ora ($a0,x)
                    brk
                    
Lc130               brk
                    
Lc131               eor ($48,x)
                    sre $2159
                    brk
                    
Lc137               brk
