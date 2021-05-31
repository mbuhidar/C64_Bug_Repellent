1 he$="0123456789abcdef"
2 l$="---------------------------------------"
4 j$="    --->"
13 print"  disassembler"
14 print
16 dimm$(15,15)
17 fori=0to15:forb=0to14:readm$(i,b):nextb:nexti
25 rem start main loop
30 print"starting address (decimal)";:inputsa:ta=sa
31 print"start address hex  ";:de=sa:zx=3:gosub1200:printh$"  "
35 ifsa<0thenend
41 i=sa
45 rem print address
46 printi" ";
50 x=peek(i)
55 gosub5000
56 ifl%=15orm$(h%,l%)="0"thenprint" ?    "x:ck=0:ln=ln+1:goto70
58 printm$(h%,l%);
60 gosub6000:ifeqtheneq=0
70 i=i+1
72 ifln=20thenln=0:goto2000
80 goto45
600 ifck=12then603
601 b=peek(i+1):ifb>127thenb=((notb)and255)+1:b=-b
602 bad=i+2+b:print"        "bad:i=i+1:return
603 ifh%>8then800
604 ifh%=2thenj=1:goto850
605 ifh%=6thenprint:printl$:eq=1:return
606 ifh%=6thenreturn
607 print
608 return
610 ifck=12then615
611 print" ("peek(i+1)"),y"
612 i=i+1:return
615 print" ("peek(i+1)",x)"
616 i=i+1:return
630 ifck=12then635
631 print" "peek(i+1)",x"
632 i=i+1:return
635 print"  "peek(i+1)
636 i=i+1:return
640 ifck=12then645
641 print"  "peek(i+1)",x"
642 i=i+1:return
645 print"  "peek(i+1)
646 i=i+1:return
660 ifck=12then645
661 ifh%=9orh%=11thenprint"  "peek(i+1)",y"
662 ifh%=7orh%=15orh%=5orh%=3then640
663 ifh%=13then631
664 print:goto642
680 print:return
690 ifck=12then800
691 i$="y":goto850
720 ifck=12then725
722 i$="x":goto850
725 ifh%=6thenprint" (ind.  ";:i=i+1
726 ifh%=2then850
727 ifh%=4thenprintj$;:goto850
728 ifh%=8orh%=10orh%=12orh%=14then850
729 goto610
730 ifck=12then850
731 i$="x":goto850
740 ifck=12then850
741 ifh%=11theni$="y":goto850
742 i$="x":goto850
800 print"  #"peek(i+1)
801 i=i+1:return
850 n=peek(i+1)+peek(i+2)*256
860 ifi$=""then900
870 ifi$="x"thenprint"  "n",x"
880 ifi$="y"thenprint"  "n",y"
890 i$="":i=i+2:return
900 print"  "n:i=i+2
906 return
1000 databrk,ora,0,0,0,ora,asl,0,php,ora,asl,0,0,ora,asl,bpl,ora,0,0,0,ora,asl
1010 data0,clc,ora,0,0,0,ora,asl,jsr,and,0,0,bit,and,rol,0,plp,and,rol,0,bit
1020 dataand,rol,bmi,and,0,0,0,and,rol,0,sec,and,0,0,0,and,rol,rti,eor,0,0,0
1030 dataeor,lsr,0,pha,eor,lsr,0,jmp,eor,lsr,bvc,eor,0,0,0,eor,lsr,0,cli,eor,0
1040 data0,0,eor,lsr,rts,adc,0,0,0,adc,ror,0,pla,adc
1045 dataror,0,jmp,adc,ror,bvs,adc,0,0,0
1050 dataadc,ror,0,sei,adc,0,0,0,adc,ror,0,sta
1055 data0,0,sty,sta,stx,0,dey,0,txa,0,sty,sta
1060 datastx,bcc,sta,0,0,sty,sta,stx,0,tya,sta,txs,0,0,sta,0,ldy,lda,ldx,0
1070 dataldy,lda,ldx,0,tay,lda,tax,0,ldy,lda,ldx,bcs,lda,0,0,ldy,lda,ldx,0
1080 dataclv,lda,tsx,0
1090 dataldy,lda,ldx,cpy,cmp,0,0,cpy,cmp,dec,0,iny,cmp,dex,0,cpy,cmp,dec
1095 databne,cmp,0,0,0,cmp,dec,0,cld,cmp,0,0,0,cmp,dec,cpx,sbc,0,0,cpx,sbc,inc
1098 data0,inx,sbc,nop,0,cpx,sbc,inc,beq,sbc,0,0,0,sbc,inc,0,sed,sbc,0,0,0,sbc
1099 datainc
1200 rem make decimal into hex
1201 h$="":form=zxto0step-1:n%=de/(16^m):de=de-n%*16^m:h$=h$+mid$(he$,n%+1,1)
1202 next:return
2000 print"type c to continue from" i
2001 getk$:ifk$=""then2001
2002 ifk$="c"thensa=i:ta=sa:goto35
2003 inputsa:ta=sa:goto35
5000 rem analyze h & l of opcode
5010 h%=x/16:l%=x-h%*16
5020 :return
6000 rem find address type & gosub
6020 ck=h%/2:ifck=int(ck)thenck=12
6025 l%=l%+1
6030 onl%gosub600,610,800,6050,640,640,660,6050,680,690,680,6050,720,730,740
6040 ck=0
6045 ln=ln+1
6050 return
