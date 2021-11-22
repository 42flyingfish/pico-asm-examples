.global max32

// args in r0, r1
// return value should be in r0
max32:
  cmp r0, r1
  bhi 1f
  mov r0, r1
1:
  bx lr @ mov PC LR

.global fibo

// This is recursive
// Do not go too deep
fibo:
  push {r4, r5, lr}
  mov r4, r0
  // if 0 return 0
  cmp r0, #0
  beq 1f
  // if 1 return 1
  cmp r0, #1
  beq 1f
  // else return fibo(n-1) + fibo(n-2)
  sub r0, #1
  bl fibo
  mov r5, r0
  mov r0, r4
  sub r0, #2
  bl fibo
  add r0, r5

1:
  pop {r4, r5, pc}

.global gcd

// using euclid's algo
gcd:
1:
  cmp r0, r1
  beq 1f
  bhi 2f
  sub r1, r1, r0
  b 1b
2:
  sub r0, r0, r1
  b 1b
1:
  bx lr


.macro __divider_delay
// delay 8 cycles
   b 3f
3: b 3f
3: b 3f
3: b 3f
3:
.endm

.global gcdHWDivider

gcdHWDivider:
push {r4, lr}
// load the offset of sio into r3
// according to the data sheet, the divder is at
// SIO 0xd0000000 with an offset of #0x074
ldr r4, =0xd0000000
1: cmp r0, r1
  bhi 2f
  mov r3, r1
  mov r1, r0
  mov r0, r3
  cmp r1, #0
  beq 1f
2:
  str r0, [r4, #0x068]
  str r1, [r4, #0x06c]
  // according the document, we need to delay by 8 cycles
  __divider_delay
  mov r0, r1
  // while the quotient is unused, the documentation
  // recommends reading both the remainder and quotion in that order
  ldr r1, [r4, #0x074]
  ldr r3, [r4, #0x070]
  cmp r1, #0
  bne 2b
1:
  pop {r4, pc}


.global square
square:
  cmp r1, #0
  beq 2f
  push {r4}
  mov r3, #0
1:
  ldr r4, [r0, r3]
  mul r4, r4, r4
  str r4, [r0, r3]
  add r3, #4
  sub r1, #1
  bne 1b

  pop {r4}
2:  bx lr
