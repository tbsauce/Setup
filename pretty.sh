mkdir $HOME/.themes
mkdir $HOME/.icons

unzip Gruvbox-Dark-B.zip
tar -zxvf Gruvbox.tar.gz

mv Gruvbox-Dark-B $HOME/.themes/
mv Gruvbox $HOME/.icons/

xfconf-query -c xsettings -p /Net/ThemeName -s "Gruvbox-Dark-B"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Gruvbox"
xfconf-query -c xfwm4 -p "/general/theme" -s "Gruvbox-Dark-B"

rm $HOME/.config/gtk-3.0/gtk.css
touch $HOME/.config/gtk-3.0/gtk.css
# Append the desired lines to the CSS file
cat <<EOT >> "$HOME/.config/gtk-3.0/gtk.css"
.xfce4-panel {
	border-bottom-left-radius: 13px;
	border-bottom-right-radius: 13px;
	border-top-left-radius: 13px;
	border-top-right-radius: 13px;
}
EOT

rm $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
touch $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
cat <<EOT>> "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-panel" version="1.0">
  <property name="configver" type="int" value="2"/>
  <property name="panels" type="array">
    <value type="int" value="1"/>
    <property name="dark-mode" type="bool" value="true"/>
    <property name="panel-1" type="empty">
      <property name="position" type="string" value="p=0;x=969;y=898"/>
      <property name="length" type="uint" value="60"/>
      <property name="position-locked" type="bool" value="true"/>
      <property name="icon-size" type="uint" value="0"/>
      <property name="size" type="uint" value="35"/>
      <property name="plugin-ids" type="array">
        <value type="int" value="10"/>
        <value type="int" value="1"/>
        <value type="int" value="9"/>
        <value type="int" value="2"/>
        <value type="int" value="3"/>
        <value type="int" value="4"/>
        <value type="int" value="5"/>
        <value type="int" value="6"/>
        <value type="int" value="8"/>
        <value type="int" value="11"/>
        <value type="int" value="12"/>
        <value type="int" value="13"/>
        <value type="int" value="14"/>
        <value type="int" value="16"/>
      </property>
      <property name="disable-struts" type="bool" value="false"/>
      <property name="nrows" type="uint" value="1"/>
      <property name="enter-opacity" type="uint" value="100"/>
      <property name="leave-opacity" type="uint" value="100"/>
      <property name="background-style" type="uint" value="2"/>
      <property name="background-image" type="string" value="/home/vboxuser/Downloads/great-wave-of-kanagawa-gruvbox.png"/>
    </property>
  </property>
  <property name="plugins" type="empty">
    <property name="plugin-1" type="string" value="applicationsmenu">
      <property name="button-title" type="string" value=""/>
    </property>
    <property name="plugin-2" type="string" value="tasklist">
      <property name="grouping" type="uint" value="0"/>
      <property name="show-labels" type="bool" value="false"/>
      <property name="show-handle" type="bool" value="false"/>
      <property name="sort-order" type="uint" value="2"/>
      <property name="flat-buttons" type="bool" value="true"/>
      <property name="include-all-workspaces" type="bool" value="true"/>
      <property name="include-all-monitors" type="bool" value="false"/>
    </property>
    <property name="plugin-3" type="string" value="separator">
      <property name="expand" type="bool" value="true"/>
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-4" type="string" value="pager"/>
    <property name="plugin-5" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-6" type="string" value="systray">
      <property name="square-icons" type="bool" value="true"/>
      <property name="known-legacy-items" type="array">
        <value type="string" value="ibus panel"/>
      </property>
      <property name="known-items" type="array">
        <value type="string" value="software-update-available"/>
        <value type="string" value="nm-applet"/>
      </property>
    </property>
    <property name="plugin-8" type="string" value="pulseaudio">
      <property name="enable-keyboard-shortcuts" type="bool" value="true"/>
      <property name="show-notifications" type="bool" value="true"/>
    </property>
    <property name="plugin-11" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-12" type="string" value="clock"/>
    <property name="plugin-13" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-14" type="string" value="actions"/>
    <property name="plugin-9" type="string" value="separator"/>
    <property name="plugin-16" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
      <property name="expand" type="bool" value="false"/>
    </property>
    <property name="plugin-10" type="string" value="separator">
      <property name="expand" type="bool" value="false"/>
      <property name="style" type="uint" value="0"/>
    </property>
  </property>
</channel>
EOT
xfce4-panel -r
