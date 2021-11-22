# pico-asm-examples
This repo is mostly me practicing writing assembly on the rp2040.
This is inspired by the Hackaday U series on the Raspberry Pi Pico
My goal was to write assembly for the rp2040
Due to the fact that main.cpp is using c++, I have to use name mangaling.
All assembly functions can be found in math.S

Here are the functions implemented.
1. max32. Takes two ints and returns the largest.
2. fibo. Returns the nth value in the fibonacci sequence. This algorithm is recursive. I wrote it this way to learn about pushing and poping the stack.
3. gcd. Returns the greatest common divisor of the two arguments. This implementation does not use division and instead uses subtraction. Because of this, it can be quite slow.
4. square. Takes an array of ints and squares each value. This taught me how to work with an array in asm.
5. gcdHWDivider. This is similar to the above gcd implementation but is uses the rp2040's integer divider.
