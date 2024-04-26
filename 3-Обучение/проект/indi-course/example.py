# Пузырьковая сортировка
n, count = int(input()), 0
lst = list(map(int, input().split()))
for i in range(n - 1, 0, -1):
    for j in range(i):
        if lst[j + 1] < lst[j]:
            lst[j], lst[j + 1] = lst[j + 1], lst[j]
            count += 1
print(*lst)
print(count)
