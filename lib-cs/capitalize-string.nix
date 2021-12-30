{ bash, coreutils, gcc11Stdenv }:

let
  pkgs = import <nixpkgs> {};
in gcc11Stdenv.mkDerivation {
  name = "capitalize-string";
  version = "0.1.0";
  src = ./capitalize-string.cpp;
  soname = "stringManip.so";
  dontUnpack = true;
  inherit gcc11Stdenv coreutils;
  buildPhase = ''
    g++ -shared -o $soname $src
  '';
  installPhase = ''
    mkdir -p $out/lib
    cp $soname $out/lib
  '';
  system = builtins.system;
  buildInputs = with pkgs; [
    valgrind
    bintools-unwrapped
  ];
}

