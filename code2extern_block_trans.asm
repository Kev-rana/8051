mov dptr,#4500h
clr a
movc a,@a+dptr
mov r1,a
start:  inc dptr
		clr a
		movc a,@a+dptr
		movx @dptr,a
		djnz r1, start
hlt: sjmp hlt
end
//18bee0368 
		