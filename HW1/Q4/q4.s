/*
Write an assembly program that evaluates the following three instructions:
let x = 2
let y = x * x
print (y + x)
2
The variables x and y will be allocated in the data segment. The expected outcome is 6.
*/


.data
    result: .string "Result=%d\n"       # 結果字串格式
    x: .quad 2
    y: .quad 0

.text 
    .global main

main:
    push %rbx
    mov x(%rip), %rax

    # y = x*x
    imul %rax, %rax
    mov %rax, y(%rip)

    # y+x
    mov x(%rip), %rsi
    add y(%rip), %rsi

    lea result(%rip), %rdi
    xor %rax, %rax
    call printf
    xor %rax, %rax

    pop %rbx
    ret
