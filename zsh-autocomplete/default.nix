{ stdenv, zsh-autocomplete-src }:

let
  pname = "zsh-autocomplete";
  src = zsh-autocomplete-src;
in
stdenv.mkDerivation {
  inherit src pname;

  version = src.version or src.rev or src.narHash;

  installPhase = ''
    mkdir -p $out/share/zsh/plugins/zsh-autocomplete
    cp -R * $out/share/zsh/plugins/zsh-autocomplete
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/marlonrichert/zsh-autocomplete";
    description = "Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion.";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
