notification(:tmux, {
  display_message: false,
  display_title: false,
  default_message_color: 'black',
  # don't change the color when we are fine.
  success: 'colour232',
  # and do nothing when we there are only pending examples
  pending: 'colour232',
  failure: 'colour160',
  color_location: %w[window-status-current-bg pane-active-border-fg],
}) if ENV['TMUX']
