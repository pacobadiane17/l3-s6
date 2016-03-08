#include <stdio.h>
#include <assert.h>
#include <stdlib.h>



 void fibonaci(int rang){

	int * tableau;
	tableau = malloc(sizeof(int) * (rang+1));
	int i;
	
	assert(rang >=1);

	/* calcul du fibonaci pour un rang n donné */	
	if( rang >=2){
		tableau[0] =0;
		tableau[1] =1;

		for(i=2 ; i <= rang; i++){
			tableau[i] = tableau[i-1] + tableau[i-2];		
		}

	}else{
		if(rang = 1){
		
			tableau[0] =0;
			tableau[1] =1;
		}
	}

	/* affichage de la valeur*/
	for(i =0 ; i<=rang ; i++){

		printf("%d \n", tableau[i]);
	}
	
	

}


int main (int argc , char **argv){

		
	fibonaci(6);


}


