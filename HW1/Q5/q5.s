/*
Exercise 5: Local Variables (10 pts)
Write an assembly program that evaluates the following program:
print (let x = 3 in x * x)
print (let x = 3 in (let y = x + x in x * y) + (let z = x + 3 in z / z))
We will allocate the variables x, y and z in the stack. The expected result is
9
19
*/


.data
  result: .string "Result=%d\n"    # 用來顯示整數的格式字串

.text
.globl main

main:
  # 設置堆疊起始位置
  push %rbx
  # 調整堆疊空間，確保變數儲存在堆疊中，分配空間為 x, y, z 各 8 bytes
  sub $24, %rsp

  # 第一個表達式：print (let x = 3 in x * x)
  # let x = 3
  movq $3, -8(%rsp)             # 將 x 儲存到 -8(%rsp)
  # x * x
  movq -8(%rsp), %rax           # 將 x 載入到 %rax
  imul %rax, %rax               # %rax = %rax * %rax
  # 顯示結果 9
  movq %rax, %rsi               # 將結果放入 %rsi 作為 printf 的參數
  lea result(%rip), %rdi    # 加載格式字串
  xor %rax, %rax                # 將 %rax 清零
  sub $8, %rsp                  # 清空堆疊空間 
  call printf                   # 呼叫 printf 顯示結果
  add $8, %rsp                  # 恢復堆疊空間
  
  # 第二個表達式：
  # print (let x = 3 in (let y = x + x in x * y) + (let z = x + 3 in z / z))
  # let x = 3
  movq $3, -8(%rsp)             # 將 x 儲存到 -8(%rsp)

  # let y = x + x
  movq -8(%rsp), %rax           # 將 x 載入 %rax
  addq %rax, %rax               # y = x + x
  movq %rax, -16(%rsp)          # 將 y 儲存到 -16(%rsp)

  # x * y
  movq -8(%rsp), %rax           # 將 x 載入 %rax
  movq -16(%rsp), %rbx          # 將 y 載入 %rbx
  imul %rbx, %rax               # %rax = x * y
  movq %rax, %rcx               # 將 x * y 儲存到 %rcx

  # let z = x + 3
  movq -8(%rsp), %rbx           # 將 x 載入 %rbx
  addq $3, %rbx                 # z = x + 3
  movq %rbx, -24(%rsp)          # 將 z 儲存到 -24(%rsp)

  # z / z
  movq -24(%rsp), %rax          # 將 z 載入 %rax
  xor %rdx, %rdx                # 清空 %rdx（避免被除法影響）
  divq %rax                     # %rax = %rax / %rax, %rdx = %rax % %rax (餘數)
  # (x * y) + (z / z)
  addq %rax, %rcx          # 將 z / z 的結果加到 x * y

  # 顯示結果 19
  movq %rcx, %rsi          # 將結果放入 %rsi 作為 printf 的參數
  lea result(%rip), %rdi    # 加載格式字串
  xor %rax, %rax                # 將 %rax 清零 
  sub $8, %rsp                  # 清空堆疊空間 
  call printf                   # 呼叫 printf 顯示結果
  add $8, %rsp                  # 恢復堆疊空間
  # 釋放堆疊空間
  mov $0, %rax
  add $24, %rsp 
  pop %rbx

  ret


