def remove_e_conta(list, x):
    newList = []
    count = 0
    for i in list:
        if i != x:
            newList.append(i)
        else:
            count += 1
    return(newList, count)

print(remove_e_conta([1, 2, 2, 4, 5, 2, 7, 8, 9, 10], 2))
