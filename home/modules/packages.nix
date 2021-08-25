{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bleachbit
    keepassxc
  ];
}
