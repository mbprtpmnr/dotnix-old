{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      fira-code
      fantasque-sans-mono
      unifont
    ];

    enableDefaultFonts = false;

    fontconfig.defaultFonts = {
      serif = [ "Unifont" ];
      sansSerif = [ "Unifont" ];
      monospace = [ "Unifont" ];
    };
  };
}
