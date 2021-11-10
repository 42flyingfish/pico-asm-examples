/* TThe following code is a series of practice problems using assembly
   There is no benefit to doing this outside of my own learning
   Several functions implemented in ASM are described below
   
   a simple max32 function that returns the largest of two args
   a recursive fibo function that provides the nth value in the series
      This was a nice way to learn about the stack; however, an iterative
	  version exist
   a gcd function implemented using euclid's algorithm
      The pico does not have instruction for division or mod meaning I had to
	  use subtraction
   
 */


#include <stdio.h>
#include "pico/stdlib.h"
#include <iostream>

extern "C" int max32(int num1, int num2);
extern "C" int fibo(int n);
extern "C" int gcd(int x, int y);
extern "C" void squar(uint32_t nums[], size_t count);

int main()
{
	stdio_init_all(); // Do I even need this?

	puts("We are ready to go!\n");

	while(true) {
		std::cout << max32(1, 2) << std::endl;
		sleep_ms(1000);
		std::cout << max32(30, 2) << std::endl;
		sleep_ms(1000);
		std::cout << "FIBO" << std::endl;
		for (int i = 0; i < 16; ++i) {
			std::cout << fibo(i) << std::endl;
		}
		sleep_ms(1000);
		std::cout << "GCD " << gcd(48, 18) << std::endl;
	}

	return 0;
}
