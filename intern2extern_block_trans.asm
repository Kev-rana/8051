mov r0,#50h
mov dptr,#4500h
mov a,@r0
mov r1,a
l : inc r0
	mov a,@r0
	movx @dptr,a
	inc dptr
	djnz r1, l
l1: sjmp l1
end
//18bee0368