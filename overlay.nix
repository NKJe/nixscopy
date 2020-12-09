final: prev: {
  nixscopy = {
    sddm-sugar-candy = prev.callPackage ./pkgs/sddm-sugar-candy { };
    my-very-cool-background = prev.callPackage ./pkgs/my-very-cool-background { };
    zsh-autocomplete = prev.callPackage ./pkgs/zsh-autocomplete { };
  };
}
