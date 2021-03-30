{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    zsh-autocomplete-src = {
      url = "github:marlonrichert/zsh-autocomplete";
      flake = false;
    };
  };
  
  outputs = { self, nixpkgs, flake-utils, zsh-autocomplete-src }:
    let
      name = "zsh-autocomplete";
      systems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];
      flake = flake-utils.lib.simpleFlake {
        inherit self nixpkgs name systems;
        overlay = final: prev: {
          ${name}.${name} = prev.callPackage ./. { inherit zsh-autocomplete-src; };
        };
      };
    in flake // flake-utils.lib.eachSystem systems (system: {
      defaultPackage = flake.legacyPackages.${system}.${name};
    }) // { packages = flake.legacyPackages; };
}
