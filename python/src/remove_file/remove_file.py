# coding:utf-8
"""
@author 憨豆酒 YinDou yindou97@163.com https://modestbean.github.io/
@description 根据图像url，爬取图像
@version 1 author：YinDou 20191231 将不同文件夹内容整合到同一文件夹下
@version 2
"""

import os
root_path='./datasets/cityscapes/'
in_path=root_path+'gtFine/val/'
out_label_path=root_path+'test_label/'
out_inst_path=root_path+'test_inst/'
os.makedirs(out_label_path)
os.makedirs(out_inst_path)
for r,p,f in os.walk(in_path):
    for name in f:
        if 'instanceIds' in name:
            shutil.copy(os.path.join(r,name),out_inst_path+name)
        elif 'labelIds' in name:
            shutil.copy(os.path.join(r,name),out_label_path+name)
