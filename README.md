# NimbleClint's Dotfiles
## i3-Gaps and Polybar
My i3 config uses i3-Gaps, Polybar, Dunst, Rofi, and Picom. Colors are controlled using WPGTK. Because I'm making liberal use of WPGTK's templates, some of the config files have warning to avoid editing them directly and to edit the WPGTK template instead. If you aren't using WPGTK, you can safely ignore those warnings.

Power and Launcher menus are Rofi Applets (link below). Included polybar modules are KDE-Connect and Dunst.

### Screenshots
![NimbleClint's i3 Desktop](i3/i3screenshots/adventureTime_i3Polybar_desktop.png)
![NimbleClint's i3 Terminals](i3/i3screenshots/adventureTime_i3Polybar_terminals.png)
![NimbleClint's i3 Menus](i3/i3screenshots/adventureTime_i3Polybar_blender.png)

### Apps Used

Desktop Environment |
---- |
i3-Gaps |
Polybar |
Dunst |
Rofi |
[Ibhagwom's Picom](https://github.com/ibhagwan/picom) |
WPGTK |
Feh |

Command Line Interface |
---- |
Fish |
Kitty |

Polybar |
---- |
[Polybar-KDEconnect](https://github.com/haideralipunjabi/polybar-kdeconnect) (modified and included) |
[Dunst-Polybar](https://github.com/JeanEdouardKevin/dunst-polybar) (Included) |
[Popup-Calendar](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/popup-calendar) (Included) |

Rofi Menus |
---- |
[Rofi Applets](https://github.com/adi1090x/rofi) (Some included) |

### Installation Notes
I use WPGTK templates to manage many of my config files. I have put warnings on many of these files to warn against editing files directly, and instead use WPGTK. If you are not using WPGTK, you can ignore these warnings. If you are using WPGTK, set up templates for the following files:

- .config/i3/config.base
- .config/rofi/applets/styles/wpgtk.rasi
- .config/rofi/launchers/colorful/colors.rasi
- .config/polybar/scripts/polybar-kdeconnect.sh
- .config/polybar/scripts/vpn-module.sh
- .config/dunst/dunstrc

The following files have versions for i3wm and qTile. To set up the i3 configuration, remove the ".i3wm" from the following files (backup the old config file first):

- .config/rofi/applets/menu/powermenu.sh.i3wm
- .config/dunst/dunstrc.i3wm


### Wallpaper
Cudos to artist: [Pixel art by AbyssWolf](https://www.deviantart.com/abysswolf/art/Finn-and-Jake-382050723)  
I don't know who made the wallpaper [but you can find it here.](https://cdn.wallpapersafari.com/88/29/AJvlRT.jpg)

## Qtile
Currently my Qtile config works pretty similarly to i3; it uses the same rofi menus but uses the qtile bar instead of polybar. It also uses WPGTK for color management.

### Screenshots
![NimbleClint's qtile Desktop](qtile/qtileScreenshots/fluidSim_desktop.png)
![NimbleClint's qtile Terminals](qtile/qtileScreenshots/fluidSim_terminals.png)
![NimbleClint's qtile Menus](qtile/qtileScreenshots/fluidSim_menus.png)

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

Rofi Menus |
---- |
[Rofi Applets](https://github.com/adi1090x/rofi) (Some included) |
[DT's Rasi files](https://gitlab.com/dwt1/dotfiles/-/tree/master/.config/rofi/themes) (Included/modified) |

### Installation Notes
I use WPGTK templates to manage many of my config files. I have put warnings on many of these files to warn against editing files directly, and instead use WPGTK. If you are not using WPGTK, you can ignore these warnings. If you are using WPGTK, set up templates for the following files:

- .config/rofi/rofi-center.rasi
- .config/rofi/rofi-dmenu.rasi
- .config/rofi/applets/styles/wpgtk.rasi
- .config/dunst/dunstrc

The following files have versions for i3wm and qTile. To set up the qTile configuration, remove the ".qtile" from the following files (backup the old config file first):

- .config/rofi/applets/menu/powermenu.sh.qtile
- .config/dunst/dunstrc.qtile
