.data
chaine:
		.string " "
entier :
		.int 0

.globl Myprintf
.type Myprintf @function
Myprintf:

lire_chaine:	# commencer d'abord par lire le contenu de %rdi
		movb	(%rdi),%bl
		inc 	%rdi
		cmp 	$0,%bl
		je 		end
		cmp 	$37, %bl       #compare avec le caractere le caractère spécial %
		jne		affiche_chaine
		add		$2, %rdi
		cmp 	$37, %bl       #compare avec le caractere le caractère spécial %
		je 		affiche_valeur
		
affiche_valeur:
		
		mov 	$4,%eax
		mov 	$0,%ebx
		mov 	%esi , entier
		mov 	$entier, %ecx
		mov		$8,%edx
		int 	$0x80
		jmp		lire_chaine
			
affiche_chaine:
		mov 	%bl, chaine
		mov 	$4,%eax
		mov 	$0,%ebx  # sortie standard
		mov 	$chaine, %ecx
		mov		$1,%edx  # taille
		int 	$0x80
		jmp		lire_chaine

		
end:
        mov   	$0,%ebx
        mov     $1,%eax
        int     $0x80
