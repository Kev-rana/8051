mov a,#0a7h
mov b,#0f5h
mov r0,#45h 
mov r1,#23h
add a,b
mov r2,a
mov a,r0
addc a,r1
jnc l1
inc r4
l1: mov r3,a
l: sjmp l
end
// 18BEE0368
// add(45a7h,23f5h) = 699ch