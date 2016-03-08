.data

taille:
		.long 1024
buff:
	.space 100

.global printf
.type printf @function
printf:

lire_chaine:
		# commencer d'abord par lire le contenu de %rdi
		mov	 	$3 , %eax
		mov		(%rdi),%ebx   # descripteur de fichier de rdi
		mov		$1,%edx       # la taille
		mov 	$buff,%ecx    # stocke ce que tu as lu 
		comp	$35 , 


		#ecrire dans la sortie standard
		mov 	$4 , %eax
		mov 	$1	, %ebx
		mov		%rdi , %r14


end:	 
        mov   $0,%ebx     
        mov    $1,%eax     
        int     $0x80


