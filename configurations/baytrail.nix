{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
 
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = "experimental-features = nix-command flakes";

  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.useDHCP = false;
  networking.interfaces.enp0s20u2u3.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "Europe/London";

  environment.systemPackages = with pkgs; [
    wget vim git emacs
  ];

  services.openssh.enable = true;

  users.users.yawnt = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
  };

  system.stateVersion = "20.03";

}

