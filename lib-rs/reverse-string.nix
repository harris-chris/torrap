{ bash, coreutils, gcc11Stdenv }:

let pkgs = import <nixpkgs> {};

in gcc11Stdenv.mkDerivation {
  name = "reverse-string";
  version = "0.1.0";
  src = ./reverse-string.cpp;
  dontUnpack = true;
  inherit gcc11Stdenv coreutils;
  buildPhase = ''
    g++ -shared -c -o reverse-string.so $src
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp reverse-string.so $out/lib
  '';
  system = builtins.system;
  buildInputs = with pkgs; [
    valgrind
    bintools-unwrapped
  ];
}

