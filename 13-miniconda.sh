m_path=~/miniconda3
./Miniconda3*x86_64.sh -bp $m_path

$m_path/bin/conda init bash
cat ~/.bashrc >> ~/.bash_inside
sed -i "s|source ~/.bash_inside||" ~/.bash_inside
$m_path/bin/conda init --reverse bash

# 来源：http://mirrors.pku.edu.cn/Help/Anaconda
echo 'channels:
    - defaults
show_channel_urls: true
default_channels:
    - https://mirrors.pku.edu.cn/anaconda/pkgs/main
    - https://mirrors.pku.edu.cn/anaconda/pkgs/r
custom_channels:
    conda-forge: https://mirrors.pku.edu.cn/anaconda/cloud
    pytorch: https://mirrors.pku.edu.cn/anaconda/cloud' > ~/.condarc
conda clean -i


## 删除环境
# conda remove -n 环境名 --all
## conda批量导出包含环境中所有组件的requirements.txt文件
# conda list -e > requirements.txt
## conda批量安装requirements.txt文件中包含的组件依赖
# conda install --yes --file requirements.txt

## pip换源
## 来源：https://mirrors.pku.edu.cn/Help/Pypi
pip install pip -U -i https://mirrors.pku.edu.cn/pypi/simple # 首先将pip版本升级至10.0.0+
pip config set global.index-url https://mirrors.pku.edu.cn/pypi/simple

## matplotlib中文化
# from matplotlib.font_manager import FontProperties
# import os
# import matplotlib.pyplot as plt
# import numpy as np
# # 单项设置
# def get_font(index=0):
#     with os.popen('fc-list :lang=zh') as f:
#         fonts = f.readlines()
#         font_path = fonts[index].split(":")[0]
#         return FontProperties(fname=font_path
# def test():
#     x = np.linspace(-1, 1, 100)
#     y = np.sin(x)
#     plt.plot(x, y)
#     font = get_font()
#     plt.xlabel("自变量", font=font)
#     plt.ylabel("因变量$(^\circ)$", font=font)
#     plt.show()
# # 全局设置
# def get_font_name(index=0):
#     with os.popen('fc-list :lang=zh') as f:
#         fonts = f.readlines()
#         font_name = fonts[index].split(": ")[1].split(",")[0]
#         return font_name
# def temp():
#     x = np.linspace(-1, 1, 100)
#     y = np.sin(x)
#     plt.plot(x, y)
#     print(get_font_name())
#     plt.rcParams['font.sans-serif'] = get_font_name()
#     plt.rcParams['axes.unicode_minus'] = False
#     plt.xlabel("自变量")
#     plt.ylabel("因变量$(^\circ)$")
#     plt.show()
# # test()
# temp()
## 其他操作系统
# import platform
# plt_font = 'SimHei'  # windows上显示中文标签
# if platform.system() == 'Darwin':
#     plt_font = ['Heiti TC']  # 用来在macos上正常显示中文标签
# plt.rcParams['font.sans-serif'] = plt_font
# plt.rcParams['axes.unicode_minus'] = False  # 正常显示负号


## 如果要安装cv2，conda install opencv(而不是opencv-python)


## jupyter notebook的配置

# jupyter notebook --generate-config
## /root/.jupyter/jupyter_notebook_config.py is the configure file
# jupyter notebook password
## set the password
# sudo nano /root/.jupyter/jupyter_notebook_config.py
## change these settings
#     c.NotebookApp.ip = '*' 
#     c.NotebookApp.open_browser = False
#     c.NotebookApp.port = 8888  
#     c.NotebookApp.notebook_dir = '/home/sakura/jupyter/'

# pip install jupyter_contrib_nbextensions
# jupyter contrib nbextension install --user --skip-running-check

## jupy is the name of this screen
# screen -S jupy
## run the jupyter notebook
## then ctrl+a+d