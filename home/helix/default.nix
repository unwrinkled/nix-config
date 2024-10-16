{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [ wl-clipboard ];

    ignores = [
      "build/"
      "!.helix"
      "!.clang-format"
    ];

    settings = {
      editor = {
        true-color = true;
        undercurl = true;
        cursorline = true;
        bufferline = "multiple";
        rulers = [
          80
          150
        ];
        color-modes = true;
        text-width = 150;
        default-line-ending = "lf";
        insert-final-newline = true;
        preview-completion-insert = false;

        cursor-shape.insert = "bar";
        indent-guides.render = true;
        file-picker.hidden = false;

        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };
      };
      keys = {
        insert = {
          j.j = "normal_mode";
        };
      
        normal = {
          C-S = ":buffer-close";
        };
      };
    };
    languages = {
      language-server.rust-analyzer.config = {
        check.command = "clippy";
      };
    };
  };
}
