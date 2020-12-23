{ lib, ... }:
{
  boot.loader.efi.canTouchEfiVariables = true;
  
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
