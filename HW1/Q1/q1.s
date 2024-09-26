.data                     # data
    msg: .string "n = %d\n"   # define format, and add 0(\n)

.text                     # code section
    .globl main               # define main(global)
    .extern printf            # define external func(printf)

main:
  push %rbx                   # push rbx
  lea  msg(%rip), %rdi      # load format string to rdi(the first argu)
  ; mov $msg, %rdi  # or can do it.
  mov  $42, %rsi               # load the 42 to rsi(the second argu)
  xor %rax, %rax              # let rax to 0
  call printf                 # call printf
  pop %rbx                    # pop rbx, let rbx recover
  xor %rax, %rax        # this step let rax to 0, printf will return the number of string that success echo.
  ret                         # return