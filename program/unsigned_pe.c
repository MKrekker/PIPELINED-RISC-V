#include <stdio.h>
#define SIZE 4

unsigned int xnor(int a, int b)
{ 
    unsigned int c = 0;
    c = a ^ b;
    c = ~c;
    return c;
}

int pcnt(int rs1)
{
	int count = 0;
	for (int index = 0; index < 32; index++)
		count += (rs1 >> index) & 1;
	return count;
 }

 int shifting(int a, int b)
 {
   int num_1 = pcnt(xnor(a,b));
   int num_b = 32;
   return ((num_1 << 1) - num_b);
 }

 int main (void)
 {
   int data[SIZE] = {4, 7, 15, 3};
   int threshold = 8;
   int i = SIZE-1;
   int tcache = 0;
   printf("%d\n", pcnt(xnor(4,7)));
   while(i > 0)
   {
      int popc = shifting(data[i], data[i-1]);
      tcache += popc;
      if(tcache < threshold)
      {
        printf("%d\n", 0);
      }
      else
      {
        printf("%d\n", 1);
      }
      i--;
   }
   return 0;
 }
