MOV TMOD,#20H
MOV TH1,#0F4H
CLR P1.0

SETB P1.1
SETB TR1
BACK:	JNB TF1,BACK

CPL P1.0
CPL P1.1
CLR TF1
SJMP BACK
END
	