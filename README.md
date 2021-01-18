# NimbleClint's Dotfiles
![NimbleClint's qtile Desktop](screenshots/qtileScreenshots/fluidSim_desktop.png)
![NimbleClint's qtile Terminals](screenshots/qtileScreenshots/fluidSim_terminals.png)
![NimbleClint's qtile Menus](screenshots/qtileScreenshots/fluidSim_menus.png)


### Installation Notes
These dotfiles are set up to use GNU stow for installation. To install, first **MAKE SURE YOUR EXISTING CONFIG FILES ARE BACKED UP.** Once you have done that, make sure GNU Stow is installed on your system, then:
- Clone this repo somewhere on your drive
- cd into the cloned repo
- Enter the command (leave out folders you don't want):

~~~~
stow dunst picom qtile rofi
~~~~

### Colors and WPGTK
Colors are controlled by WPGTK, which uses pywal. When running, Qtile wants to find the following file:

~~~~
~/.cache/wal/colors.json
~~~~

If you don't have this, you can generate it by running either pywal or WPGTK for the first time.  

Many of my config files are controlled using WPGTK templates. I have put warnings on many of these files to warn against editing files directly - they should be modified by editing the WPGTK template. If you are not using WPGTK, you can ignore these warnings. If you are using WPGTK, set up templates for the following files:

~~~~
rofi/rofi-center.rasi
rofi/rofi-dmenu.rasi
rofi/applets/styles/wpgtk.rasi
dunst/dunstrc
~~~~


### Apps Used
Desktop Environment |
---- |
Qtile |
Dunst |
Rofi |
[Ibhagwom's Picom](https://github.com/ibhagwan/picom) |
WPGTK |
Feh |

Command Line Interface |
---- |
Fish |
Kitty |

Rofi Menus (Included)|
---- |
[Rofi Applets - Power Menu](https://github.com/adi1090x/rofi) |
[DT's Rasi files](https://gitlab.com/dwt1/dotfiles/-/tree/master/.config/rofi/themes) |

Fonts |
---- |
DejaVu Sans |
Iosevka Nerd Font |
Terminal Font: Source Code Pro (In screenshots) |
Terminal Font: Fantasque Sans Mono (Currently in config) |

## Other Configurations
If you're an i3 user, you can check out [my i3 configuration here.](https://github.com/NimbleClint/Adventure-Time-i3) However, please not that it is no longer being updated.
