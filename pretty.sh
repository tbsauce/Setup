mkdir $HOME/.themes
mkdir $HOME/.icons

unzip Gruvbox-Dark-B.zip
tar -zxvf Gruvbox.tar.gz

#mv Gruvbox-Dark-B $HOME/.themes/
#mv Gruvbox $HOME/.icons/

xfconf-query -c xsettings -p /Net/ThemeName -s "Gruvbox-Dark-B"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Gruvbox"
xfconf-query -c xfwm4 -p "/general/theme" -s "Gruvbox-Dark-B"

rm $HOME/.config/gtk-3.0/gtk.css
touch $HOME/.config/gtk-3.0/gtk.css
# Append the desired lines to the CSS file
cat <<EOT >> "$HOME/.config/gtk-3.0/gtk.css"
xfce4-panel {
	border-bottom-left-radius: 13px;
	border-bottom-right-radius: 13px;
	border-top-left-radius: 13px;
	border-top-right-radius: 13;
}
EOT
xfce4-panel -r
