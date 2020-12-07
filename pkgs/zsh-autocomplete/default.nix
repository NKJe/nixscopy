{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "zsh-autocomplete";
  version = "0.0.1";
  src = fetchFromGitHub {
    owner = "marlonrichert";
    repo = "zsh-autocomplete";
    rev = "18nzynbwnnmcq2p1ai00n8sxbbvb99q17gd57cmdczcmivk38b8w";
    sha256 = "1n9whlys95k4wc57cnz3n07p7zpkv796qkmn68a50ygkx6h3afqf";
  };

  installPhase = ''
    mkdir -p $out/share/zsh/plugins/zsh-autocomplete
    cp * $out/share/zsh/plugins/zsh-autocomplete
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/marlonrichert/zsh-autocomplete";
    description = "Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion.";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
