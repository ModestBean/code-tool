#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@author 憨豆酒 YinDou yindou97@163.com https://modestbean.github.io/
@date 20191021
@description 学生成绩管理系统
"""

import constant

student = []
stu = {}

constant.ADD_STUDENT = "1"
constant.FIND_STUDENT = "2"
constant.MODIFY_STUDENT = "3"
constant.DELETE_STUDENT = "4"
constant.EXIT = "5"


def add_student():
    stu["name"] = input("name:")
    stu["gender"] = input("gender：")
    stu["age"] = input("age：")
    student.append(stu.copy())
    print("success!")


def find_student():
    print("【1】find all student\n【2】find one student")
    x = input("Please enter the action you want：")
    if x == "1":
        for i in range(len(student)):
            print(i + 1, " ", student[i])
    elif x == "2":
        name = input("Please enter the name of the student you are looking for：")
        for items in student:
            flag = True
            if items["name"] == name:
                print("%s success！information：%s" % (name, items))
                break
            else:
                flag = False
            if not flag:
                print("%s information is not exist! " % name)


def modify_student():
    for i in range(len(student)):
        print(i + 1, " ", student[i])
    name = input("Please enter the name of the student to be modified：")
    x = 0
    for item in student:
        if item["name"] == name:
            student[x]["gender"] = input("Please edit the gender of the student：")
            student[x]["age"] = input("Please edit the age of the student：")
            print("success！Modified information is：%s" % student[x])
            break
        x += 1
        if x == len(student):
            print("The student to be modified does not exist, please add!")


def delete_student():
    for i in range(len(student)):
        print(i + 1, " ", student[i])
    name = input("Please enter the name of the student you want to delete：")
    x = 0
    for item in student:
        if item["name"] == name:
            del student[x]
            print("delete success！")
            break
        x += 1
        if x == len(student):
            print("Failed to delete! The student information does not exist.")


def main():
    while True:
        print("=" * 30)
        print("Student Management System")
        print("【1】Add Student\n【2】find Student\n【3】Modify Student\n【4】Delete Student\n【5】Exit")
        print("=" * 30)
        n = input("Please enter the action you want：")

        if n == constant.ADD_STUDENT:
            add_student()
        elif n == constant.FIND_STUDENT:
            find_student()
        elif n == constant.MODIFY_STUDENT:
            modify_student()
        elif n == constant.DELETE_STUDENT:
            delete_student()
        elif n == constant.EXIT:
            break
        else:
            print("Incorrect input, please re-enter!")


if __name__ == "__main__":
    main()
