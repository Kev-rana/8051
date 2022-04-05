mov dptr,@4500h
mox a,@dptr
mov r1,a
l1: mov dptr,#4500h
	movx a,@dptr
	mov r0,a
	dec r0
l2: inc dptr
	movx a,@dptr
	mov b,a
	inc dptr
	movx a,@dptr
	subb a,b
	jnc l3
	movx a,@dptr
	mov r2,a
	mov a,b
	movx @dptr,a
	dec dpl
	mov a,r2
	movx @dptr,a
	sjmp l
l3: dec dpl
l : djnz r0,l2	
	djnz r1,l1
hlt : sjmp hlt
end
	