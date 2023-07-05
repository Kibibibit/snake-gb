SECTION "DMA Transfer", ROM0

; FUNCTOIN: CopyDMARoutine
;
; Copies the DMA routine into HRAM, as we can't initiate a DMA transfer from ROM
;
; MODIFIES:
;
; `a`, `bc`, hl`
CopyDMARoutine:
    ld      hl, DMATransfer ;Our starting address
    ld      b, DMATransferEnd - DMATransfer ;How many bytes
    ld      c, LOW(hDMARoutine) ;The low byte of the destination address, as we can't control the high byte
.copyDMA
    ld      a, [hli]
    ldh     [c], a
    inc     c
    dec     b
    jr      nz, .copyDMA
    ret

; FUNCTION: DMATransfer
;
; Intiates a DMA transfer to OAM, currently starting at
; the data in $C100 in WRAM
;
; MODIFIES:
;
; `a`
DMATransfer:
    ld      a, $C1
    ld      [rDMA], a
    ld      a, $28       ; We want to delay for 40 cycles
.waitDMA
    dec     a            ; 1 cycle
    jr      nz, .waitDMA ; 3 cycles
    ret
DMATransferEnd:

SECTION "DMA Variables", WRAM0[$C100]
wOAMStagingPoint: 
    ds      $a0

SECTION "DMA In HRAM", HRAM
hDMARoutine:
    ds      DMATransferEnd - DMATransfer