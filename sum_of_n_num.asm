	mov dptr,#4500h
movx a,@dptr
mov r0,a
inc dptr
movx a,@dptr
mov b,a
dec r0
start : inc dptr
		movx a,@dptr
		add a,b
		jnc l1
		inc r1
		l1: mov b,a
		djnz r0, start
mov a,b
inc dptr
inc dptr
movx @dptr,a
mov a,r1
inc dptr
movx @dptr,a
hlt: sjmp hlt
end
