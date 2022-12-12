sudo pacman -S cups ghostscript unzip wget foomatic-db-engine psutils
sudo sed -i 's|SystemGroup sys root wheel|SystemGroup sys root wheel sakura|' /etc/cups/cups-files.conf
git clone https://aur.archlinux.org/foo2zjs-nightly.git
cd foo2zjs-nightly
makepkg
sudo pacman -U *.zst
cd ..
rm -r visual-studio-code-bin
# 每次开机后用的时候都要start一次服务，因为用的频率太低了，就不enable为自启动服务了
sudo systemctl start cups.service