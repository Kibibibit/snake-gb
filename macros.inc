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

; MACRO: DisableAudio
;
; 5 Cycles
; 
; 4 Bytes
;
; Disables the audio circuitry
;
; MODIFIES:
;
; `a`
MACRO DisableAudio
    xor     a, a        ; 1 Cycle,  1 Byte
    ld      [rNR52], a  ; 4 Cycles, 3 Bytes
ENDM

; MACRO: AwaitVBlank
;
; ? Cycles
;
; 6 Bytes
; 
; Waits until the next VBlank. Also, only call this once!
;
; MODIFIES:
;
; `a`
MACRO AwaitVBlank
.awaitVBlankJump
    ld      a, [rLY]            ; 4 Cycles,   3 Bytes
    cp      a, VBLANKY          ; 1 Cycle,    1 Byte
    jr      c, .awaitVBlankJump ; 3/2 Cycles, 2 Bytes
ENDM

; MACRO: DisableLCD
;
; 5 Cycles
;
; 4 Bytes
;
; Disables the LCD Screen.
;
; MAKE SURE IN VBLANK FIRST
;
; MODIFIES:
;
; `a`
MACRO DisableLCD
    xor     a, a        ; 1 Cycle,  1 Byte
    ld      [rLCDC], a  ; 4 Cycles, 3 Bytes
ENDM



