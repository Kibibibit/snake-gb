SECTION "Player", ROM0
InitPlayer:
    ld a, $08
    ld [wPlayerPos], a
    ld a, $99
    ld [wPlayerPos+1], a
    ld a, $00
    ld [wPlayerTimer], a
    ret



MovePlayerStart:
    ld a, [wPlayerPos]
    ld l, a
    ld a, [wPlayerPos+1]
    ld h, a
    ld [hl], 0 ;Set the previous value to 0
    ret
MovePlayerEnd:
    ld a, l
    ld [wPlayerPos], a
    ld a, h
    ld [wPlayerPos+1], a

    ld a, 2
    ld [hl], a
    ret
; Work out a way to do wrapping here
MovePlayerDown:
    call MovePlayerStart
    
    ld a, $20 ; $20 is one row down
    
    call Add8To16

    ld de, $9A20
    ; start by checking the upper bit
    ld a, d 
    ld b, h

    cp a, b
    jr c, .downTrue ; if b > a 
    jr nz, .downFalse ; if b != a, but it's not greater, then jump to false

    ld a, e
    ld b, l
    cp a, b
    jr c, .downTrue ; if b > a
    jr nz, .downFalse ; if b != a
.downTrue
    ld  a, l ; save the column
    and a, $1F
    add a, $40 ; set lower byte to 4
    ld  l, a

    ld  a, $98
    ld  h, a
.downFalse
    call MovePlayerEnd
    ; Set the orientation
    ld a, 1
    ld [rVBK], a
    ld a, [hl]
    or a, $40
    ld [hl], a
    ld a, 0
    ld [rVBK], a

    ret

MovePlayerUp:
    call MovePlayerStart

    ld a, $20
    
    call Sub8From16

    ld de, $9833

    ld b, d
    ld a, h
    cp a, b
    jr c, .upTrue
    jr nz, .upFalse

    ld b, e
    ld a, l
    cp a, b
    jr c, .upTrue
    jr .upFalse
.upTrue
    ld a, l
    and a, $1F
    ld l, a
    ld a, $9A
    ld h, a
.upFalse
    call MovePlayerEnd
    ld a, 1
    ld [rVBK], a
    ld a, [hl]
    and a, $BF
    ld [hl], a
    ld a, 0
    ld [rVBK], a
    ret


SECTION "Player Variables", WRAM0
wPlayerPos: ds 2
wPlayerTimer: db