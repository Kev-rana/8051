;P1.0-P1.7 -> DB0-DB7
;P0.2->RS
;P0.1->R/W
;P0.0->E
;SENDING INFO TO LCD USING MOVC COMMAND
ORG 0H
MOV DPTR,#MYCOM
;LOOP C1 UNTIL MYCOM TABLE(DATA) VALUES REACH END
C1:	CLR A
	MOVC A,@A+DPTR
	ACALL CMDWRT
	ACALL DELAY	;GIVE LCD SOME TIME
	JZ SEND_DATA;IF A=0,MOVE TO SEND_DATA LOOP
	INC DPTR
	SJMP C1		
SEND_DATA:	MOV DPTR,#MYDATA
;LOOP D1 UNTIL MYDATA TABLE(DATA) VALUES REACH END
D1:	CLR A
	MOVC A,@A+DPTR
	ACALL DATAWRT
	ACALL DELAY	;GIVE LCD SOME TIME
	JZ HLT
	INC DPTR
	SJMP D1
HLT: SJMP HLT	;STAY HERE

CMDWRT:	MOV P1,A
		CLR P0.2	;RS=0
		CLR P0.1	;R/W=0
		;CREATE A HIGH TO LOW TRIGGER
		SETB P0.0	;ENABLE HIGH
		CLR P0.0	;ENABLE LOW
		RET
DATAWRT:MOV P1,A
		SETB P0.2	;RS=0
		CLR P0.1	;R/W=0--WRITE
		;CREATE A HIGH TO LOW TRIGGER
		SETB P0.0	;ENABLE HIGH
		CLR P0.0	;ENABLE LOW
		RET
DELAY:	MOV R3,#0FFH
		MOV R4,#0FFH
		MOV R5,#55H
		HERE:	DJNZ R5,HERE
		HERE1:	DJNZ R4,HERE1
		HERE2:	DJNZ R3,HERE2
		RET
ORG 300H
MYCOM:	DB 38H,0EH,01H,06,84H,0	;COMMAND AND NULL
MYDATA:	DB "HELLO",0			;DATA AND NULL
END

