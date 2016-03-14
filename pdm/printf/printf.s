.data

buff:
			.space 100
buff2:
			.space 10
.globl Myprintf
.text
Myprintf:

lire_chaine:						# commencer d'abord par lire le contenu de %rdi

		mov	 	$3 , %eax
		mov		(%rdi),%ebx     # descripteur de fichier de rdi

touteChaine:

		mov		$1,%edx       # la taille
		mov 	$buff,%ecx    # stocke ce que tu as lu dans le buffer
		cmp	$35,%ecx		# si le caractere lu est %
		je    remplace
		cmp  $0, %ecx  		# s'il lit la fin de la chaine
		je 		affiche
		inc		%ebx
		jmp 	touteChaine

remplace:								#remplace %machin à la valeur quelle correpond


inserer:  # appel de la fonction atoi()


affiche :
		#ecrire dans la sortie standard
		mov 	$4,%eax
		mov 	$1,%ebx
		mov 	$buff,%ecx
		mov		$100,%edx

end:
        mov   $0,%ebx
        mov    $1,%eax
        int     $0x80
