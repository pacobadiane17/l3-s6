.data
	

.global main

        .text
main:
        push    %rbx                    # we have to save this since we use it
        mov     $90, %ecx               # ecx will countdown to 0
        xor     %rax, %rax              # rax will hold the current number
        xor     %rbx, %rbx              # rbx will hold the next number
        inc     %rbx                    # rbx is originally 
        call    fibonaci 		 # call fibonaci function
	pop     %rbx                    # restore rbx before returning
	mov 	$0,%rbx
	mov	$1,%rax
	int $0x80
	            
.global fibonaci
.type fibonaci @function
fibonaci:
	

        # We need to call printf, but we are using eax, ebx, and ecx.  printf
        # may destroy eax and ecx so we will save these before the call and
        # restore them afterwards.

			
        push    %rax                    # caller-save register
        push    %rcx                    # caller-save register

	mov     $format, %rdi           # set 1st parameter (format)
        mov     %rax, %rsi              # set 2nd parameter (current_number)
	xor     %rax, %rax              # because printf is varargs


        # Stack is already aligned because we pushed three 8 byte registers
        call    printf                 # printf(format, current_number)

        pop     %rcx                    # restore caller-save register
        pop     %rax                    # restore caller-save register

        mov     %rax, %rdx              # save the current number
        mov     %rbx, %rax              # next number is now current
        add     %rdx, %rbx              # get the new next number
        dec     %ecx                    # count down
        jnz     fibonaci            # if not done counting, do some more
        ret
format:
        .asciz  "%20ld\n"
