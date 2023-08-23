{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ 
    (pkgs.callPackage ./default.nix {})
    pkgs.llvmPackages_latest.clang
 ];
}
