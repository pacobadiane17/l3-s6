.data

taille:
	.byte 2

.bss
buffer: 
	.space 10

.text
.globl _start 

_start:

lire:
	mov $3 , %eax
	mov $0 , %ebx
	mov $buffer , % ecx
	mov $taille, %edx 
	int 0x80

affiche :
	mov 
	mov $4 , %eax
	mov $1 , %ebx
	mov $buffer , %ecx
	mov $9 , %edx
	int 0x80
	

fin:    movq   $0,%rbx     
        movq    $1,%rax     
        int     $0x80
