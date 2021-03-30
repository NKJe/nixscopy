{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      name = "my-very-cool-background";
      systems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];
      flake = flake-utils.lib.simpleFlake {
        inherit self nixpkgs name systems;
        overlay = final: prev: {
          ${name}.${name} = prev.callPackage ./. { };
        };
      };
    in flake // flake-utils.lib.eachSystem systems (system: {
      defaultPackage = flake.legacyPackages.${system}.${name};
    }) // { packages = flake.legacyPackages; };
}
