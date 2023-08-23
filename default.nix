{ pkgs ? import <nixpkgs> { } }:
let 
  repo = builtins.fetchGit {
    url = "https://github.com/zerodaycode/Zork.git";
    ref = "refs/tags/v0.8.6";
  };
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = "Zork";
  version = "0.8.6";
  src = "${repo}/zork++";
  cargoSha256 = "sha256-QXhu+EOASAD3XHCS4UuHqGKGTjXcI/gwsbx99W1gTUg=";
}
