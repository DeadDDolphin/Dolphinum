def progr(b):
    a=list()
    for every in b:
        a.append(int(every))
    d=a[1]-a[0]
    for i in range(len(a)-1):
        if a[i+1]-a[i]!=d:
            return False
    return True


f1 = open('D:\\Ind 3(1).txt')
f2 = open('D:\\Ind 3(2).txt', 'w')
for line in f1:
    if progr(line.split()):
        f2.write(line + '\n')
f1.close()
f2.close()