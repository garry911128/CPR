.data
format:     .string "sqrt(%2d) = %2d\n"  # Define format string for printf

.text
.global main
.extern printf

# Function: isqrt
# Calculates the integer square root
isqrt:
    pushq   %rbp                    # Save base pointer
    movq    %rsp, %rbp              # Set base pointer to current stack pointer
    subq    $16, %rsp               # Allocate 16 bytes on stack (space for `c` and `s`)

    movl    $0, -4(%rbp)            # c = 0
    movl    $1, -8(%rbp)            # s = 1

.Lloop_isqrt:
    movl    8(%rbp), %eax           # eax = n (argument passed to isqrt, located at [rbp+8])
    cmpl    -8(%rbp), %eax          # Compare eax with s
    jl      .Lend_isqrt             # If n < s, jump to end of loop

    addl    $1, -4(%rbp)            # Increment c by 1

    movl    -4(%rbp), %eax          # eax = c
    leal    1(,%eax,2), %edx        # edx = 2*c + 1 (using LEA instruction)
    addl    %edx, -8(%rbp)          # s += 2*c + 1

    jmp     .Lloop_isqrt            # Loop back

.Lend_isqrt:
    movl    -4(%rbp), %eax          # Return c in eax
    leave                           # Restore base pointer and stack pointer
    ret                             # Return from isqrt

# Function: main
main:
    pushq   %rbp                    # Save base pointer
    movq    %rsp, %rbp              # Set base pointer to current stack pointer
    subq    $16, %rsp               # Allocate 16 bytes on stack (space for `n`)

    movl    $0, -4(%rbp)            # Initialize n = 0

.Lloop_main:
    movl    -4(%rbp), %eax          # Load n into eax
    cmpl    $21, %eax               # Compare n with 21
    jge     .Lend_main              # If n >= 21, jump to end of loop

    movl    -4(%rbp), %edi          # Pass n as the first argument to isqrt
    call    isqrt                   # Call isqrt(n)
    
    movl    -4(%rbp), %esi          # Set second argument for printf (n)
    movl    %eax, %edx              # Set third argument for printf (isqrt result)
    leaq    format(%rip), %rdi      # Load address of format string
    movb    $0, %al                 # AL = 0 (no SSE registers used)
    call    printf                  # Call printf(format, n, isqrt(n))

    addl    $1, -4(%rbp)            # Increment n by 1

    jmp     .Lloop_main             # Jump back to start of loop

.Lend_main:
    movl    $0, %eax                # Return 0 from main
    leave                           # Restore base pointer and stack pointer
    ret                             # Return from main
