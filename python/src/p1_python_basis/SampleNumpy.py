#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@author 憨豆酒 YinDou yindou97@163.com https://modestbean.github.io/
@date 20191013
@description numpy矩阵库的基本认识

"""
import numpy as np

'''
Python numpy 数学矩阵计算库的介绍以及基本使用：
NumPy是Python语言的一个扩展程序库。支持高端大量的维度数组与矩阵运算，此外也针对数组运算提供大量的数学函数库。

在计算复杂的数据矩阵计算时，numpy的优势体现的淋漓尽致，其运行速度与C语言相通，将矩阵的乘法减法等运算进行了封装。

参考链接：https://numpy.org/
'''
# read txt value from txt
data = np.loadtxt('../resources/numpy_test_data.txt')
print(data)

a = np.zeros((2, 2))  # Create an array of all zeros
print(a)  # Prints "[[ 0. 0.]

b = np.ones((1, 2))  # Create an array of all ones
print(b)  # Prints "[[ 1. 1.]]"

c = np.full((2, 2), 7)  # Create a constant array
print(c)  # Prints "[[ 7. 7.]

d = np.eye(2)  # Create a 2x2 identity matrix
print(d)  # Prints "[[ 1. 0.]

e = np.random.random((2, 2))  # Create an array filled with random values
print(e)  # Might print "[[ 0.91940167 0.08143941]

x = np.array([[1, 2], [3, 4]], dtype=np.float64)
y = np.array([[5, 6], [7, 8]], dtype=np.float64)

print(x + y)
print(np.add(x, y))

print(x - y)
print(np.subtract(x, y))

print(x * y)
print(np.multiply(x, y))

print(x / y)
print(np.divide(x, y))

print(np.sqrt(x))
