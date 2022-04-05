mov a, #00h
START: 	mov a, p1
		cjne a, #01h, R
		acall ROTR
R:	cjne a, #02h, N
	acall ROTL
N: 	cjne a, #04h, N1
	acall ROTLS
N1: cjne a, #08h, N2
	acall ROTLS
N2: cjne a, #10h, N3
	acall TOTB
N3: cjne a, #20h, N4
	acall SINBL
N4: cjne a, #40h, N5
	acall ALTBLNKR
N5: cjne a, #80h, START
	acall ALTBLNKL
	sjmp START

ROTR:	mov r1, #0feh
L2: 	mov p0, r1
		lcall DELAY
		mov a, r1
		rr a
		mov r1, a
		mov a, p1
		cjne a, #01h, L1
		sjmp L2
L1: 	ret

ROTL:	mov r1, #0feh
LL2:	mov p0, r1
		lcall DELAY
		mov a, r1
		rl a
		mov r1, a
		mov a, p1
		cjne a, #02h, LL1
		sjmp LL2
LL1:	ret

ROTRS:	mov r1, #01h
LO2:	mov p0, r1
		lcall DELAY
		mov a, r1
		rr a
		mov r1, a
		mov a, p1
		cjne a, #02h, LO1
		sjmp LO2
LO1:	ret
		
ROTLS:	mov r1, #01h
LOP2: 	mov p0, r1
		lcall DELAY
		mov a, r1
		rl a
		mov r1, a
		mov a, p1
		cjne a, #08h, LOP1
		sjmp LOP2
LOP1: 	ret

TOTB:	mov r1, #0ffh
LIP2:	mov p0, r1
		lcall DELAY
		mov a, r1
		cpl a
		mov r1, a
		mov a, p1
		cjne a, #10h, LIP1
		sjmp LIP2
LIP1:	ret

SINBL:	mov r1, #20h
LP2:	mov p0, r1
		lcall DELAY
		mov a, r1
		cpl a
		mov r1, a
		mov a, p1
		cjne a, #20h, LP1
		sjmp LP2
LP1:	ret

ALTBLNKR:	mov r1, #0aah
LN2:	mov p0, r1
		lcall DELAY
		mov a, r1
		rr a
		mov r1, a
		mov a, p1
		cjne a, #40h, LN1
		sjmp LN2
LN1:	ret

ALTBLNKR:	mov r1, #0aah
LK2:	mov p0, r1
		lcall DELAY
		mov a, r1
		rl a
		mov r1, a
		mov a, p1
		cjne a, #40h, LK1
		sjmp LK2
LK1:	ret

DELAY:	mov r5, #05h
LC3:	mov r6, #0f5h
LC2:	mov r7, #0ffh
LC1:	djnz r7, LC1
		djnz r6, LC2
		djnz r5, LC3
		ret
		end
			



SINBL:	mov r1, #20h
		
		
		