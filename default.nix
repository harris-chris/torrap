let
  pkgs = import <nixpkgs> {};

  hello = pkgs.writeShellScriptBin "hello" ''
    echo "Test for torrap channel"
  '';

  channelPackages = rec {
    inherit hello;
    reverse-string = pkgs.callPackage ./lib-rs/reverse-string.nix {};
    torrap = pkgs.callPackage ./bin/torrap.nix { stringManip = reverse-string };
  };
in channelPackages
