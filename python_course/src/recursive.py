#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@author 憨豆酒 YinDou https://modestbean.github.io/
@date 20191013
@description 分别使用循环、递归来计算1!+2!+3!+4!+...+n!的值
"""


def loop(n):
    result = n
    for i in range(1, n):
        result *= i
    return result


def factorial(n):
    if n == 1:
        return 1
    else:
        return n * factorial(n - 1)


if __name__ == "__main__":
    num = 3

    sum = 0
    for i in range(1, num + 1):
        sum += loop(i)
    print('loop: sum is ' + str(sum))

    sum = 0
    for i in range(1, num + 1):
        sum += factorial(i)
    print('factorial: sum is ' + str(sum))
