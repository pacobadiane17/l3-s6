.data
taille:
		.long 10
buff:
			.space 100
buff2:
			.space 10

.text
.globl main 
main: 
		call Myprintf

.globl Myprintf
.type Myprintf @function
Myprintf:

lire_chaine:						# commencer d'abord par lire le contenu de %rdi

		mov	 	$3 , %eax
		movq	(%rdi),%rbx     # descripteur de fichier de rdi

touteChaine:

		mov		$1,%edx       # la taille
		mov 	$buff,%ecx    # stocke ce que tu as lu dans le buffer
		cmp		$35,%ecx		# si le caractere lu est %
		mov 	$buff, %r8d		#  je recupere l'adresse d'ou j'ai arrété d'ecrire sur le buffer
		je    	remplace
		cmp  	$0, %ecx  		# s'il lit la fin de la chaine
		je 		affiche
		inc		%ebx
		jmp 	touteChaine

remplace:								#remplace %machin à la valeur quelle correpond
		mov 	$buff2, %ecx
		inc 	%ebx
		cmp		$27 ,%ecx				#fin du parcours s'il lit le caractere espace ou saut de ligne
		je 		inserer
		cmp		$0,%ecx
		je 		inserer
		inc 	%ebx
		jmp 	remplace

inserer:
		mov 	$3, %eax
		movl    %r8d , %ebx  # %r14 represente la ou on pointait dans le buffer
		movq	%rsi , %rcx
		mov		taille, %edx
		
		

	
affiche :
		#ecrire dans la sortie standard
		mov 	$4,%eax
		mov 	$1,%ebx
		mov 	$buff,%ecx
		mov		$100,%edx
		int 	$0x80
		jmp		end
end:
        mov   	$0,%ebx
        mov     $1,%eax
        int     $0x80
