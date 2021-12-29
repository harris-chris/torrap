{ pkgs ? import <nixpkgs> {} }:

let
  torrap-channel = import <torrap>;
in
{
  torrap-reverse = pkgs.callPackage ./torrap.nix { stringManip = torrap-channel.reverse-string };
}
