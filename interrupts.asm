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

    ; Start a DMA transfer here if the right flag in WRAM is set
    ld      a, [wVBlankFlags]
    ld      b, regDMAWrite
    and     a, b
    jp      z, .skipDMA
    call    DMATransfer
    ; Disable the flag so it's not called next cycle
    ld      a, [wVBlankFlags]
    ld      c, a ; Store flags for later
    ld      b, regDMAWrite
    and     a, b ; Get specifically the bit with the flag set
    ld      b, a ; store for later
    ld      a, c ; restore the proper flags
    sub     a, b ; subtract the set bit
    ld      [wVBlankFlags], a
    
.skipDMA

    ld      a, [wPlayerTimer]
    add     a, 1
    ld      [wPlayerTimer], a
    
    call    ReadJoypad ; Read joypad inputs
    and     a, $F0 ;Zero out the buttons as we don't need them
    cp      a, 0
    jr      z, .finishedReadInput
    ld      [wPlayerDirections], a ; Store player directions for next cycle

.finishedReadInput

    ld      a, [wPlayerTimer]
    ld      b, 10
    cp      a, b

    jr      z, .startMove
    jr      .skipMove
.startMove
    xor     a, a ; Faster than ld a, 0
    ld      [wPlayerTimer], a

.move
    ld      a, [wPlayerDirections]
    ld      b, PlayerDown
    and     a, b
    cp      a, b
    jr      nz, .skipDown
    call    MovePlayerDown
    jr      .skipMove
.skipDown
    ld      a, [wPlayerDirections]
    ld      b, PlayerUp
    and     a, b
    cp      a, b
    jr      nz, .skipUp
    call    MovePlayerUp
    jr      .skipMove
.skipUp  
    ld      a, [wPlayerDirections]
    ld      b, PlayerLeft
    and     a, b
    jr      nz, .skipLeft
    call MovePlayerLeft
    jr      .skipMove
.skipLeft
    ld      a, [wPlayerDirections]
    ld      b, PlayerRight
    and     a, b
    jr      nz, .skipRight
    call    MovePlayerRight
    jr      .skipMove
.skipRight
.skipMove

    ; Once the interrupt is done, we can go back to doing whatever it was before
    pop     hl
    pop     de
    pop     bc
    pop     af
    reti; As interupts disable interrupts when called, we need to re-enable them on return, which `reti` does