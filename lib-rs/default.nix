{ pkgs ? import <nixpkgs> {} }:

with pkgs; {
  reverse-string = callPackage ./reverse-string.nix {};
}
