My neovim settings


Tmux conf example:
# Unbind the default prefix key
unbind C-b

# Set the new prefix key to Ctrl-a
set-option -g prefix C-a

# Make sure Ctrl-a behaves like a prefix key
bind-key C-a send-prefix

# Enable vi mode for copy mode
setw -g mode-keys vi

# Bind 'v' to begin selection in copy mode
bind -T copy-mode-vi v send-keys -X begin-selection

# Bind 'y' to copy selection in copy mode
bind -T copy-mode-vi y send-keys -X copy-selection-and-cancel

# Optional: Enable mouse support (useful for selecting text)
set -g mouse on

# Bind Ctrl-a h to move to the pane on the left
bind-key h select-pane -L

# Bind Ctrl-a l to move to the pane on the right
bind-key l select-pane -R
set -g status-bg black
set -g status-fg white
