{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };
  outputs ={self,nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux" "i686-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"
  ] (system: 
    let 
      pkgs = import nixpkgs { inherit system;};
    in {
      devShell = pkgs.mkShell rec {
        name = "c++ project";
	      packages = with pkgs; [
	        llvmPackages_latest.clang
	        cmake
          boost
	      ];
      };
      zork = (pkgs.callPackage ./default.nix {});
    }
  );
}
