#include <stdio.h> 
#include <math.h> 
int main() { 
  unsigned long long int uimax1 = (unsigned long long int) (pow(2,64) -1); //uint max
  unsigned long long int uimax2 = (unsigned long long int) (pow(2,127) -1); //saturated to pow(2,64) -1
  unsigned long long int val_1023 = (unsigned long long int) (pow(2,10) -1); //1023
  unsigned long long int uimin = (unsigned long long int) (pow(2,10) * -1); //negative => saturated to 0
  
  long long int imax = (long long int) (pow(2,63)-1); //max long long int
  long long int imaxsat = (long long int) pow(2,127); //saturated to max long long int
  long long int m1023 = (long long int) (pow(2,10) * -1); //-1023
  long long int imin = (long long int) (pow(2,63) * -1); //min long long int
  long long int iminsat = (long long int) (pow(2,127) * -1); //saturated to min long long int
  
  long long int imax1= (int) (pow(2,63)-1); //max int
  long long int imin1 = (int) (pow(2,63) * -1); //min int
  long long int imax2= (int) (pow(2,31)-1); //max int
  long long int imin2 = (int) (pow(2,31) * -1); //min int

  
  
  printf("highest number represented by unsigned long long int is %llu\n", uimax1);
  printf("pow(2,127) -1) is saturated to pow(2,64) -1: %llu\n", uimax2);
  printf("pow(2,10) -1 = %llu\n", val_1023);
  printf("pow(2,10) * -1 is saturated to 0: %llu\n", uimin);
  
  printf("highest number represented by long long int is %lld\n", imax);
  printf("saturated to highest number represented by long long int is %lld\n", imaxsat);
  printf("lowest number represented by long long int is %lld\n", imin);
  printf("saturated to lowest number represented by long long int is %lld\n", iminsat);
  printf("pow(2,10) * -1 = %lld\n", m1023);
  
  printf("highest number represented by int is %lld\n", imax1);
  printf("lowest number represented by int is %lld\n", imin1);
  printf("(pow(2,31)-1) = highest number represented by int is %lld\n", imax2);
  printf("(pow(2,31) * -1) = lowest number represented by int is %lld\n", imin2);
  
  
  return 0 ; 
} 


