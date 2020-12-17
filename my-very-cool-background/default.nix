{ stdenv }:

stdenv.mkDerivation rec {
  pname = "my-very-cool-background";
  version = "1.0";
  src = ./.;

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/${pname}
    cp -R backgrounds $out/share/${pname}
  '';
}

