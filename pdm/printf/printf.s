<<<<<<< HEAD
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
=======
	.file	"printf.c"
	.section	.rodata
.LC0:
	.string	"la valeur %d \n:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$10, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
>>>>>>> ec3fceb5d4d22d2ac3d8603ec745cc4a93651a2c
