{ config, pkgs, ... }:

{
  nix = {
    useSandbox = true;
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    binaryCaches = [
      "https://cache.nixos.org"
      "https://cachix.cachix.org"
      "https://nix-community.cachix.org"
    ];
    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    trustedUsers = [ "root" "mbprtpmnr" ];
  };
}
