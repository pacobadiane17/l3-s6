.data

unNom :
	.space 4

.text
.globl _start 

_start:
	

fin:    movq   $0,%rbx     
        movq    $1,%rax     
        int     $0x80
