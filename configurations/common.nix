{ pkgs, ... }:
{

  nix.package = pkgs.nixFlakes;
  nix.extraOptions = "experimental-features = nix-command flakes";
  
  nixpkgs.config.allowUnfree = true;
  
  time.timeZone = "Europe/London";
  location.provider = "geoclue2";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  networking.useDHCP = false;

  programs.fish.enable = true;
}
