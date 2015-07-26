def strltointl(strlist):
    return [int(x) for x in strlist]

def check(matrix, size):
    for i in range(size):
        for j in range(size):
            if ((matrix[i][j]!=matrix[j][i]) or ((i==j) and (matrix[i][j]==1))):
                return 0
    return 1

def checkP(matrix, size):
    for i in range(size):
        for j in range(size):
            if ((i==j) and matrix[i][j]==1):
                return 1
    return 0

n = int(input())
matrix = []
for i in range(n):
    str = input()
    matrix.append(strltointl(str.split(' ')))
if checkP(matrix, n)==1:
    print("YES")
else:
    print("NO")
