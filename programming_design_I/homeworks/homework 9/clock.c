#include<stdlib.h>
#include<stdio.h>


unsigned long long int begin,end;

inline unsigned long long int rdtsc()//32-bit
{
	unsigned long long int x;
	asm   volatile ("rdtsc" : "=A" (x));
	return x;
}

inline unsigned long long int rdtsc_64bits()//64-bit
{
   unsigned long long int x;
   unsigned a, d;

   __asm__ volatile("rdtsc" : "=a" (a), "=d" (d));

   return ((unsigned long long)a) | (((unsigned long long)d) << 32);
}

int main(){

	begin = rdtsc();
	/*---------------------------
	your function
	---------------------------*/
	end = rdtsc();
	
	printf("Execute cycles %llu \n",(end-begin));
}