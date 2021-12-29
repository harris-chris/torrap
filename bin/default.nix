{ pkgs ? import <nixpkgs> {} }:

let
  torrapPkgs = import <torrap>;
  stringManip = torrapPkgs.reverse-string;
in
{
  torrap-reverse = pkgs.callPackage ./torrap.nix { stringManip = stringManip; };
}
