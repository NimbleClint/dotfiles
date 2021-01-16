# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
import re
import socket
from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy


# Load script to read colors from pywal
import pywal_colors
color = pywal_colors.colors

home = os.path.expanduser("~")

mod = "mod4"
terminal = "kitty"

def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        i = i - 1        
    else:
        i = len(qtile.screens) - 1    
    group = qtile.screens[i].group.name
    qtile.current_window.togroup(group)
    qtile.focus_screen(i)

def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        i = i + 1
    else:
        i = 0
    group = qtile.screens[i].group.name
    qtile.current_window.togroup(group)
    qtile.focus_screen(i)

keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", 
        lazy.layout.shuffle_down(),
        lazy.layout.rotate()),
    Key([mod, "control"], "j", 
        lazy.layout.shuffle_up(),
        lazy.layout.rotate()),

    # Resize Windows
    Key([mod, "control"], "i", lazy.layout.shrink()),
    Key([mod, "control"], "o", lazy.layout.grow()),

    # Move focus to different monitor
    Key([mod], "period", lazy.prev_screen()),
    Key([mod], "comma", lazy.next_screen()),

    # Move windows to different screens
    Key([mod, "control"], "period", lazy.function(window_to_previous_screen)),
    Key([mod, "control"], "comma", lazy.function(window_to_next_screen)),

    # Switch window focus to other pane(s) of stack
    Key([mod], "n", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),

    # Restart Qtile
    Key([mod, "shift"], "r", lazy.restart()),

    # Shutdown Qtile
    # Key([mod, "control"], "q", lazy.shutdown()),

    # Power Menu
    Key([mod, "shift"], "q", lazy.spawn([home + '/.config/rofi/applets/menu/powermenu.sh'])),

    # Volume Keys
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    
    # Media Keys
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioPause", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),

    # Print Screen
    Key([], "Print", lazy.spawn("gnome-screenshot -i")),
    Key([mod,], "Print", lazy.spawn("gnome-screenshot -a")),

    # Kill Window
    Key([mod,], "q", lazy.window.kill()),

    # Launch Terminal
    Key([mod], "Return", lazy.spawn(terminal)),

    # Launch File Manager
    Key([mod], "e", lazy.spawn("pcmanfm")),

    # Launch Internet Browser
    Key([mod], 'b', lazy.spawn("firefox")),

    # Launch Rofi App Launcher
    # Key([mod], "space", lazy.spawn([home + '/.config/rofi/launchers/colorful/launcher.sh'])),
    Key([mod], "space", lazy.spawn([home + '/.config/qtile/scripts/rofi-dmenu.sh'])),
    Key([mod, "control"], "space", lazy.spawn([home + '/.config/qtile/scripts/rofi-center.sh'])),
]


# Define Groups
group_names=[
        (" I ", {}), 
        (" II ", {}),
        (" III ", { }),
        (" IV ", { }),
        (" V ", { }),
        (" VI ", { }),
        (" VII ", { }),
        (" VIII ", {}),
        (" IX ", {}),
    ]

#groups = [Group(i) for i in "123456789"]
groups = [Group(name, **kwargs) for name, kwargs in group_names]

#for i in groups:
#    keys.extend([
#        # mod1 + letter of group = switch to group
#        Key([mod], i.name, lazy.group[i.name].toscreen(), lazy.to_screen() ),
#
#        # mod1 + shift + letter of group = switch to & move focused window to group
#        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
#            desc="Switch to & move focused window to group {}".format(i.name)),
#    ])

for i, (name, kwargs) in enumerate(group_names, 1):
        keys.append(Key([mod], str(i), lazy.group[name].toscreen())),
        keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))),


layout_theme = { 
        "border_width": 1,
        "border_focus": color[1],
        "border_normal": color[0],
        }

layouts = [
    layout.MonadTall(
        **layout_theme,
        # margin = 5,
        name = "Tall",
        ),
    layout.MonadWide(
        **layout_theme, 
        # margin = 5,
        name = "Wide"),
    layout.Max(
        **layout_theme,
        name = "Max",
        ),
    layout.Stack(
        **layout_theme,
        num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(
    #     name = "BSP",
    #     ),
    # layout.Columns(
    #     name = "Columns",
    #     ),
    # layout.Matrix(
    #     name = "Matrix",
    #     ),
    #     layout.RatioTile(),
    # layout.Tile(
    #     name = "Tile",
    #     ),
    # layout.TreeTab(
    #     name = "Tree",
    #     ),
    # layout.VerticalTile(
    #     name = "VTile",
    #     ),
    # layout.Zoomy(
    #     name = "Zoomy",
    #     ),
]

widget_defaults = dict(
    font='DejaVu Sans',
    fontsize=14,
    background = color[0],
    opacity = 1,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
               widget.Sep(
                   linewidth = 0,
                   padding = 5,
                   ),
               widget.GroupBox(
                   rounded = False,
                   linewidth = 0,
                   active = color[15],
                   inactive = color[8],
                   highlight_method = 'line',
                   highlight_color = color[1],
                   this_current_screen_border = color[1],
                   this_screen_border = color[1],
                   other_current_screen_border = color[8],
                   other_screen_border = color[8],
                   urgent_border = color[6],
                   
                   ),
               widget.Sep(
                   linewidth = 0,
                   padding = 10,
                   ),
               widget.WindowName(),
               widget.Spacer(),
               widget.Volume(
                    background = color[1],
                    foreground = color[0],
                    padding = 10,
                   ),
               widget.Clock(
                   format='%Y-%m-%d %a %I:%M %p',
                   background = color[3],
                   padding = 10,
                   foreground = color[0],
                   ),
               widget.CurrentLayout(
                   background = color[1],
                   padding = 10,
                   foreground = color[0],
                   ),
              #  widget.GenPollText(
	      #      update_interval=1,
	      #      func=lambda: subprocess.check_output(os.path.expanduser("~/.config/qtile/scripts/qtile-kdeconnect/qtile-kdeconnect.sh")).decode("utf-8").strip(),
              #      mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(os.path.expanduser("~/.config/qtile/scripts/qtile-kdeconnect/qtile-kdeconnect-menu.sh -m"))},
              #      foreground = color[0],
              #      background = color[2],
              #      font = "DejaVu Sans Mono Nerd Font",
              #      fontsize = 30,
              #      padding = 10,
              #      markup = True,
              #      ),

            ],
            32,
        ),
    ),
    Screen(
        bottom=bar.Bar(
            [
               widget.Sep(
                   linewidth = 0,
                   padding = 5,
                   ),
               widget.GroupBox(
                   rounded = False,
                   linewidth = 0,
                   active = color[15],
                   inactive = color[8],
                   highlight_method = 'line',
                   highlight_color = color[1],
                   this_current_screen_border = color[1],
                   this_screen_border = color[1],
                   other_current_screen_border = color[8],
                   other_screen_border = color[8],
                   urgent_border = color[6],
                   ),
               widget.Sep(
                   linewidth = 0,
                   padding = 5,
                   ),
               widget.WindowName(),
               widget.Spacer(),
               widget.Clock(
                   format='%I:%M %p',
                   background = color[3],
                   padding = 10,
                   foreground = color[0],
                   ),
               widget.CurrentLayout(
                   background = color[1],
                   padding = 10,
                   foreground = color[0],
                   ),

            ],
            32,
        ),
    ),
    Screen(
        bottom=bar.Bar(
            [
               widget.Sep(
                   linewidth = 0,
                   padding = 5,
                   ),
               widget.GroupBox(
                   rounded = False,
                   linewidth = 0,
                   active = color[15],
                   inactive = color[8],
                   highlight_method = 'line',
                   highlight_color = color[1],
                   this_current_screen_border = color[1],
                   this_screen_border = color[1],
                   other_current_screen_border = color[8],
                   other_screen_border = color[8],
                   urgent_border = color[6],
                   ),
               widget.Sep(
                   linewidth = 0,
                   padding = 5,
                   ),
               widget.WindowName(),
               widget.Spacer(),
               widget.Clock(
                   format='%I:%M %p',
                   background = color[3],
                   padding = 10,
                   foreground = color[0],
                   ),
               widget.CurrentLayout(
                   background = color[1],
                   padding = 10,
                   foreground = color[0],
                   ),

            ],
            32,
        ),
    ),
]

# Drag floating layouts.
mouse = [
        Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wmclass': 'Gnome-screenshot'},
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# Autostart
@hook.subscribe.startup
def autostart():
#    subprocess.call([home + '/.config/qtile/scripts/autostart.sh']),
    subprocess.call([home + '/.config/qtile/scripts/setWallpaper.sh']),

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
