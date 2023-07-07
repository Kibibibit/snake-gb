; This section specifically stores the VBlank interrupt code
; We only get 8 bytes here so we need to push everything and go to somewhere else
SECTION "VBlank Interrupt", ROM0[$0040]
VBlankInterrupt:
    push    af
    push    bc
    push    de
    push    hl
    jp      VBlankHandler


SECTION "VBlank Handler", ROM0
VBlankHandler:
    ; We can write code that accesses VRAM here cause it's not being used at the moment

    ; Write new tile memory base on player list

    ; Once the interrupt is done, we can go back to doing whatever it was before
    pop     hl
    pop     de
    pop     bc
    pop     af
    reti; As interupts disable interrupts when called, we need to re-enable them on return, which `reti` does