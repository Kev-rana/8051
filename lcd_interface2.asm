;P1.0-P1.7 -> DB0-DB7
;P0.2->RS
;P0.1->R/W
;P0.0->E
;USING THE BUSY FLAG OF LCD INSTEAD OF WAITING FOR FIXED TIME FOR LCD TO GET FREE(REMOVE FIXED DELAY)
ORG 0H
MOV A,#38H	;USE 2 LINES SCREEN OF LCD
ACALL CMDWRT
MOV A,#0EH	;DISPLAY ON, CURSOR BLINK
ACALL CMDWRT
MOV A,#01H	;CLEAR DISP SCREEN
ACALL CMDWRT
MOV A,#06H	;SHIFT CURSOR RIGHT
ACALL CMDWRT
MOV A,#84H	;MOVE CURSOR TO 5TH CURSOR POS, 4TH INDEX OF 1ST LINE
ACALL CMDWRT

MOV A,#'K'
ACALL DATAWRT
MOV A,#'E'
ACALL DATAWRT
MOV A,#'V'
ACALL DATAWRT

HLT:	SJMP HLT; STAY HERE
CMDWRT:	ACALL READY
		MOV P1,A
		CLR P0.2	;RS=0
		CLR P0.1	;R/W=0
		;CREATE A HIGH TO LOW TRIGGER
		SETB P0.0	;ENABLE HIGH
		CLR P0.0	;ENABLE LOW
		RET
DATAWRT:ACALL READY
		MOV P1,A
		SETB P0.2	;RS=0
		CLR P0.1	;R/W=0--WRITE
		;CREATE A HIGH TO LOW TRIGGER
		SETB P0.0	;ENABLE HIGH
		CLR P0.0	;ENABLE LOW
		RET
READY:	SETB P1.7	;SET P1.7 AS INPUT PORT TO READ BUSY FLAG FROM DB7 PIN OF LCD
		SETB P0.2	;R/W=1--READ
		CLR P0.2	;R/S=0--COMMAND
		;READ COMMAND REG AND CHECK BUSY FLAG
		BACK:	;CREATE A LOW TO HIGH TRIGGER, WHY?? TO READ FROM LCD??
				CLR P0.0	;ENABLE LOW
				SETB P0.0	;ENABLE HIGH
				JB P1.7,BACK
		RET
END