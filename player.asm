SECTION "Player", ROM0
InitPlayer:
    ld a, $09
    ld [wPlayerPos], a
    ld a, $02
    ld [wPlayerPos+1], a
    ret

; Work out a way to do wrapping here
MovePlayerDown:
    ld a, [wPlayerPos]
    ld l, a
    ld a, [wPlayerPos+1]
    ld h, a
    ld [hl], 0
    
    ld a, $20
    add a, l
    ld  l, a
    adc a, h
    sub l
    ld  h, a

    ld a, l
    ld [wPlayerPos], a
    ld a, h
    ld [wPlayerPos+1], a

    ld a, 2
    ld [hl], a

    ret

SECTION "Player Variables", WRAM0
wPlayerPos: ds 2