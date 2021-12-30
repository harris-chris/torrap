{ reverse ? true }:

let
  pkgs = import <nixpkgs> {};
  localPkgs = rec {
    reverse-string = pkgs.callPackage ./lib-rs/reverse-string.nix {};
    capitalize-string = pkgs.callPackage ./lib-cs/capitalize-string.nix {};
    torrap = if reverse then
      pkgs.callPackage ./bin/torrap.nix { stringManip = reverse-string; }
    else
      pkgs.callPackage ./bin/torrap.nix { stringManip = capitalize-string; };
  };
in pkgs.mkShell {
  buildInputs = with localPkgs; [
    pkgs.which
    torrap
  ];
}
