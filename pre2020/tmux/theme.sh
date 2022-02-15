#### COLOUR

tm_icon="🍄"

tm_color_active=colour106
tm_colour_bg=colour232
tm_colour_fg=colour189

tm_colour_inactive=colour106
tm_colour_active=colour255

tm_colour_feature=colour64

tm_colour_pane_active=colour67
tm_colour_pane_inactive=colour248

tm_colour_music=colour106

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
set-option -g status-fg $tm_colour_fg
set-option -g status-bg $tm_colour_bg
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg $tm_colour_inactive
# set-window-option -g window-status-bg default
set-window-option -g window-status-format "#W"

# active window title colors
set-window-option -g window-status-current-fg $tm_colour_bg
# set-window-option -g window-status-current-bg $tm_colour_active
set-window-option -g  window-status-current-format "#[bold]#W"

# pane border
set-option -g pane-border-fg $tm_colour_pane_inactive
set-option -g pane-active-border-fg $tm_colour_pane_active

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_colour_inactive

# clock
set-window-option -g clock-mode-colour $tm_colour_pane_active

# tm_spotify="#[fg=$tm_colour_music]#(osascript ~/applescripts/spotify.scpt)"
# tm_itunes="#[fg=$tm_colour_music]#(osascript ~/applescripts/itunes.scpt)"
# tm_chrome="#[fg=$tm_colour_music]#(osascript ~/applescripts/playlister.scpt)"

tm_date="#[fg=$tm_colour_feature] %R %d %b"
tm_host="#[fg=$tm_colour_feature,bold]#h"
tm_session_name="#[fg=$tm_colour_feature,bold]$tm_icon #S"

set -g status-left $tm_session_name' '
set -g status-right $tm_date' '$tm_host
# set -g status-right $tm_chrome' '$tm_itunes' '$tm_spotify' '$tm_date' '$tm_host
