{ bash, coreutils, gcc11Stdenv, stringManip }:

let pkgs = import <nixpkgs> {};

in gcc11Stdenv.mkDerivation {
  name = "torrap";
  version = "0.1.0";
  pkgname = "torrap";
  src = ./torrap.cpp;
  dontUnpack = true;
  inherit gcc11Stdenv coreutils;
  buildPhase = ''
    g++ -o $pkgname $src -ldl
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp $pkgname $out/bin
  '';
  system = builtins.system;
  buildInputs = with pkgs; [
    valgrind
    bintools-unwrapped
  ];
  LD_LIBRARY_PATH = "${stringManip}/lib:$LD_LIBRARY_PATH";
}

