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

Memset:
    ld a, [de]
    ld [hli], a
    dec bc
    ld a, b
    or a, c
    jp nz, Memset
    ret

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
    ld a, $0
    ld [hli], a
    dec bc
    ld a, b
    or a, c
    jp nz, Memclr
    ret