MAIN:	MOV P0,#0FFH
		ACALL DELAY
		MOV P0,#00H
		ACALL DELAY
		SJMP MAIN
DELAY:	MOV TMOD,#01H
		MOV IE,#81H
		MOV TH0,#0DCH
		MOV TL0,#00H
		SETB TR0
		L:	JNB TF0,L
		CLR TR0
		CLR TF0
		RET
END
/*
MAIN:	CPL P0.0
		ACALL DELAY
		SJMP MAIN
DELAY:	MOV TMOD,#01H
		MOV TH0,#0DCH
		MOV TLO,#00H
		SETB TR0
		L:	JNB TF0,L
		CLR TR0
		CLR TF0
		RET
END
*/