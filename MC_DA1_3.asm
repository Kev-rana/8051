;COUNTER AND REVERSE COUNTER
START:	MOV DPTR, #SEVE
		MOV R0,#0AH
		SETB P0.0	;MAKE P0.0 AS INPUT PORT
		JB P0.0,COUNT	;IF P0.0 IS SET, ASCENDING ORDER COUNTING
		MOV A,DPL
		ADD A,#09H	;SINCE DATABASE POSITION DPTR+9 TO END IS REVERSE NUMBERED 
		MOV DPL,A
		COUNT:	CLR A
				MOVC A,@A+DPTR
				MOV P1,A
				SETB P2.0	;USING THE 7 SEGMENT WHICH P2.0 ACTIVATES 
				ACALL DELAY
				INC DPTR
				DJNZ R0,COUNT
				SJMP START
DELAY:	MOV R1,#08H
		L3:	MOV R2,#0FFH
		L2:	MOV R3,#0FFH
		L1:	DJNZ R3,L1
		DJNZ R2,L2
		DJNZ R3,L3
		RET
SEVE:	DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH,7FH,07H,7DH,6DH,66H,4FH,5BH,06H,3FH
END
	
	
	
	;ROTATE A CONCEPT