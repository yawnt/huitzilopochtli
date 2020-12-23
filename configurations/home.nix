{ pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.yawnt = {
    #programs.firefox = {
    #  enable = true;
    #  package = pkgs.firefox-wayland;
    #  
    #};

    programs.chromium.enable = true;
    
    programs.git = {
      enable = true;
      userName  = "yawnt";
      userEmail = "me@yawnt.com";
    };

    programs.emacs.enable = true;

    programs.zsh = {
      enable = true;
      initExtraFirst = ''
        if [ -z "$SSH_AUTH_SOCK" -a -n "$XDG_RUNTIME_DIR" ]; then
          export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/yubikey-agent/yubikey-agent.sock"
        fi
      '';
    };
    programs.zsh.prezto = {
      enable = true;
      editor.dotExpansion = true;
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "prompt"
        "syntax-highlighting"
        "history-substring-search"
      ];
      syntaxHighlighting.highlighters = [ 
        "main"
        "brackets"
        "pattern"
        "line"
        "cursor"
        "root"
      ];
    };

    programs.alacritty = {
      enable = true;
      settings = {
        colors.primary.background = "0x2d2d2d";
        colors.primary.foreground = "0xd3d0c8";
        
        colors.cursor.text = "0x2d2d2d";
        colors.cursor.cursor = "0xd3d0c8";

        colors.normal = {
          black = "0x2d2d2d";
          red = "0xf2777a";
          green = "0x99cc99";
          yellow = "0xffcc66";
          blue = "0x6699cc";
          magenta = "0xcc99cc";
          cyan = "0x66cccc";
          white = "0xd3d0c8";
        };

        colors.bright = {
          black = "0x747369";
          red = "0xf99157";
          green = "0x393939";
          yellow = "0x515151";
          blue = "0xa09f93";
          magenta = "0xe8e6df";
          cyan = "0xd27b53";
          white = "0xf2f0ec";
        };

        draw_bold_text_with_bright_colors = false;

        font = {
          normal.family = "JetBrains Mono";
          normal.style = "Regular";
          
          bold.family = "JetBrains Mono";
          bold.style = "Bold";

          italic.family = "JetBrains Mono";
          italic.style = "Italic";
        };
        
      };
    };

    programs.home-manager.enable = true;
  };
}
