{ stdenv, writeText, themeConfig ? "" }:

let
  pname = "sddm-sugar-candy";  

  themeConfigDrv = writeText "theme.conf.user" themeConfig;
  src = (import ./nix/sources.nix).${pname};
in stdenv.mkDerivation {
  inherit src pname;
  version = src.version or src.rev;

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/${pname}
    cp -R * $out/share/sddm/themes/${pname}
    ln -sf ${themeConfigDrv} $out/share/sddm/themes/${pname}/theme.conf.user
  '';
}

