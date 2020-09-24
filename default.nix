{ pkgs ? import <nixpkgs> {}, ... }:

let
  inherit (pkgs) callPackage;
in
{
  sddm-sugar-candy = callPackage ./pkgs/sddm-sugar-candy { };
}
