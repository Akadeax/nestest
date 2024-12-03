; NES Cartridge header
.segment "HEADER"
INES_MAPPER = 0
INES_MIRROR = 0
INES_SRAM   = 1 

.byte 'N', 'E', 'S', $1A ; ID
.byte $02
.byte $01
.byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $f) << 4)
.byte (INES_MAPPER & %11110000)
.byte $0, $0, $0, $0, $0, $0, $0, $0

.segment "TILES"
.byte $00

.segment "VECTORS"
.word nmi
.word reset
.word irq

.segment "OAM"
oam: .res 256

.segment "BSS"
palette: .res 32


.segment "CODE"
.proc main
.ifdef TESTS
	.include "tests.s"
.endif

:
	jmp :-
.endproc

nmi:
reset:
	jsr main
	
irq: