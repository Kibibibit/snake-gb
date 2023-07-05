SECTION "Player", ROM0
InitPlayer:
    ld      a, $08
    ld      [wPlayerPos], a
    ld      a, $99
    ld      [wPlayerPos+1], a
    xor     a, a ;Faster than ld a, 0
    ld      [wPlayerTimer], a
    ret

MovePlayerStart:
    ld      a, [wPlayerPos]
    ld      l, a
    ld      a, [wPlayerPos+1]
    ld      h, a
    ld      [hl], 0 ;Set the previous value to 0
    ret
MovePlayerEnd:
    ld      a, l
    ld      [wPlayerPos], a
    ld      a, h
    ld      [wPlayerPos+1], a
    ld      a, b
    ld      [hl], a
    ret
; Work out a way to do wrapping here
MovePlayerDown:
    call    MovePlayerStart
    
    ld      a, $20 ; $20 is one row down
    
    call    Add8To16

    ld      de, $9A20
    call    Gt16
    cp      a, 1
    jr      z, .downTrue
    jr      .downFalse

.downTrue
    ld      a, l ; save the column
    and     a, $1F
    add     a, $40 ; set lower byte to 4
    ld      l, a

    ld      a, $98
    ld      h, a
.downFalse
    ld      b, 2
    call    MovePlayerEnd
    ; Set the orientation
    ld      a, 1
    ld      [rVBK], a
    ld      a, [hl]
    or      a, $40
    ld      [hl], a
    xor     a, a
    ld      [rVBK], a

    ret

MovePlayerUp:
    call    MovePlayerStart

    ld      a, $20
    
    call    Sub8From16

    ld      de, $9833
    ld      b, h ; ld bc, hl
    ld      c, l
    ld      h, d ; ld hl, de
    ld      l, e
    ld      d, b ; ld de, bc
    ld      e, c

    call    Gt16
    ld      h, d
    ld      l, e
    cp      a, 1
    jr      z, .upTrue
    jr      .upFalse
.upTrue
    ld      a, l
    and     a, $1F
    ld      l, a
    ld      a, $9A
    ld      h, a
.upFalse
    ld      b, 2
    call    MovePlayerEnd
    ld      a, 1
    ld      [rVBK], a
    ld      a, [hl]
    and     a, $BF
    ld      [hl], a
    xor     a, a
    ld      [rVBK], a
    ret

MovePlayerLeft:
    call    MovePlayerStart

    dec     hl

    ld      a, l
    and     a, $1F ; This is the value we need to check
    ld      b, $0
    cp      a, b
    jr      z, .leftTrue
    jr      .leftFalse
.leftTrue
    ld      a, $12
    or      a, l
    ld      l, a
.leftFalse
    ld      b, 1
    call    MovePlayerEnd
    ld      a, 1
    ld      [rVBK], a
    ld      a, [hl]
    and     a, $7F
    ld      [hl], a
    xor     a, a
    ld      [rVBK], a
    ret

SECTION "Player Variables", WRAM0
wPlayerPos: 
    ds      2
wPlayerTimer: 
    db
wPlayerDirections: 
    db