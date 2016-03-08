#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <string.h>
#include <assert.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <stdio.h>


int main (int argc, char *argv[]){
	
	int sock;
	struct sockaddr_in* addr;
	int resultat;

	/* inialiser socket */
	sock = socket(AF_INET,SOCK_DGRAM, 0);
	assert (sock != -1);


	/* iniatialiser le sockaddr_in */
	addr = (struct sockaddr_in *) malloc(sizeof(struct sockaddr_in)); /* Allocation de la memoire */
	addr = (struct sockaddr_in *) memset(addr,0,sizeof(struct sockaddr_in)); /* Nettoyage complet de la struct */

	/* addresse ip*/
	const char * adresse ="127.0.0.1";
	//addr->sin_addr = inet_addr(adresse);
	inet_pton(AF_INET, adresse, &(addr->sin_addr.s_addr));


	/* numero de port*/	
	addr->sin_family = AF_INET;
	addr->sin_port = htons(5000);
	
	/*Envoi d’un message*/
	const char * message = " Bonjour je m'appelle Pape, et toi tu es qui ???";
	resultat = sendto(sock, message , strlen(message)+1, 0, addr, sizeof(*addr));

	assert(resultat != -1);


	free(addr);

}
