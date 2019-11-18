# coding:utf-8
"""
@author 憨豆酒 YinDou yindou97@163.com https://modestbean.github.io/
@date 20191117
@description 根据返回data url 获得图像
"""
import os
import requests
import urllib.request


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


r = requests.get('https://www.mgedata.cn/api/v1/storage/file/data/content/images')
image_mge = r.json()
print(image_mge['data'])
for image_path in image_mge['data']:
    print(image_path)
    filename = os.path.basename(image_path)
    output_dir = os.path.dirname(image_path)
    folder = os.getcwd() + output_dir
    mkoutdir(folder)
    try:
        urllib.request.urlretrieve('https://www.mgedata.cn' + image_path,
                                   os.path.join(folder, filename))
    except :
        print(os.path.join(folder, filename) + '发生异常！')
    else:
        print(os.path.join(folder, filename) + '成功下载！')
