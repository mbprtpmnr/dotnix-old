{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/virtualisation.nix
      ./modules/fonts.nix
      ./modules/xserver.nix
      ./modules/sound.nix
      ./modules/nix.nix
      ./modules/gtk.nix
      ./modules/qt.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Bucharest";

  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # services.xserver.enable = true;

  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # services.printing.enable = true;

  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # services.xserver.libinput.enable = true;

  users.users.mbprtpmnr = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    hashedPassword = "$6$hwn5EcFG$Vwhy2ODZmH4TyQsMyMVM.h/0aNl56MEiUyjk8p6npuZt4Vc7VuqeJngrJBS9Yeifw2p.l.5krSA1Swl7wRPPT1";
    uid = 1000;
    description = "mbprtpmnr";
    group = "mbprtpmnr";
  };

  users.groups.mbprtpmnr = {
    name = "mbprtpmnr";
    gid = 1000;
  };

  programs.nm-applet.enable = true;

  environment.systemPackages = with pkgs; [
    capitaine-cursors
    curl
    firefox
    htop
    kora-icon-theme
    sweet
    tmux
    vim
    wget
  ];

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  system.stateVersion = "21.11";
}
