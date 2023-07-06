; MACRO: SetVBK1
;
; 6 Cycles
;
; 5 Bytes
;
; Changes into VBK1 so tile attribute data
; can be edited
;
; MODIFIES:
;
; `a`
MACRO SetVBK1
    ld      a, 1        ; 2 Cycles, 2 Bytes
    ld      [rVBK], a   ; 4 Cycles, 3 Bytes
ENDM

; MACRO: SetVBK0
;
; 5 Cycles
;
; 4 Bytes
;
; Changes into VBK0 so tile index data
; can be edited
;
; MODIFIES:
;
; `a`
MACRO SetVBK0
    xor     a, a        ; 1 Cycle,  1 Byte
    ld      [rVBK], a   ; 4 Cycles, 3 Bytes
ENDM


DEF PlayerDown      EQU $80
DEF PlayerUp        EQU $40
DEF PlayerLeft      EQU $10
DEF PlayerRight     EQU $20

DEF PlayerMinHeight EQU $9833
DEF PlayerMaxHeight EQU $9A20

DEF ColumnMask      EQU $1F
DEF RowMaskLow      EQU $E0


DEF WrapUpRow       EQU $9A
DEF WrapDownRow     EQU $98