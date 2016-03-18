#include <stdio.h>
#include <inttypes.h>


void Myprintf(char * , int64_t);

int main(){
	
int64_t valeur = 10;

Myprintf("la valeur %d \n:", valeur);

return 0;
}