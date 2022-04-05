mov a, #01h
l: mov p1, a // assign 00000001 to port1
rr a
acall delay_subroutine
sjmp l

delay_subroutine: mov r0,#40h
l3: mov r1,#0ffh
l2: mov r2,#0ffh
l1: djnz r2, l1
djnz r1, l2
djnz r0, l3
ret
end
