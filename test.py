def int_with_commas(x):
    if x < 0:
        return '-' + int_with_commas(-x)

    # blah
    result = []
    while x > 0:
        if len(result) % 4 == 3:
            result.append(',')
        result.append(str(x % 10))
        x //= 10
    return ''.join(reversed(result))

print(int_with_commas(555555))
