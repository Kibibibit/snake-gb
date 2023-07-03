SECTION "Grahpics Functions", ROM0


; FUNCTION: WriteObjectPalettes
;
; Writes a group of bytes to rOCPD
;
; MODIFIES:
;
; `a`, `bc`, `de`
;
; @param de: Address for the palettes
; @param bc: Length of the palette data
WriteObjectPalettes:
    ld a, %10000000
    ldh [rOCPS], a
.WriteObjectPalettesLoop
    ld a, [de]
    ldh [rOCPD], a
    inc de
    dec bc
    ld a, b
    or a, c
    jp nz, .WriteObjectPalettesLoop
    ret

; FUNCTION: WriteBgPalettes
;
; Writes a group of bytes to rBCPD
;
; MODIFIES:
;
; `a`, `bc`, `de`
;
; @param de: Address for the palettes
; @param bc: Length of the palette data
WriteBgPalettes:
    ld a, %10000000
    ldh [rBCPS], a
.WriteBgPalettesLoop
    ld a, [de]
    ldh [rBCPD], a
    inc de
    dec bc
    ld a, b
    or a, c
    jp nz, .WriteBgPalettesLoop
    ret

SECTION "Graphics", ROM0

PlayerTiles:
    incbin "player-tiles.bin"
PlayerTilesEnd:

ObjectPalettes:
    db $FF,$FF, $E0,$03, $A0,$02, $00,$01,
ObjectPalettesEnd: