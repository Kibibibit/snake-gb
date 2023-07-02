; Storing all the input handling code here
SECTION "Inputs", ROM0

; Function: ReadJoypad
;
; Updates wButtonsPressed and wButtonsHeld
; based on the current joypad inputs
; 
; MODIFIES:
;
; `a`, `b`
ReadJoypad:
    ; Start by polling the buttons
    ld a, P1F_GET_BTN
    call .DebounceInput
    ld b, a ; Now b is storing the button inputs, as ---- Start Select B A

    ld a, P1F_GET_DPAD
    call .DebounceInput ; And now a is storing ---- down up left right
    swap a ; Now a is storing down up left right ----

    ; Keep in mind, each `-` is a 1, and if a button is pressed, it will be 0
    ; So if A and up on the dpad are being pressed we get:
    ; a = 1011 1111
    ; b = 1111 1110 
    
    xor a, b ; Now we xor a and b and that tells us which buttons have been pressed
    ; from our previous example:
    ; a ^ b = 0100 0001
    ; so now a is storing which buttons have been pressed as: down up left right start select b a, where a 1 means it's been pressed

    ld b, a ; Store this read in b while we disable input reading

    ld a, P1F_GET_NONE
    ldh [rP1], a

    ; Now we use the previous frame's held buttons to sort out which buttons were pressed this frame
    ld a, [wButtonsHeld]

    ; From the previous example -> if last frame, B and A were pressed, a currently stores:
    ; a = 0000 0011
    ; and b is storing:
    ; b = 0100 0001

    xor a, b ; Now a stores any key that has changed state from last frame, however it includes keys that were released
    ; We xor a and b
    ; a^b = 0100 0010
    ;   a = 0100 0010
    ; Note that the 1st bit, the B button is registered as being pressed, even though it was released 
    
    and a, b ; Now it is only keys that have been pressed, as we have AND'd it with the previous input
    ; a = 0100 0010
    ; b = 0100 0001
    ; a & b = 0100 0000
    ; Telling us that only up has been pressed this frame
    ; Now we can write that to wButtonsPressed
    ld [wButtonsPressed], a

    ; Now we set b to a, and then write all the pressed buttons into wButtonsHeld
    ld a, b 
    ld [wButtonsHeld], a
    ret



; Basically a debouncer. Hacky as hell but hey it works
;
; After this is called, `a` will be set to $F0 | [rP1]
.DebounceInput:
    ldh [rP1], a ; Set P1 to button or dpad mode
    call .WaitABit
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    or a, $F0; It's handy to have the top 4 bits set as 1
    ret

; Hoorah for hacky waiting. This waits about 10 cycles
.WaitABit:
    ret

SECTION "Input variables", WRAM0
; Stores the buttons that are currently being pressed, in the order:
;
; down up left right start select b a
wButtonsHeld: db
; Stores the buttons that were pressed this frame, in the order:
;
; down up left right start select b a
wButtonsPressed: db