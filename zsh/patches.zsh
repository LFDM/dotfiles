# lib/spectrum.zsh
#
# Overrides functions from spectrum.zsh plugin to display
# a longer and thus visually more clear text

ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-"Arma virumque cano Troiae qui primus ab oris"}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}$ZSH_SPECTRUM_TEXT%f"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$BG[$code]$code: $ZSH_SPECTRUM_TEXT %{$reset_color%}"
  done
}
