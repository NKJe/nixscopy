{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "nixscopy";
      overlay = ./overlay.nix;
      systems = flake-utils.lib.defaultSystems;
    };
}
