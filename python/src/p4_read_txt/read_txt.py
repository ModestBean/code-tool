# -*- coding: UTF-8 -*-
"""
@author 憨豆酒 YinDou yindou97@163.com https://github.com/douysu
@date 20200720
@description 读取txt内容
29396 14.6957 40175 0 融化结束
"""
import numpy as np
import matplotlib.pyplot as plt


def main():
    fluid_num = []
    candidate_num = []
    frame_index = []
    video_fps = 25
    for line in open("./data.txt"):
        every_line = line.split()
        fluid_num.append(float(every_line[2]))
        candidate_num.append(float(every_line[3]))
        frame_index.append(float(every_line[1]) * video_fps)

    plt.rcParams['font.sans-serif'] = ['SimHei']  # 用来正常显示中文标签
    plt.rcParams['axes.unicode_minus'] = False  # 用来正常显示负号
    x = np.array(frame_index)
    y1 = np.array(fluid_num)
    y2 = np.array(candidate_num)
    plt.plot(x, y1, color='red', label='流体粒子数')
    plt.plot(x, y2, color='blue', label='固体粒子数+临界状态粒子数')
    plt.legend()
    plt.show()


if __name__ == "__main__":
    main()
