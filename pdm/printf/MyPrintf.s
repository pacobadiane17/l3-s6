.data
chaine:
		.string " "
entier :
		.int 0
arg0:
	.string "votre est nom est : %c \n"
arg1:
	.string	"Pape Badiane"

.text
.globl main
main:
		mov 	$arg0 , %rdi
		mov 	$arg1 , %rsi
		call 	Myprintf


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
		cmp 	$37, %bl       #compare avec le caractere le caractère spécial %
		je 		type
type:
		
		movb 	(%rdi), %dl
		cmp 	$99,%dl				#compare le contenu du registre dl à c
		je 		affiche_en_char
		cmp 	$100,%dl				#compare le contenu du registre dl à d
		je 		affiche_en_int
		int 	$0x80

affiche_en_int:
		inc		%rdi
		mov 	$4,%eax
		mov 	$0,%ebx
		mov 	%esi , entier
		mov 	$entier, %ecx
		mov		$8,%edx
		int 	$0x80
		jmp		lire_chaine

affiche_en_char:
		inc		%rdi
		movb	(%rsi), %cl
		inc		%rsi
		cmp 	$0,%cl
		je 		lire_chaine
		mov 	%rcx, chaine
		mov 	$4,%eax
		mov 	$0,%ebx  # sortie standard
		mov 	$chaine, %ecx
		mov		$1,%edx  # taille
		int 	$0x80
		jmp		affiche_en_char

			
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
