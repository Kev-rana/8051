ORG 0
LJMP L1
ORG 0BH
CPL P0.0
RETI

ORG 10H
L:	MOV TMOD,#02H
	MOV TH0,#00H
	MOV TL0,#00H
	MOV IE,#02H
	SETB TR0
	L:	MOV C,P1.7
	MOV P1.0,C
	SJMP L
END