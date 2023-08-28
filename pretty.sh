mkdir $HOME/.themes
mkdir $HOME/.icons

unzip Gruvbox-Dark-B.zip
tar -zxvf Gruvbox.tar.gz

mv Gruvbox-Dark-B $HOME/.themes/
mv Gruvbox $HOME/.icons/

xfconf-query -c xsettings -p /Net/ThemeName -s "Gruvbox-Dark-B"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Gruvbox"
xfconf-query -c xfwm4 -p "/general/theme" -s "Gruvbox-Dark-B"


