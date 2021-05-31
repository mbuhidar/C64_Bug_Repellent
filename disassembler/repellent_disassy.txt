
starting address (decimal)? 49152
start address hex  c000
 49152  jsr   49313  jump to 49313 and save return addy
 49155  lda   43     load accumulator from 43
 49157  sta   251    store accumulator in 251
 49159  lda   44     load accumulator from 44
 49161  sta   252    store accumulator in 251
 49163  ldy  # 0     load y register
 49165  sty   254    store y register to 254
 49167  jsr   49445  jump to 49445 and save return addy
 49170  nop          no operation
 49171  lda ( 251 ),y  load accumulator from 251 into y?
 49173  bne         49178  branch on anything but zero to 49178
 49175  jmp    --->   49290   jump to 49290 
 49178  inc   251             increment 251 by 1
 49180  bne         49184     branch on anything but zero to 49184
 49182  inc   252             increment 252 by 1
 49184  jmp    --->   49195   jump to 49195
 49187  jmp    --->   20041   jump to 20041??
 49190  eor   32              XOR 32 with accumulator
 49192   ?     35
 49193  jsr   43264
 49196   ?     35
 49197  ldy  # 192
 49199  jsr   43806
 49202  ldy  # 0
 49204  lda ( 251 ),y
 49206  tax                 transfer accumulator to x reg
 49207  inc   251
 49209  bne         49213
 49211  inc   252
 49213  lda ( 251 ),y
 49215  jsr   48589
 49218  lda  # 58
 49220  jsr   65490
 49223  lda  # 0
 49225  sta   253
 49227  inc   254
 49229  jsr   49445
 49232  nop
 49233  lda   253
 49235  ldy  # 0
 49237  jmp    --->   49421
 49240  sta   253
 49242  lda ( 251 ),y
 49244  bne         49227
 49246  lda   253
 49248  and  # 240     AND mem with acc
 49250  lsr     shift right one bit in mem or acc
 49251  lsr
 49252  lsr
 49253  lsr
 49254  clc    clear carry flag
 49255  adc  # 65
 49257  jsr   65490
 49260  lda   253
 49262  and  # 15
 49264  clc
 49265  adc  # 65
 49267  jsr   65490
 49270  lda  # 13
 49272  jsr   49372
 49275  inc   63
 49277  bne         49281
 49279  inc   64
 49281  inc   251
 49283  bne         49287
 49285  inc   252
 49287  jmp    --->   49163
 49290  lda  # 153
 49292  ldy  # 192
 49294  jsr   43806
 49297  ldx   63
 49299  lda   64
 49301  jmp    --->   49383
 49304  rts
---------------------------------------
 49305  jmp    --->   20041
 49308  eor   83
 49310   ?     58
 49311  jsr   43264
 49314   ?     247
 49315  ldy  # 192
 49317  jsr   43806
 49320  lda  # 3
 49322  sta   254
 49324  jsr   65508
 49327  cmp  # 83
 49329  beq         49337
 49331  cmp  # 80
 49333  bne         49324
 49335  inc   254
 49337  jsr   65490
 49340  lda  # 4
 49342  ldx   254
 49344  ldy  # 255
 49346  jsr   65466
 49349  lda  # 0
 49351  sta   63
 49353  sta   64
 49355  sta   2
 49357  jsr   65469
 49360  jsr   65472
 49363  ldx   254
 49365  jsr   65481
 49368  jmp    --->   49481
 49371  rts
---------------------------------------
 49372  jsr   65490
 49375  lda   653
 49378  and  # 1
 49380  bne         49375
 49382  rts
---------------------------------------
 49383  jsr   48589
 49386  lda  # 13
 49388  jsr   65490
 49391  jsr   65484
 49394  lda  # 4
 49396  jmp    --->   65475
 49399   ?     147
 49400   ?     83
 49401   ?     67
 49402   ?     82
 49403  eor   69
 49405  lsr   20256
 49408   ?     82
 49409  jsr   21072
 49412  eor  # 78
 49414   ?     84
 49415  eor   82
 49417  jsr   8255
 49420  brk
 49421  jmp    --->   49452
 49424  nop
 49425  lda ( 251 ),y
 49427  cmp  # 32
 49429  beq         49437
 49431  txa
 49432  adc ( 251 ),y  add mem to acc with carry
 49434  eor   254      XOR 
 49436  tax
 49437  txa
 49438  jmp    --->   49240
 49441  brk
 49442  brk
 49443  brk
 49444  brk
 49445  inc   251
 49447  bne         49451
 49449  inc   252
 49451  rts
---------------------------------------
 49452  tax
 49453  lda ( 251 ),y
 49455  cmp  # 34
 49457  bne         49465
 49459  lda   2
 49461  eor  # 255
 49463  sta   2
 49465  lda   2
 49467  bne         49431
 49469  lda ( 251 ),y
 49471  cmp  # 32
 49473  bne         49431
 49475  dec   254
 49477  jmp    --->   49437
 49480  brk
 49481  lda  # 13
 49483  jmp    --->   65490
 49486  brk
 49487  brk
 49488  brk
