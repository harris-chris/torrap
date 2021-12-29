{ pkgs ? import <nixpkgs> {} }:

with pkgs; {
  torrap-library-1 = callPackage ./torrap-library-1.nix {};
}
