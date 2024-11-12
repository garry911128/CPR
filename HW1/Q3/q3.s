/*
Taking the convention that the integer 0 represents the Boolean value false and any other
integer represents the value true, write assembly programs to evaluate and display the results
of the following expressions (you must display true or false in the case of a Boolean result):
•true && false
•if 3 <> 4 then 10 * 2 else 14
•2 = 3 || 4 <= 2 * 3
The expected results are
false
20
true
It will be useful to write a print_bool function to display a boolean.
*/

.data
    true_str: .string "true\n"          # true 字串
    false_str: .string "false\n"        # false 字串
    result: .string "Result=%d\n"       # 結果字串格式

.text
    .globl main
    .extern printf                      # 定義外部函數 printf
    .global print_bool

# print_bool 函數，用來印出 true 或 false
print_bool:
    push %rbx                           # 保存 %rbx 的值到堆疊中
    cmp $0, %rdi                        # 比較 %rdi 和 0 (0 代表 false)
    je .Lfalse                          # 如果 %rdi == 0，跳到 .Lfalse

    # 如果不是 0，顯示 "true"
    lea true_str(%rip), %rdi            # 將 true 字串的地址載入 %rdi
    xor %rax, %rax                      # 將 %rax 清零，為了呼叫 printf
    call printf                         # 呼叫 printf 顯示 true
    pop %rbx                            # 從堆疊恢復 %rbx 的值
    xor %rax, %rax                      # 將 %rax 清為 0
    ret

.Lfalse:
    # 顯示 "false"
    lea false_str(%rip), %rdi           # 將 false 字串的地址載入 %rdi
    xor %rax, %rax                      # 將 %rax 清零，為了呼叫 printf
    call printf                         # 呼叫 printf 顯示 false
    pop %rbx                            # 從堆疊恢復 %rbx 的值
    xor %rax, %rax                      # 將 %rax 清為 0
    ret

# 主程式開始
main:
    # true && false 結果為 false
    push %rbx                           # 保存 %rbx 的值到堆疊中
    mov $1, %rdi                        # %rdi = true (1)
    mov $0, %rsi                        # %rsi = false (0)
    and %rsi, %rdi                      # true && false，結果為 false (0)
    call print_bool                     # 呼叫 print_bool，印出 false
    pop %rbx                            # 從堆疊恢復 %rbx 的值

    # if 3 <> 4 then 10 * 2 else 14
    push %rbx                           # 保存 %rbx 的值到堆疊中
    mov $3, %rdi                        # %rdi = 3
    cmp $4, %rdi                        # 比較 %rdi 和 4
    jne .A2_True                        # 如果 %rdi != 4，跳到 .A2_True
    mov $14, %rsi                       # 如果相等，則結果為 14
    jmp .print_result                   # 跳到列印結果的部分

.A2_True:
    mov $10, %rsi                       # 將 10 賦值給 %rsi（格式字串中的第一個變數）
    imul $2, %rsi                       # 將 %rsi 乘以 2，結果為 20

.print_result:
    lea result(%rip), %rdi              # 將格式字串 "Result=%d\n" 的地址載入 %rdi
    xor %rax, %rax                      # 將 %rax 清為 0，為了呼叫 printf
    call printf                         # 呼叫 printf 顯示結果
    pop %rbx                            # 從堆疊恢復 %rbx 的值

    # 2 = 3 || 4 <= 2 * 3 結果為 true
    push %rbx                           # 保存 %rbx 的值到堆疊中
    mov $2, %rdi                        # %rdi = 2
    cmp $3, %rdi                        # 比較 %rdi 和 3
    sete %bl                            # 如果相等，則 %bl = 1 (true)，否則 %bl = 0 (false)
    
    mov $4, %rdi                        # %rdi = 4
    mov $2, %rsi                        # %rsi = 2
    imul %rsi, %rsi                     # %rsi = 2 * 3 = 6
    cmp %rsi, %rdi                      # 比較 4 <= 6
    setle %dl                           # 如果 4 <= 6，則 %dl = 1 (true)，否則 %dl = 0 (false)

    or %dl, %bl                         # 2 = 3 || 4 <= 6，結果為 true (1)
    movzx %bl, %rdi                     # 擴展 %bl 並儲存到 %rdi
    call print_bool                     # 呼叫 print_bool，印出 true
    pop %rbx                            # 從堆疊恢復 %rbx 的值

    xor %rax, %rax                      # 將 %rax 清為 0
    ret                                 # 返回


