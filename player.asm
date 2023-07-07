SECTION "Player", ROM0

InitPlayer:
    ld      a, 2
    ld      [wPlayerSize], a

MovePlayer:
    ; Buffer input
    ld      a, [wButtonsPressed]
    and     a, $F0
    cp      a, 0
    jr      z, .dontSaveMove ; If they didn't hit anything, we just save keep the previous move
    ld      [wPlayerDir], a
.dontSaveMove

    ld      a, [wPlayerTimer]
    dec     a,
    cp      a, 0
    jr      z, .doMove
    ret
.doMove
    ; Reset player timer
    ld      a, 10
    ld      [wPlayerTimer], a

    ; TODO: update the player's head to be a body segment

    ; Shunt all values in player lists one down
    ; Move all the Snake tiles down one
    ld      bc, wPlayerTilesEnd-wPlayerTiles ; Store the length of the lsit
    ld      hl, wPlayerTiles+wPlayerTilesEnd ; Store the end of the list
    call    PushFront16

    ld      bc, wPlayerAttrsEnd-wPlayerAttrs
    ld      hl, wPlayerAttrs+wPlayerAttrsEnd
    call    PushFront8

    ; Now everything is shunted, clear the entry of each list down to snake size
    ; loop through till you hit snake size, then clear 0 until you hit end of list


    ; Now insert the player's head back into the empty space provided by the shunt


    ; Current direction becomes previous direction
    ; Move all snake attributes down one
    ld      a, [wPlayerDir]
    ld      [wPlayerPrevDir], a
    


    ret



SECTION "Player Variables", WRAM0
wPlayerTimer:
    db
; What direction is the player facing this frame
wPlayerDir:
    db
; What direction did the player face last frame
wPlayerPrevDir:
    db    
; Stores the length of wPlayerAttrs 
wPlayerSize:
    db     
; Allocated memory for the array of all tiles the player is in      
wPlayerTiles:
    ds      $3E, 0
wPlayerTilesEnd:
    ; These bytes is basically where garbage from the list shunting goes
    ds      2, 0

wPlayerAttrs: ; Store as 0YX0 0SSS Y -> y flip, X -> x flip, SSS -> Sprite index
    ds      $1F, 0
wPlayerAttrsEnd:
    ; Garbadge byte
    db