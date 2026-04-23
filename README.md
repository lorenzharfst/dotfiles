### Description
Contains configurations for
* i3 picom
* kitty
* nvim
### Instructions (assumes you're using OpenSUSE)
1. `sudo zypper in i3-gaps picom stow feh kitty unclutter`
2. Stow the items from the dotfiles folder (`stow --target=/home/kodex .`)
4. Mask KWin (the previous window manager) at user level (`systemctl --user mask plasma-kwin_x11`)
5. Start the service (`systemctl --user enable i3`)
6. Install any Nerd Font
7. Install nvim (not from zypper, it's outdated)
8. Restart PC
### Troubleshooting
If i3 doesn't get your config files properly, try running it raw and looking at the error file.
- If it tells you that you have to choose the backend manually, you will have to edit `picom.conf` and add `backend = "glx"` for example.
