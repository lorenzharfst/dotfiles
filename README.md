### Description
Contains configurations for
* i3 picom
* kitty
* nvim
### Instructions (assumes you're using OpenSUSE)
1. `sudo zypper in i3-gaps picom stow feh kitty unclutter`
2. Stow the items from the dotfiles folder (`stow --target=/home/kodex .`)
4. Mask KWin at user level (`systemctl --user mask plasma-kwin_x11`)
5. Start the service (`systemctl --user start i3`)
6. Install any Nerd Font
7. Install nvim (not from zypper, it's outdated)
8. Restart PC
