/*
Write assembly programs to evaluate and display the results of the following arithmetic
expressions:
•4 + 6
•21 * 2
•4 + 7 / 2
•3 - 6 * (10 / 5)
The expected results are
10
42
7
-9
To display an integer, you can use the solution of Exercise 1
*/

.data 
    result: .string "Result=%d\n"
.text                     # code section
    .globl main               # define main(global)
    .extern printf            # define external func(printf)

main:
    push %rbx                   # push rbx
    mov $4, %rax
    add $6, %rax
    lea result(%rip), %rdi      # load format string to rdi(the first argu)
    mov %rax, %rsi               # load the 10 to rsi(the second argu)
    xor %rax, %rax              # let rax to 0
    call printf                 # call printf
    pop %rbx                    # pop rbx, let rbx recover
    xor %rax, %rax              # let rax to 0

    push %rbx                   # push rbx
    mov $21, %rax
    imul $2, %rax            # 21*2
    lea result(%rip), %rdi      # load format string to rdi(the first argu)
    mov %rax, %rsi               # load the 42 to rsi(the second argu)
    xor %rax, %rax              # let rax to 0
    call printf                 # call printf
    pop %rbx                    # pop rbx, let rbx recover
    xor %rax, %rax              # let rax to 0

    push %rbx                   # push rbx
    mov $7, %rax
    mov $0, %rdx
    mov $2, %rcx
    idiv %rcx            # 7/2
    add $4, %rax        # 4+7/2
    lea result(%rip), %rdi      # load format string to rdi(the first argu)
    mov %rax, %rsi               # load the 42 to rsi(the second argu)
    xor %rax, %rax              # let rax to 0
    call printf                 # call printf
    pop %rbx                    # pop rbx, let rbx recover
    xor %rax, %rax              # let rax to 0
    
    push %rbx                   # push rbx
    mov $10, %rax
    mov $0, %rdx
    mov $5, %rcx
    idiv %rcx            # 10/5
    imul $6, %rax        # 6*(10/5)
    mov $3, %rcx        # 3 -> rcx
    sub %rax, %rcx          # 3-6*(10/5)  sub 減數, 被減數
    lea result(%rip), %rdi      # load format string to rdi(the first argu)
    mov %rcx, %rsi               # load the 42 to rsi(the second argu)
    xor %rax, %rax              # let rax to 0
    call printf                 # call printf
    pop %rbx                    # pop rbx, let rbx recover
    xor %rax, %rax              # let rax to 0
    ret                         # return

