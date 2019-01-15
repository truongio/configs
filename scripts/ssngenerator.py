import random

def lastCheckSum(ssn):
  sum = 0
  for i in range(2, 11):
    a = int(ssn[i])
    b = a + a if i % 2 == 0 else a
    c = b - 10 + 1 if b > 9 else b
    sum = sum + c
  
  ch = str(10 - (sum % 10))
  return "0" if ch == "10" else ch

year = random.randint(1950, 1998)
month = "{0:02d}".format(random.randint(1, 12))
day = "{0:02d}".format(random.randint(1, 25))
last = str(random.randint(0, 9)) + str(random.randint(0, 9)) + str(random.randint(0, 9))

ssn = str(year) + month + day + last

print(ssn + lastCheckSum(ssn), end='')