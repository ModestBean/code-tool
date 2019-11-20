# coding:utf-8
"""
@author 憨豆酒 YinDou yindou97@163.com https://modestbean.github.io/
@description 根据图像url，爬取图像
@version 1 author：YinDou 20191117 根据网页url 爬取图像到路径文件夹（中文路径解析错误）
@version 2 author：YinDou 20191119 解决中文路径解析失败问题
"""
import os

import requests
import scipy.io
import urllib.request
from urllib.parse import quote

success_list = []  # 成功列表
failure_list = []  # 失败列表


def mkoutdir(path):
    """
    功能：创建文件夹目录，先判断文件夹是否存在，不存在则创建
    :param path:文件夹目录
    :return:
    """
    try:
        os.makedirs(path)
    except OSError:
        pass


def save_image_from_url(image_url):
    """
    功能：创建文件夹目录，先判断文件夹是否存在，不存在则创建
    :param image_url：url图像路径
    """
    filename = os.path.basename(image_url)
    output_dir = './mge-data/'
    mkoutdir(output_dir)
    try:
        urllib.request.urlretrieve('https://www.mgedata.cn' + quote(image_url), os.path.join(output_dir, filename))
    except:
        failure_list.append(image_url)
        print(image_url + '发生异常！')
    else:
        success_list.append(image_url)
        print(image_url + '成功下载！')


if __name__ == "__main__":
    r = requests.get('https://www.mgedata.cn/api/v1/storage/file/data/content/images')
    image_mge = r.json()['data']
    print(image_mge)

    for i in range(len(image_mge)):
        save_image_from_url(image_mge[i])
        print('当前进度为:%f' % (i * 100 / len(image_mge)))

    # 保存成功和失败列表
    scipy.io.savemat('success_list.mat', {'data': success_list})
    scipy.io.savemat('failure_list.mat', {'data': failure_list})

    # 打印最终信息
    print('\n 完成！！总共数量：%d，成功数量:%d，失败数量：%d，成功占比:%f' % (
        len(image_mge), len(success_list), len(failure_list), len(success_list) * 100.0 / len(image_mge)))
