mov b,#05h  // 05
mov a,#0feh	// 254
div ab
l1: sjmp l1
end
// 18BEE0368
// div(a,b) = 254 / 05 = 50 remainder 4 = 32h remainder 04
