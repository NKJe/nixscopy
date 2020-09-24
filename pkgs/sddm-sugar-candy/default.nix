{ pkgs ? import <nixpkgs> {}, themeConfig ? "" }:

let
  inherit (pkgs) stdenv writeText;
  themeConfigDrv = writeText "theme.conf.user" themeConfig;
in stdenv.mkDerivation rec {
  pname = "sddm-sugar-candy";
  version = "1.6";

  src = pkgs.fetchgit {
    url = "https://framagit.org/MarianArlt/${pname}.git";
    rev = "2b72ef6c6f720fe0ffde5ea5c7c48152e02f6c4f";
    sha256 = "1db4p2d0k5a6avr7dg9h1r7y9mx711ci5dgwmljqjb8pq5b0a22y";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/${pname}
    cp -R * $out/share/sddm/themes/${pname}
    ln -sf ${themeConfigDrv} $out/share/sddm/themes/${pname}/theme.conf.user
  '';
}

