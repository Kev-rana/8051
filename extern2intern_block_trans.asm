mov r0,#50h
mov dptr,#4500h
movx a,@dptr
mov r1,a
start:  inc dptr
		movx a,@dptr
		mov @r0,a
		inc r0
		djnz r1, start
hlt: sjmp hlt
end
//18bee0368 
		