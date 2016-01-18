.data
a :
	.double 7

.text
.globl _start 
_start:
	mov $a , %rax
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
	mov $0, %rax
	jmp fin

FinPremier :
		mov $1 ,%rax


fin:    movl    $0,%rbx     
        movl    $1,%rax     
        int     $0x80
