.data                     # 資料段
    msg: .string "n = %d\n"   # 定義格式字串，尾部自動加上 0 字符

.text                     # 程式碼段
    .globl main               # 定義全域主函數
    .extern printf            # 宣告外部的 printf 函數

main:
  push %rbx                   # 保存 %rbx 的值
  lea  msg(%rip), %rdi      # 加載格式字串的地址到 %rdi
  mov  $42, %rsi               # 將 42 (數值) 存入 %esi，會自動擴展到 %rsi
  xor %rax, %rax              # 高效清空 %eax
  call printf                 # 呼叫 printf 函數
  pop %rbx                    # 恢復 %rbx 的原始值
  xor %rax, %rax        # 將 %rax 清空並設置為 0，表示成功退出
  ret                         # 返回
