.data

.text
.globl main
main :	
		call Myprintf

.globl Myprintf
.type Myprintf @function
Myprintf:

lire_chaine:	# commencer d'abord par lire le contenu de %rdi
		movb	(%rdi),%bl
		cmp 	$37, %bl
		jne		affiche_chaine
		je 		remplace

remplace:
		movb 	(%rsi), %dl
		cmp		$0 , %dl
		jne		affiche_entier

affiche_entier:
		mov 	$4,%eax
		movb 	%dl,%ecx
		mov		$1,%edx
		int 	$0x80
		jmp		end
			
affiche_chaine:
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
