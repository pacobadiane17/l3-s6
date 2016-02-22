	.data
	
taille :
	.byte 10

fichier:
	.String "foo.essai"
bar:
	.String "bar.essai"

.bss
buff :
	.space 10
.text
.globl _start 

_start:

creation:
	mov $8 , %eax
	mov $fichier , %ebx
	mov $0 , % ecx      
	int $0x80

ouvrir_fichier :
	
	mov $5 , %eax
	mov $fichier , %ebx
	mov $buff , %ecx
	int $0x80

ouvrir_bar :
	
	mov $5 , %eax
	mov $bar , %ebx
	mov $buff , %ecx
	int $0x80

id_foo_a_bar:
	mov %eax, %ebx
	mov $3 ,  %eax
	mov $buff , %ecx
	mov $taille , %edx	
	int $0x80

ecrire_sur_foo:
	mov %eax , %r8
	mov $4, %eax
	mov $fichier , %ebx
	mov 
	

fin:    movq   $0,%rbx     
        movq    $1,%rax     
        int     $0x80
