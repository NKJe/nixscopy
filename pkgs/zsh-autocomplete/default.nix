{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  name = "zsh-autocomplete";

  src = fetchFromGitHub {
    owner = "marlonrichert";
    repo = "zsh-autocomplete";
    rev = "f75d296ec218573cb4c14abeebfd952686135b75";
    sha256 = "18nzynbwnnmcq2p1ai00n8sxbbvb99q17gd57cmdczcmivk38b8w";
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
