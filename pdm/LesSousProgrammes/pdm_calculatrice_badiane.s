# PAPE IBRAHIMA BADIANE

.data
Tab:
    .quad '9' , '4' , '+', '3' , '-' , '2' , '5' , '*' , '/' , '.'
TailleMax:
    .quad 10
.text
.globl main
main:
	    movq $Tab , %rdi
	    movb (%rdi) , %bl
	    movq $48 , %r10

boucle:
	    cmp $'.' , %rbx
	    je fin
	    cmp $0 , TailleMax
	    je fin

	    cmp $48 , %rbx
	    jl symbole
	    cmp $57 , %rbx
	    jg symbole

	    sub %r10 , %rbx

	    push %rbx

	    add $8 , %rdi
	    movb (%rdi) , %bl
	    jmp boucle

symbole:
	    pop %r8
	    pop %rax
	    cmp $43 , %rbx
	    je add
	    cmp $45 , %rbx
	    je sous
	    cmp $42 , %rbx
	    je mult
	    cmp $47 , %rbx
	    je div

add:
	   call addition

sous:
	   call soustraction

mult:
	    call multiplication

div:
	    call division
incre:
	    addq $8 , %rcx
	    movb (%rcx) , %bl
	    jmp boucle

.global addition
.type addtion @function
addition:	
	    add %rax , %r8
	    push %r8
	    jmp incre

.global soustraction
.type soustraction @function
soustraction:
	    sub %r8 , %rax
	    push %rax
	    jmp incre


.global multiplication
.type multiplication @function
multiplication:
	    imul %r8 , %rax
	    push %rax
	    jmp incre

.global division
.type division @function

	   


