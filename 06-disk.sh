# 显然，本脚本也是不能直接运行的
sudo pacman -S ntfs-3g 
# 查看UUID
sudo blkid
# 挂载
disk_id="016AD11517FCF203"
disk_dir="/home/sakura/Lys"
echo "UUID=$disk_id $disk_dir ntfs defaults,uid=1000,gid=1000,umask=022 0 0" | sudo tee -a /etc/fstab
# 挂载windows系统盘时可能会提示无法挂载，可以使用以下命令
# sudo ntfs-3g -o remove_hiberfile /dev/source target
