__author__ = 'Clifford'
def is_prime(num):

    if num is 2:
        return True
    elif num > 2:
        if num % 2 != 0 or num % 3 != 0:
            return True
    return False
def get_prime(number):
    counter = 1
    for num in range(number):
        if is_prime(num):
            counter+=1
            yield num
for i in get_prime(100):
    print(i)
