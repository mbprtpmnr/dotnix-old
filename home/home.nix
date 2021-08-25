{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/gtk.nix
  ];

  programs.home-manager.enable = true;

  home.username = "mbprtpmnr";
  home.homeDirectory = "/home/mbprtpmnr";

  home.stateVersion = "21.11";

  xdg.enable = true;

  manual = {
    html.enable = false;
    manpages.enable = false;
    json.enable = false;
  };
}
