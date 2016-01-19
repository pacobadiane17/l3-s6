.data
a :
	.long 13481754
b : 
	.long 1234715
UnAutre:
          .space 4
.text
.globl _start 
_start:
	mov $a , %rax
	idv $b
	j         


top:   addl (%ecx), %ebx  
         addl $4, %ecx      
         decl %eax         
         jnz top           
done:    movl %ebx, UnAutre 
        movl    $0,%ebx     
        movl    $1,%eax     
        int     $0x80
       
