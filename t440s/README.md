### Startup issues

Add the following to `/etc/rc.local`, right before the `exit 0` line

```
echo N >  /sys/module/video/parameters/brightness_switch_enabled
echo disable > /proc/acpi/ibm/blueetooth
```

### Clickpad

```
sudo apt-get install dconf-editor
dconf-editor
```

Navigate to org.gnome.settings-daemon.plugins.mouse and uncheck the
Active box.

Run `rake synaptics`

### Startup script

Add a startup application with the following:
`gnome-terminal --maximize-screen -e "zsh -ilc ttmux"`
