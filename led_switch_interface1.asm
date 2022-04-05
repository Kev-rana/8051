start: 	mov r3,#08h
		mov a,p0
		cjne a,#0feh,lp
		mov a,#55h
		sjmp l
	lp: mov a, #01h
	l: mov p1, a
	rl a
	acall delay_subroutine
	djnz r3, l
	sjmp start

delay_subroutine: mov r0,#40h
l3: mov r1,#0ffh
l2: mov r2,#0ffh
l1: djnz r2, l1
djnz r1, l2 
djnz r0, l3
ret
end
