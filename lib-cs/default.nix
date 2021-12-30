{ pkgs ? import <nixpkgs> {} }:

with pkgs; {
  capitalize-string = callPackage ./capitalize-string.nix {};
}
