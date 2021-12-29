{ stdenvNoCC, bash, coreutils, gcc }:

let pkgs = import <nixpkgs> {};

in stdenvNoCC.mkDerivation {
  name = "torrap-library-1";
  version = "0.1.0";
  src = "./torrap-library-1.cpp";
  dontUnpack = true;
  buildPhase = ''
    g++ -shared -c -o torrap-library-1.so $src
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp torrap-library-1 $out/lib
  '';
  inherit gcc coreutils;
  system = builtins.system;
  buildInputs = with pkgs; [
    valgrind
    bintools-unwrapped
  ];
}

