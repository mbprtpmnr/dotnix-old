{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  name = "nixosbuildshell";
  nativeBuildInputs = with pkgs; [
    dosfstools
    gparted
    mtools
    nixUnstable
    tree
  ];

  shellHook = ''
      PATH=${pkgs.writeShellScriptBin "nix" ''
        ${pkgs.nixFlakes}/bin/nix --option experimental-features "nix-command flakes" "$@"
      ''}/bin:$PATH
    '';
  }
