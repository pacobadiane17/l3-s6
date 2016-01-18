.data
a :
	.double 7

.text
.globl _start 
_start:
debut:
	movq $0, %R6
	mov $2 , %R5	
	mov %R5, %rax
	idiv 2
	movq %rax , %r8
	movq $a , %rax
	movq $2,%rbx

boucle :
	
	compq %rdx , %r8
	je FinPremier
	idiv %rbx
	incq %rbx
	compq %rdx , $0
	je FinNonPremier
	jmp boucle

FinNonPremier  : 
	
	jmp fin

FinPremier :
		incq %R6


fin:    
	compq %R5 ,$a
	jz fin1
	incq %R5
	jmp debut
fin1:
	movl    $0,%rbx     
        movl    $1,%rax     
        int     $0x80
