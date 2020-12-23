{

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  inputs.home-manager.url = "github:nix-community/home-manager";

  outputs = { self, nixpkgs, nixos-hardware, home-manager }: {

    nixosConfigurations.baytrail = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        ./hardware/baytrail.nix
        ./configurations/baytrail.nix
      ];
    };

    nixosConfigurations.x270 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        nixos-hardware.nixosModules.lenovo-thinkpad-x270
        nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
        nixos-hardware.nixosModules.common-pc-laptop-ssd
        nixos-hardware.nixosModules.common-pc-laptop-acpi_call
        home-manager.nixosModules.home-manager
        ./hardware/x270.nix
        ./configurations/x270.nix
      ];
    };
    
  };
  
  
}
