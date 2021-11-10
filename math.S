.global max32

# args in r0, r1
# return value should be in r0
max32:
  cmp r0, r1
  bhi 1f
  mov r0, r1
1:
  bx lr @ mov PC LR

.global fibo

# This is recursive
# Do not go too deep
fibo:
  push {r4, r5, lr}
  mov r4, r0
  @ if 0 return 0
  cmp r0, #0
  beq 1f
  @ if 1 return 1
  cmp r0, #1
  beq 1f
  @ else return fibo(n-1) + fibo(n-2)
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

# Also recursive
# using euclid's algo
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

.global square
square:
  bx lr
