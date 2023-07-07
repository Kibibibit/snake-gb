SECTION "Inputs", ROM0
; Function: ReadJoypad
;
; Updates wButtonsPressed based 
; on the current joypad inputs
; 
; MODIFIES:
;
; `a`, `b`
ReadJoypad:
    ld      a, P1F_GET_BTN
    call    .Debounce
    ld      b, a

    ld      a, P1F_GET_DPAD
    call    .Debounce
    swap    a

    or      a, b
    ld      [wButtonsPressed], a
    ret

.Debounce
    ldh     [rP1], a
    call    .WaitABit
    ldh     a, [rP1]
    ldh     a, [rP1]
    ldh     a, [rP1]
    or      a, $F0
    ret


.WaitABit:
    ret

SECTION "Input Vars", WRAM0
wButtonsPressed:
    db