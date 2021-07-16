# Ahoy Bug Repellent disassembled using 
# https://www.masswerk.at/6502/disassembler.html

 TANSGN   = $12
 DPTFLG   = $5F
 C3P0     = $94
 FIRT     = $A4
 ROPRTY   = $BD
 TMP0     = $C1
 STAH     = $C2
 LSTX     = $C5
 INDX     = $C8

                            * = $C000
C000   20 A1 C0             JSR LC0A1
C003   A5 2B                LDA $2B
C005   85 FB                STA $FB
C007   A5 2C                LDA $2C
C009   85 FC                STA $FC
C00B   A0 08                LDY #$08
C00D   4F E2 02             SRE $02E2
C010   5C 1E AB             NOP $AB1E,X
C013   1F BD 00             SLO ROPRTY+$0000,X
C016   34 C8                NOP INDX,X
C018   AC 0E 6F             LDY $6F0E
C01B   BD 00 2E             LDA $2E00,X
C01E   6F C4 C2             RRA $C2C4
C021   BC 04 C4             LDY $C404,X
C024   94 E4                STY $E4,X
C026   52                   JAM
C027   02                   JAM
C028   32                   JAM
C029   00                   BRK
C02A   0A                   ASL A
C02B   92                   JAM
C02C   3A                   NOP
C02D   0C 02 01             NOP $0102
C030   EA                   NOP
C031   BA                   TSX
C032   00                   BRK
C033   0B 1F                ANC #$1F
C035   BA                   TSX
C036   AE 6F BD             LDX $BD6F
C039   00                   BRK
C03A   2E 6F CB             ROL $CB6F
C03D   1F B2 0C             SLO $0CB2,X
C040   DB DA 93             DCP $93DA,Y
C043   A2 0D                LDX #$0D
C045   2F FA 09             RLA $09FA
C048   08                   PHP
C049   5F DE 6F             SRE $6FDE,X
C04C   E2 02                NOP #$02
C04E   5C 1E AA             NOP $AA1E,X
C051   5F DA 00             SRE $00DA,X
C054   04 0C                NOP $0C
C056   DC 18 5F             NOP $5F18,X
C059   DB 1F BD             DCP $BD1F,Y
C05C   0E DA 5F             ASL $5FDA
C05F   D2                   JAM
C060   9F 04 A4             SHA $A404,Y
C063   A4 A4                LDY FIRT
C065   A1 86                LDA ($86,X)
C067   94 12                STY TANSGN,X
C069   0D 2F FA             ORA $FA2F
C06C   5F D2 09             SRE $09D2,X
C06F   F1 86                SBC ($86),Y
C071   94 12                STY TANSGN,X
C073   0D 2F FA             ORA $FA2F
C076   09 D2                ORA #$D2
C078   0D CC 0E             ORA $0ECC
C07B   63 FD                RRA ($FD,X)
C07D   00                   BRK
C07E   2E 64 0E             ROL $0E64
C081   6F BD 00             RRA ROPRTY+$0000
C084   2E 6F C4             ROL $C46F
C087   0C BC 0A             NOP $0ABC
C08A   99 9A 0C             STA $0C9A,Y
C08D   02                   JAM
C08E   01 EA                ORA ($EA,X)
C090   BA                   TSX
C091   63 FA                RRA ($FA,X)
C093   54 04                NOP $04,X
C095   CE 7C 06             DEC $067C
C098   04 C4                NOP $C4
C09A   94 E4                STY $E4,X
C09C   55 33                EOR $33,X
C09E   A2 00                LDX #$00
C0A0   0A                   ASL A
C0A1   9F 7A 0C   LC0A1     SHA $0C7A,Y
C0A4   02                   JAM
C0A5   01 EA                ORA ($EA,X)
C0A7   BA                   TSX
C0A8   09 38                ORA #$38
C0AA   5F E2 0E             SRE $0EE2,X
C0AD   4F FC 95             SRE $95FC
C0B0   3F 00 6C             RLA $6C00,X
C0B3   95 0D                STA $0D,X
C0B5   0F 5E 6F             SLO $6F5E
C0B8   E2 0D                NOP #$0D
C0BA   2F FA 09             RLA $09FA
C0BD   4A                   LSR A
C0BE   6F EA 0F             RRA $0FEA
C0C1   F2                   JAM
C0C2   0B AF                ANC #$AF
C0C4   FA                   NOP
C0C5   09 08                ORA #$08
C0C7   53 F8                SRE ($F8),Y
C0C9   54 08                NOP $08,X
C0CB   05 22                ORA $22
C0CD   0B DF                ANC #$DF
C0CF   F2                   JAM
C0D0   0C 0F FA             NOP $FA0F
C0D3   6F E2 0C             RRA $0CE2
C0D6   9F F4 C4             SHA $C4F4,Y
C0D9   9C 16 02             SHY $0216,X
C0DC   0D 2F FA             ORA $FA2F
C0DF   D8                   CLD
C0E0   0D 22 09             ORA $0922
C0E3   1D 0F 96             ORA $960F,X
C0E6   02                   JAM
C0E7   0C DB DA             NOP $DADB
C0EA   09 D2                ORA #$D2
C0EC   0D 2F F2             ORA $F22F
C0EF   0C CF FA             NOP $FACF
C0F2   09 44                ORA #$44
C0F4   CC 3F F9             CPY $F93F
C0F7   35 34                AND $34,X
C0F9   35 24                AND $24,X
C0FB   54 54                NOP $54,X
C0FD   E2 04                NOP #$04
C0FF   F5 22                SBC $22,X
C101   05 05                ORA $05
C103   24 94                BIT C3P0
C105   E5 44                SBC $44
C107   55 22                EOR $22,X
C109   03 F2                SLO ($F2,X)
C10B   00                   BRK
C10C   04 C2                NOP STAH
C10E   CC 1E AB             CPY $AB1E
C111   1F BC 92             SLO $92BC,X
C114   0F 00 68             SLO $6800
C117   A7 1F                LAX $1F
C119   B4 5F                LDY DPTFLG,X
C11B   EA                   NOP
C11C   A8                   TAY
C11D   A4 C5                LDY LSTX
C11F   8C 00 00             STY $0000
C122   00                   BRK
C123   00                   BRK
C124   0E 6F BD             ASL $BD6F
C127   00                   BRK
C128   2E 6F C6             ROL $C66F
C12B   0A                   ASL A
C12C   AB 1F                LXA #$1F
C12E   BC 92 2D             LDY $2D92,X
C131   00                   BRK
C132   6A                   ROR A
C133   05 24                ORA $24
C135   9F F8 05             SHA $05F8,Y
C138   2A                   ROL A
C139   05 2D                ORA $2D
C13B   0D AB 1F             ORA $1FAB
C13E   BC 92 0D             LDY $0D92,X
C141   0D 4C 6F             ORA $6F4C
C144   E4 C1                CPX TMP0
C146   DC 01 0A             NOP $0A01,X
C149   09 D4                ORA #$D4
C14B   CD 2F 0F             CMP $0F2F
C14E   00                   BRK
C14F   00                   BRK
C150   00                   BRK
                            .END

;auto-generated symbols and labels
 LC0A1      $C0A1

;defined symbols used as labels
 SIZE         $55
 DPTFLG       $5F
 C3P0         $94
 DPSW         $9C
 FIRT         $A4
 TMP0         $C1
 STAH         $C2
 LSTX         $C5

