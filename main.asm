INCLUDE "hardware.inc"
INCLUDE "constants.inc"
INCLUDE "macros.inc"
INCLUDE "functions.asm"
INCLUDE "graphics.asm"
INCLUDE "level_data.asm"
INCLUDE "inputs.asm"
INCLUDE "player.asm"

SECTION "Header", ROM0[$100]
    jp      StartPoint
    ds      HEADER_SIZE - @, 0

StartPoint:
    DisableAudio
    AwaitVBlank            ; Wait for a blank before turning off the LCD
    DisableLCD             ; While the LCD is off we can do whatever

    ; Load all the tiles into the tile memory
    ld      de, SnakeTiles
    ld      hl, TILES_START
    ld      bc, SnakeTilesEnd - SnakeTiles
    call    Memcpy

    ; Clear junk from OAM
    ld      bc, OAM_SIZE
    ld      hl, _OAMRAM
    call    Memclr

    ; Load in level data
    ld      de, LevelData
    ld      hl, TILEMAP_START
    ld      bc, LevelDataEnd - LevelData
    call    Memcpy

    ; Load in level colour/flip maps
    SetVBK1
    ld      de, AttributeData
    ld      hl, TILEMAP_START
    ld      bc, AttributeDataEnd - AttributeData
    call    Memcpy
    SetVBK0

    ; Load in palettes
    ld      de, BgPalettes
    ld      bc, BgPalettesEnd-BgPalettes
    call    WriteBgPalettes

    ; Set the player position, inital direction and all that
    call    InitPlayer


    ; Enable VBlank interrupts
    ld      a, IEF_VBLANK
    ldh     [rIE], a
    xor     a, a
    ldh     [rIF], a
    ei


    ; Turn on the LCD
    ld      a, LCDCF_ON | LCDCF_BGON
    ld      [rLCDC], a

.mainLoop
    call    ReadJoypad
    call    MovePlayer
    halt
    jr      .mainLoop