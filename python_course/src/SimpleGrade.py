#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@author 憨豆酒 YinDou https://modestbean.github.io/
@date 20191013
@description 类的使用细节
"""


class SimpleGrade(object):
    """
    把学生的名字都放到字典里，不用把每个学生都表示成对象，也不需要再对象中预设一个存放姓名的属性name
    此种方式是对Student类的改进，不在每个学生创建对象
    """
    def __init__(self):
        self._grades = {}

    def add_student(self, name):
        self._grades[name] = []

    def report_grade(self, name, score):
        self._grades[name].append(score)

    def average_grade(self, name):
        grades = self._grades[name]
        return sum(grades) / len(grades)


if __name__ == "__main__":
    book = SimpleGrade()
    book.add_student('London')
    book.report_grade('London', 90)
    book.report_grade('London', 80)
    print(book.average_grade('London'))
