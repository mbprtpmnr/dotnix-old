{ config, pkgs, lib, ... }:

{
  services.xserver = {
    videoDrivers = [ "intel" ];
    enable = true;
  };

  services.xserver.desktopManager.xfce.enable = true;

  services.xserver.displayManager.lightdm = {
    enable = true;
    background = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/mbprtpmnr/dotfiles/main/wallpaper.jpg";
      sha256 = "0k7lpj7rlb08bwq3wy9sbbq44rml55jyp9iy4ipwzy4bch0mc6y4";
    };
  };

  services.xserver.displayManager.lightdm.greeters.gtk = {
    theme.name = "Sweet-Dark";
    iconTheme.name = "Kora";
    cursorTheme.name = "Capitaine Cursors";
    clock-format = "%H:%M";
    indicators = [
      "~clock" "~spacer" "~host" "~spacer" "~power"
    ];
    extraConfig = ''
      font-name = Unifont 12
    '';
  };
}
