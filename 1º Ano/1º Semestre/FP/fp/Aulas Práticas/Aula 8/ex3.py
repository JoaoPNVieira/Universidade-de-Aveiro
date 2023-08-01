def remove_e_conta (list, x):
    list2 = []
    count = 0
    for i in list:
        if i == x:
            count += 1
        else:
            list2.append(i)
    return (list2, count)

print(remove_e_conta([1,6,2,5,5,2,5,2], 2))
