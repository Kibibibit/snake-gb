SECTION "Functions", ROM0
; FUNCTION: Memcpy
;
; Copy bytes from one area to another
; 
; MODIFIES:
;  
; `a`,`bc`,`de`,`hl`
;
; @param de: Pointer to source
; @param bc: Length
; @param hl: Pointer to destination
Memcpy:
    ld a, [de]    ; Set `a` to the value pointed at by `de`
    ld [hli], a   ; Set the value at `hl` to `a`, and then increment
    inc de        ; Move to next value
    dec bc        ; Decrement the amount of values left
    ld a, b       ; Move `b` into `a` so we can compare `b` and `c`
    or a, c       ; Compare `a` and `c`
    jp nz, Memcpy ; If `a | c` (effectively `b` | `c`) is not zero, loop
    ret           ; Otherwise, return

;FUNCTION: Memclr
;
; Clears a group of bytes to 0
;
; MODIFIES:
;
; `a`, `bc`, `hl`
;
; @param bc: Length
; @param hl: Pointer to destination
Memclr:
    ld a, $00
.MemclrLoop:
    ld [hli], a
    dec bc
    jp nz, .MemclrLoop
    ret

; FUNCTION: ClearOAM
;
; Clears out the OAM memory as it is filled with garbage on boot
;
; MODIFIES
;
; `a`, `bc`, `hl`
ClearOAM:
    ld bc, $00A0 ; OAM memory is 160 bytes long
    ld hl, _OAMRAM
    call Memclr
    ret