INCLUDE "hardware.inc"
INCLUDE "interrupts.asm"
INCLUDE "functions.asm"
INCLUDE "inputs.asm"
INCLUDE "dma_transfer.asm"

SECTION "Header", ROM0[$100]
    ; Make space for the nintendo header
    jp EntryPoint
    ds $150 - @, 0


EntryPoint:
    ; Shut down audio circuitry for now as I don't know how to use it
    ld a, 0
    ld [rNR52], a

    ;Copy in the DMA transfer routine to HRAM
    call CopyDMARoutine

; Wait for vblank before turning off the lcd. We don't want to use interrupts yet as it'll mess with the memory load
AwaitVBlank:
    ld a, [rLY]       ; Copy the current (Scan line I think?) into `a`
    cp $90            ; Compare to $90, or the 144th scanline (off the bottom of the screen)
    jp c, AwaitVBlank ; If this underflows, we're not yet vblanking

    ; Turn off the lcd by writing 0 to rLCDC
    ld a, 0
    ld [rLCDC], a

    ; Start copying tiles into vram
    ld de, PlayerTiles
    ld hl, $8010 ; So the background doesn't get overwritten, set $9010 (second tile) instead of $9000
    ld bc, PlayerTilesEnd - PlayerTiles
    call Memcpy

    ld de, $9800
    ld hl, $9800
    ld bc, $9BFF-$9800
    call Memset

    ; Once tile copying is done, clear junk from the OAM
    ld bc, $00A0 ; OAM memory is 160 bytes long
    ld hl, _OAMRAM
    call Memclr

    ld bc, $00A0
    ld hl, wOAMStagingPoint
    call Memclr

    ; Load in a test palette
    ld a, %10000000
    ldh [rOCPS], a
    ; Learn to do this properly
    ld a, $FF
    ldh [rOCPD], a
    ldh [rOCPD], a
    ld bc, %0000001111100000
    ld a, LOW(bc)
    ldh [rOCPD], a
    ld a, HIGH(bc)
    ldh [rOCPD], a
    ld bc, %0000000011100000
    ld a, LOW(bc)
    ldh [rOCPD], a
    ld a, HIGH(bc)
    ldh [rOCPD], a
    ld bc, %0000000000100000
    ld a, LOW(bc)
    ldh [rOCPD], a
    ld a, HIGH(bc)
    ldh [rOCPD], a

    ; Load in a test srpite

    ld a, 40
    ld [wOAMStagingPoint], a
    ld [wOAMStagingPoint+1], a
    ld a, $1
    ld [wOAMStagingPoint+2], a

    ; Enable LCD
    ld a, LCDCF_ON | LCDCF_BGON | LCDCF_OBJON
    ld [rLCDC], a

    ; Now that we have the data loaded, we want to enable vblank interrupts
    ld a, IEF_VBLANK  ; IEF_VBLANK sets the bit for vblank interrupts
    ldh [rIE], a      ; IE stores all the enabled interrupt routines
    xor a, a          ; Faster than ld a, 0 :)
    ldh [rIF], a      ; We want to set rIF to 0 otherwise interrupts might activate prematurely
    ei                ; Enable interrupts

    

; infinite loop till I work out what I'm doing
MainLoop:
    call ReadJoypad ; Read joypad inputs
    halt
    jp MainLoop


SECTION "Graphics", ROM0

PlayerTiles:
    incbin "player-tiles.bin"
PlayerTilesEnd: