{ pkgs ? import <nixpkgs> {}, ... }:

let
  inherit (pkgs) callPackage;
in
{
  sddm-sugar-candy = callPackage ./pkgs/sddm-sugar-candy { };
  my-very-cool-background = callPackage ./pkgs/my-very-cool-background {};
}
