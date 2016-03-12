.data
	
rang :
			
			.long 6
facteur:
			.long 8

.text
.global main
main:

	push 	 %rbp
	mov 	$rang, %rax
	mov 	$facteur , %rbx
	call 	fibonaci
	mov $0,%rbx
	mov $1 , %rax
	int $0x80
	
      
.global fibonaci
.type fibonaci @function
fibonaci:
	push 	%rax
	push	%rbx
	movq 	$0 , 0(%rbp)
	movq 	$1 , 8(%rbp)

boucle:
	movq 	$facteur , %r8
	subq 	$8 , %r8
	movq 	%r8 , %r9
	subq 	$8 , %r9
	addq 	%r8 , %r9
	movq 	%r9 , facteur(%rbp)
	movq 	facteur(%rbp), %r10
	addq 	$8 , %rbx
	dec 	%rax
	jnz 	boucle
	
	call 	printf
	pop		%rax
	pop 	%rbx
	pop 	%rbp
	ret


