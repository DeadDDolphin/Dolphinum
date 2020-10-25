from __future__ import print_function
myList=[]
print("Введите последовательность, оканчивающуюся точкой:")
a=input()

while a!=".":
    myList.append(int(a))
    a=input()
print(myList)
myDict = dict()
for i in range(10):
    if myList.count(i)!=0:
        myDict[i]=myList.count(i)
print(myDict)
from operator import itemgetter
myDict=dict(sorted(myDict.items(),key=itemgetter(1)))
print("Итоговая последовательность:")
for key in myDict.keys():
    print(key, end=" ")
print()
