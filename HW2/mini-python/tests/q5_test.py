# 構建範圍列表，測試 list(range(n))
range_list = list(range(2))  # [0, 1]
for num in range_list:
    print(num)  # 預期輸出：0 1

# 初始化費波納契數列
fib = [0, 1]

# 計算費波納契數列的第10項
for i in list(range(2, 11)):
    next_fib = fib[0] + fib[1]
    fib[0] = fib[1]
    fib[1] = next_fib

# 此時 fib[1] 應該是第10項
print(fib[1])  # 預期輸出：89

# 計算費波納契數列的第44項
fib = [0, 1]  # 重置費波納契數列
for i in list(range(2, 45)):
    next_fib = fib[0] + fib[1]
    fib[0] = fib[1]
    fib[1] = next_fib

print(fib[1])  # 預期輸出：267914296
