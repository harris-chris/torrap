let
  torrapPkgs = import <torrap>;
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  buildInputs = with torrapPkgs; [
    pkgs.which
    torrap
  ];
}
