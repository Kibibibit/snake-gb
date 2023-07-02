INCLUDE "hardware.inc"
INCLUDE "interrupts.asm"
INCLUDE "functions.asm"
INCLUDE "inputs.asm"

SECTION "Header", ROM0[$100]
    ; Make space for the nintendo header
    jp EntryPoint
    ds $150 - @, 0


EntryPoint:
    ; Shut down audio circuitry for now as I don't know how to use it
    ld a, 0
    ld [rNR52], a

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
    ld hl, $9010 ; So the background doesn't get overwritten, set $9010 (second tile) instead of $9000
    ld bc, PlayerTilesEnd - PlayerTiles
    call Memcpy

    ; Once tile copying is done, clear junk from the OAM
    call ClearOAM

    ; Enable LCD
    ld a, LCDCF_ON | LCDCF_BGON
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