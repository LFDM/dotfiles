### Startup issues

Add the following to `/etc/rc.local`, right before the `exit 0` line

```
echo N >  /sys/module/video/parameters/brightness_switch_enabled
echo disable > /proc/acpi/ibm/bluetooth
```

* Fixes the bug of the brightness buttons
* Disables bluetooth on startup

### Clickpad

```
sudo apt-get install dconf-editor
dconf-editor
```

Navigate to org.gnome.settings-daemon.plugins.mouse and uncheck the
Active box - gnome would otherwise override our customized synaptics
configuration.

Run `rake synaptics` - this will copy the synaptics configuration file
to `/etc/X11/xorg.conf.d` (and create the folder if need be).


### Startup script

Add a startup application with the following:
`gnome-terminal --maximize-screen -e "zsh -ilc ttmux"`

----------------

### Unsolved Issues

* Don't start with maximum brightness. No working solution found
  so far.
* Sound is ineffective after a suspend.
