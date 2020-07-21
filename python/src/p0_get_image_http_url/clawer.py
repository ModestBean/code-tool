"""
@version 1 200602 格式化变量
@version 2 200602 爬取内容和图像
@version 3 200603 解决相同图像爬取问题
"""


import json
import os
import time
import urllib.request as ur

success_list = []
success_img_name = []
success_meta_id = []

error_list = []
error_img_name = []
error_meta_id = []

current_item = 0


def load_img_list(path):
    f = open(path, encoding='utf-8')
    js = json.load(f)
    t_img_list = js["data"]
    return t_img_list


def new_path(path):
    try:
        os.makedirs(path)
    except:
        pass


def get_image(input_img_list):
    for img in input_img_list:

        global current_item
        current_item += 1

        print("current schedule is {:.7f}".format(current_item / len(input_img_list)) * 100)

        meta_id = str(img["meta"])
        orig_img_name = img["url"].split("/")[-1]
        # 访问图片时需要将image.json中的media/去掉
        img_url = "https://www.mgedata.cn/media/mgedata/{}".format(img["url"].split("media/")[-1])
        data_url = "https://www.mgedata.cn/api/v1/storage/data/meta/{}".format(meta_id)
        print("current at {} {}".format(img_url, data_url))
        try:
            if orig_img_name not in success_img_name:
                # 保存图片文件名为meta+原文件名
                ur.urlretrieve(img_url, os.path.join("./image", meta_id + "___" + orig_img_name))

            if meta_id not in success_meta_id:
                # 保存图片描述信息到meta.json
                ur.urlretrieve(data_url, os.path.join("./data", meta_id + "___" + orig_img_name + ".json"))
        except Exception as e:
            error_img_name.append(orig_img_name)
            error_meta_id.append(meta_id)
            error_list.append(img)
            print("error at {}".format(img))
        else:
            success_img_name.append(orig_img_name)
            success_meta_id.append(meta_id)
            success_list.append(img)
            print("success at {}".format(img))

        time.sleep(2)


def save_log(input_dict, path):
    try:
        with open(path, 'w', encoding='utf-8') as fs:
            json.dump(input_dict, fs)
    except IOError as e:
        print(e)
    print('保存数据完成!')


if __name__ == "__main__":
    img_list = load_img_list("image.json")
    new_path("./image")
    new_path("./data")
    get_image(img_list)

    dict_success = {
        "code": 0,
        "data": success_list
    }
    # 这样包装后结构也image.json保持一致，如果需要从新爬取失败的图片可以直接使用loadImgList("error.json")获取图片列表
    dict_error = {
        "code": 0,
        "data": error_list
    }
    save_log(dict_success, "success.json")
    save_log(dict_error, "error.json")

    pass
