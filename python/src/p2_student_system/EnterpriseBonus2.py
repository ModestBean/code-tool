#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@author 憨豆酒 YinDou yindou97@163.com https://modestbean.github.io/
@date 20191021
@description 上一个企业提成问题的优化版本
"""


def cal_bonus():
    i = int(input('input gain:\n'))
    arr = [1000000, 600000, 400000, 200000, 100000, 0]
    rat = [0.01, 0.015, 0.03, 0.05, 0.075, 0.1]
    r = 0
    for idx in range(0, 6):
        if i > arr[idx]:
            r += (i - arr[idx]) * rat[idx]
            i = arr[idx]
    return r


if __name__ == "__main__":
    print(cal_bonus())
