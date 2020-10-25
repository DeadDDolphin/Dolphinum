import nltk
import string
translate_table = dict((ord(char), None) for char in string.punctuation)

def get_key(d, value):
    l=list()
    for k, v in d.items():
        if value in v:
            l.append(k)
    return l

print("Введите количество английский слов: ")
n=int(input())
AnglLath={}
print("А теперь словарь: ")


for count in range(n):
    s=input()
    i=s.find("-")
    s1=s[0:i-1]
    words = nltk.word_tokenize(s[i:len(s)].translate(translate_table))
    AnglLath[s1]=words

allLathyn=list()
for keys in AnglLath:
    for cur in AnglLath[keys]:
        if cur not in allLathyn:
            allLathyn.append(cur)

LathAngl={}
for cur in sorted(allLathyn):
    LathAngl[cur]=get_key(AnglLath,cur)
    
print("Количество латинских слов: ", len(allLathyn))
for k,v in LathAngl.items():
    print(k," - ",v)


