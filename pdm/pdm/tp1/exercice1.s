.data
repetition:
	.long 5
	.string "*"
UnAutre:
          .space 4
.text
.globl _start 
_start:
        movl $1, %eax
	movl $5, %ebx
	imul %ebx
	
done:    movl %ebx, UnAutre 
        movl    $0,%ebx     
        movl    $1,%eax     
        int     $0x80
       
