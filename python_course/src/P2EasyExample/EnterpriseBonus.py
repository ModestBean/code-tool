#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@author 憨豆酒 YinDou yindou97@163.com https://modestbean.github.io/
@date 20191021
@description 企业发放的奖金根据利润提成 阶梯求和
            企业实行阶梯制销售绩效方案。现规定：
            销售额低于或等于10万时，提成10%；
            销售额低于或等于20万时，超过10万的部分提成7.5%，其他从上；
            销售额低于或等于40万时，超过20万的部分提成5%，其他从上；
            销售额低于或等于60万时，超过40万的部分提成3%，其他从上；
            销售额低于或等于100万时，超过60万的部分提成1.5%，其他从上；
            销售额高于100万元时，超过100万的部分提成1%，其他从上。
            要求输入某人的销售额，得出应发绩效。
"""


def cal_bonus():
    bonus1 = 100000 * 0.1
    bonus2 = bonus1 + 100000 * 0.075
    bonus4 = bonus2 + 200000 * 0.5
    bonus6 = bonus4 + 200000 * 0.3
    bonus10 = bonus6 + 400000 * 0.15
    i = int(input('input gain:\n'))
    if i <= 100000:
        bonus = i * 0.1
    elif i <= 200000:
        bonus = bonus1 + (i - 100000) * 0.075
    elif i <= 400000:
        bonus = bonus2 + (i - 200000) * 0.05
    elif i <= 600000:
        bonus = bonus4 + (i - 400000) * 0.03
    elif i <= 1000000:
        bonus = bonus6 + (i - 600000) * 0.015
    else:
        bonus = bonus10 + (i - 1000000) * 0.01
    return bonus


if __name__ == "__main__":
    print(cal_bonus())
