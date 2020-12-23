
{ config, pkgs, lib, ... }:
{

  imports = [ 
    ./common.nix 
    ./home.nix
  ];

  nixpkgs.config.packageOverrides = super: let self = super.pkgs; in {
    jetbrains = super.jetbrains // {
      idea-ultimate = super.jetbrains.idea-ultimate.overrideAttrs (_: {
        version = "2020.2.4";
        src = super.fetchurl {
          url = "https://download.jetbrains.com/idea/ideaIU-2020.2.4-no-jbr.tar.gz";
          sha256 = "fe961b10deef1317e05c4b90cbe49cf7b8761f3c4f949de29bb563ada2441917";
        };
      });
    };
  };
  
   # Configure keymap in X11
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.gnome3.gnome-keyring.enable = lib.mkForce false;
  services.xserver.xkbOptions = "eurosign:e";
  services.udev.packages = [ pkgs.yubikey-personalization pkgs.libu2f-host ];
  services.pcscd.enable = true;
  services.printing.enable = true;
  services.tlp.enable = true;
  services.redshift.enable = true;
  services.yubikey-agent.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
 
  users.users.yawnt = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    wget git yubikey-manager yubico-piv-tool firefox-wayland
    jetbrains.idea-ultimate nodejs tmux nodePackages.typescript yarn
  ];

  security.pam.yubico = {
   enable = true;                              
   mode = "challenge-response";          
  };

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    jetbrains-mono
  ];
  
  #programs.ssh.extraConfig = ''
  #  PKCS11Provider ${pkgs.yubico-piv-tool}/lib/libykcs11.so
  #'';


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

