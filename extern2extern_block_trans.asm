mov dptr,#4500h
movx a,@dptr
mov r0,a
start:  inc dptr
		movx a,@dptr
		inc dph
		dec dpl
		movx @dptr,a
		inc dptr
		dec dph
		djnz r0,start
hlt: sjmp hlt
end
//18bee0368S