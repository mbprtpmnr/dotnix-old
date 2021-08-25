{
  description = "mbprtpmnr NixOS system";

  inputs = {
    stable.url = "github:NixOS/nixpkgs?ref=nixos-21.05";
    unstable.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus/staging";
  };

  outputs = { self, stable, unstable, home-manager, utils, ... }@inputs:
  utils.lib.mkFlake {
    inherit self inputs;

    channels.nixpkgs = {
      input = unstable;
      config = {
        allowUnfree = true;
      };
    };

    channels.nixpkgs-stable = {
      input = stable;
      config = {
        allowUnfree = true;
      };
    };

    channels.nixpkgs.overlayBuilder = channels: [
      (final: prev: { inherit (channels) nixpkgs-stable; })
    ];

    hosts = {
      nixos = {
        modules = [
          ./system/configuration.nix
        ];
      };
    };

    homeConfigurations = let
      username = "mbprtpmnr";
      homeDirectory = "/home/mbprtpmnr";
      system = "x86_64-linux";
      extraSpecialArgs = { inherit inputs self; };
      generateHome = inputs.home-manager.lib.homeManagerConfiguration;
      nixpkgs = {
        config = { allowUnfree = true; };
      };
    in {
      "master@nixos" = generateHome {
        inherit system username homeDirectory extraSpecialArgs;
        pkgs = self.pkgs.x86_64-linux.nixpkgs;
        configurations = {
          imports = [ ./home/home.nix ];
          inherit nixpkgs;
        };
      };
    };

    nixos = inputs.self.nixosConfigurations.nixos.config.system.build.toplevel;

  };
}
