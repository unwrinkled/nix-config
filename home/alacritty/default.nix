# alacritty - a cross-platform, GPU-accelerated terminal emulator
{
  config,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        normal = {
          family = "CaskaydiaCove Nerd Font Mono";
          style = "Regular";
        };
      };
      window = {
        decorations = "None";
        dimensions = {
          columns = 150;
          lines = 45;
        };
      };
      colors.draw_bold_text_with_bright_colors = true;
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
