mov dptr,#4500h
movx a,@dptr
mov r0,a
inc dptr
movx a,@dptr
dec r0
mov b,a
start : inc dptr
		movx a,@dptr
		subb a,b
		jnc la
			mov r1,b
			sjmp l
		la: movx a,@dptr
			mov r1,a
		l : mov b,r1
			djnz r0, start
mov a,r1
inc dptr
inc dptr
movx @dptr,a
hlt: sjmp hlt
end 