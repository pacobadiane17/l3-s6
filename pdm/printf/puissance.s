# puissance 2 3
.data

argument:
			.long 4
format:
		.asciz "%20ld \n"
message :
			.asciz "ok \n"
.text
.global main
main :
	
		movq		%rdi , argument
		mov 	%rsi , %r12
		mov 	8(%r12), %rdi    	#b recupere la premiere valeur pour le calcul de puissance
		call 	atoi				# appel de atoi(arg)
		push 	%rax
		movq 	%rax, %r15 		# convertit en entier la premiere valeur
		pop 	%rax
		movq 	16(%r12), %rdi
		call 	atoi
		movq	%rax , %r14  		# convertit la puissance de calcul enentier
boucle :
		imul 	%r15d , %r15d
		dec 	%r14
		jnz 	boucle
		movq 	$format , %rdi
		movslq 	%r15d , %rsi
		xor		%rax , %rax
		call 	printf

end:	 
        mov   $0,%ebx     
        mov    $1,%eax     
        int     $0x80


