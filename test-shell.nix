let
  pkgs = import <nixpkgs> {};
  localPkgs = rec {
    reverse-string = pkgs.callPackage ./lib-rs/reverse-string.nix {};
    torrap = pkgs.callPackage ./bin/torrap.nix { stringManip = reverse-string; };
  };
in pkgs.mkShell {
  buildInputs = with localPkgs; [
    pkgs.which
    torrap
  ];
}
