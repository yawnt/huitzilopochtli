{
  fileSystems."/" =
    { device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-partlabel/efi";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];

  boot.initrd.luks.devices.root = 
    {
      device = "/dev/disk/by-partlabel/luks";
      preLVM = true;
      allowDiscards = true;
    };

  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  networking.hostName = "tlaloc"; 

}
