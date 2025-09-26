### Description
Contains configurations for
* i3 picom
* kitty
* nvim
### Instructions (assumes you're using OpenSUSE)
1. `sudo zypper in i3-gaps picom stow neovim feh kitty`
2. Stow the items from the dotfiles folder (`stow --target=/home/kodex .`)
3. Create a user-level service (`~/.config/systemd/user/i3.service`)
```
[Install]
WantedBy=plasma-workspace.target

[Unit]
Description=Tiling Window Manager
Before=plasma-workspace.target

[Service]
ExecStart=/usr/bin/i3
Slice=session.slice
Restart=on-failure
```
4. Mask KWin at user level (`systemctl --user mask plasma-kwin_x11`)
5. Start the service (`systemctl --user start i3`)
6. Install any Nerd Font
7. Restart PC
