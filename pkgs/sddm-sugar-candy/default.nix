{ pkgs ? import <nixpkgs> {}, ... }:

let
  pname = "sddm-sugar-candy";
  pversion = "1.6";
  inherit (pkgs) stdenv;
in
stdenv.mkDerivation {
  name = pname;
  version = pversion;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -Ra $src $out/share/sddm/themes/${pname}
  '';
  src = fetchGit {
    url = "https://framagit.org/MarianArlt/${pname}.git";
    rev = "2b72ef6c6f720fe0ffde5ea5c7c48152e02f6c4f";
  };
}
