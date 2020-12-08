{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  name = "zsh-autocomplete";

  src = fetchFromGitHub {
    owner = "marlonrichert";
    repo = "zsh-autocomplete";
    rev = "13deb34fc9ff8922be6629d337bf435f17c5039d";
    sha256 = "06y3rsqavl31w1lwvm91s59ad7iln9cqd1lnm9dzm437yxycphjm";
  };

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
