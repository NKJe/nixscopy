{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    sddm-sugar-candy-src = {
      url = "https://framagit.org/MarianArlt/sddm-sugar-candy/-/archive/2b72ef6c6f720fe0ffde5ea5c7c48152e02f6c4f/sddm-sugar-candy-2b72ef6c6f720fe0ffde5ea5c7c48152e02f6c4f.tar.gz";
      flake = false;
    };
  };
  
  outputs = { self, nixpkgs, flake-utils, sddm-sugar-candy-src }:
    let
      name = "sddm-sugar-candy";
      systems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];
      flake = flake-utils.lib.simpleFlake {
        inherit self nixpkgs name systems;
        overlay = final: prev: {
          ${name}.${name} = prev.callPackage ./. { inherit sddm-sugar-candy-src; };
        };
      };
    in flake // flake-utils.lib.eachSystem systems (system: {
      defaultPackage = flake.packages.${system}.${name};
    });
}
