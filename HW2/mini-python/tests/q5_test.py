# 構建範圍列表，測試 list(range(n))
range_list = list(range(2))  # [0, 1]
for num in range_list:
    print(num)  # 預期輸出：0 1

# 初始化費波納契數列
fib = list(range(2))  # [0, 1]
range_list = list(range(10))  # [2, 3, 4, 5, 6, 7, 8, 9, 10]
# 計算費波納契數列的第10項
for i in range_list:
    next_fib = fib[0] + fib[1]
    fib[0] = fib[1]
    fib[1] = next_fib

# 此時 fib[1] 應該是第10項
print(fib[1])  # 預期輸出：89

fib = [0, 1]  # 初始化為 [0, 1]
range_list = list(range(42))  # [2, 3, 4, 5, 6, 7, 8, 9, 10]
for i in range_list:  # 需要計算 44 次
    next_fib = fib[0] + fib[1]
    fib[0] = fib[1]
    fib[1] = next_fib

print(fib[0])  # 預期輸出：267914296
