m_path=~/miniconda3
./Miniconda3*x86_64.sh -bp $m_path

$m_path/bin/conda init bash
cat ~/.bashrc >> ~/.bash_inside
sudo sed -i "s|source ~/.bash_inside||" ~/.bash_inside
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

# 如果要安装cv2，conda install opencv(而不是opencv-python)

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