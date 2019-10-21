# coding:utf-8
"""
@author 憨豆酒 YinDou yindou97@163.com https://modestbean.github.io/
@date 20191021
@description 常量类，Python没有const修饰符，不像Java，需要自定义常量类。
参考链接：https://www.cnblogs.com/ydcode/p/10996791.html
"""

import sys


class _const:
    class ConstError(TypeError):
        pass

    class ConstCaseError(ConstError):
        pass

    def __setattr__(self, name, value):
        if name in self.__dict__:
            raise self.ConstError("can't change const %s" % name)
        if not name.isupper():
            raise self.ConstCaseError('const name "%s" is not all uppercase' % name)
        self.__dict__[name] = value


sys.modules[__name__] = _const()

