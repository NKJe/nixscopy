{ stdenv, lib, writeText, themeConfig ? null, sddm-sugar-candy-src }:

let
  pname = "sddm-sugar-candy";  
  
  inherit (builtins) isNull;
  inherit (lib) optionalString;

  themeConfigDrv = writeText "theme.conf.user" themeConfig;
  src = sddm-sugar-candy-src;
in stdenv.mkDerivation {
  inherit src pname;
  version = src.version or src.rev or src.narHash;

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/${pname}
    cp -R * $out/share/sddm/themes/${pname}
  '' + optionalString false ''
    ln -sf ${themeConfigDrv} $out/share/sddm/themes/${pname}/theme.conf.user
  '';
}

