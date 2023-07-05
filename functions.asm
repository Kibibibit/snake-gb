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

; FUNCTION: Memset
;
; Sets a range of bytes to the value pointed to by `de`
;
; MODIFIES:
;
; `a`, `bc`, `de`
;
; @param de: Pointer to source
; @param bc: Length
; @param hl: Pointer to destination
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

;FUNCTION: Add8To16
;
; Adds an 8 bit value to a 16 bit value
;
; MODIFIES:
;
; `a`, `hl`
;
; @param a:  8 bit value
; @param hl: 16 bit value
Add8To16:
    add a, l
    ld  l, a
    adc a, h ;Add h to a, including a carry flag
    sub l
    ld  h, a
    ret

Sub8From16:
    cpl 
    scf 
    adc a, l
    ld  l, a
    ld  a, -1
    adc a, h
    ld  h, a
    ret