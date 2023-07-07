SECTION "Grahpics Functions", ROM0

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
    ld      a, %10000000
    ldh     [rBCPS], a
.WriteBgPalettesLoop
    ld      a, [de]
    ldh     [rBCPD], a
    inc     de
    dec     bc
    ld      a, b
    or      a, c
    jp      nz, .WriteBgPalettesLoop
    ret

SECTION "Graphics", ROM0

SnakeTiles:
    incbin  "snake-tiles.bin"
SnakeTilesEnd:

BgPalettes:
    db      $00,$00, $E0,$03, $A0,$02, $00,$01,
    db      $00,$00, $FF,$FF, $88,$88, $BB,$BB,
    db      $FF,$FF, $6B,$2D, $63,$0C, $00,$00, 
BgPalettesEnd: