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