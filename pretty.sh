mkdir $HOME/.themes
mkdir $HOME/.icons

unzip Gruvbox-Dark-B.zip
tar -zxvf Gruvbox.tar.gz

mv Gruvbox-Dark-B $HOME/.themes/
mv Gruvbox $HOME/.icons/

xfconf-query -c xsettings -p /Net/ThemeName -s "Gruvbox-Dark-B"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Gruvbox"
xfconf-query -c xfwm4 -p "/general/theme" -s "Gruvbox-Dark-B"

sudo mv gtk.css $HOME/.config/gtk-3.0/gtk.css

sudo mv xfce4-panel.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

xfconf-query -c xfce4-panel -p "/panels/panel-1/background-style" -s "2"
xfconf-query -c xfce4-panel -p "/panels/panel-1/background-image" -s "$HOME/Setup/Wallpapers/wallpaper2.png"

xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitorVirtual1/workspace0/last-image" -s "$HOME/Setup/Wallpapers/wallpaper1.jpg"

xfconf-query -c xfce4-desktop -p /desktop-icons/style -s 0

xfce4-panel -r
sudo reboot

