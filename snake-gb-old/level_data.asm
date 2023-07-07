SECTION "Level Data", ROM0
LevelData:
; Empty space above map
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
; Top wall
db $09, $07, $07, $07, $07, $07, $07, $07, $07, $07,
db $07, $07, $07, $07, $07, $07, $07, $07, $07, $09, 
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
; Side walls
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $08, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $08,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
; Bottom wall
db $09, $07, $07, $07, $07, $07, $07, $07, $07, $07,
db $07, $07, $07, $07, $07, $07, $07, $07, $07, $09,
LevelDataEnd:

AttributeData:
; Empty space above map
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
; Top wall
db $62, $42, $42, $42, $42, $42, $42, $42, $42, $42,
db $42, $42, $42, $42, $42, $42, $42, $42, $42, $42,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
; Side walls
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $22, $00, $00, $00, $00, $00, $00, $00, $00, $00,
db $00, $00, $00, $00, $00, $00, $00, $00, $00, $02,
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
db $00, $00, $00, $00, $00, $00, ;BLANK SPACE
; Bottom wall
db $22, $02, $02, $02, $02, $02, $02, $02, $02, $02,
db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02,
AttributeDataEnd: