{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, flake-utils, ... }:
    let
      flake = flake-utils.lib.simpleFlake {
        inherit self nixpkgs;
        name = "nixscopy";
        overlay = ./overlay.nix;
        systems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];
      };
    in
    flake // {
      hydraJobs = {
        x86_64-linux = flake.packages.x86_64-linux;
      };
    };
}
