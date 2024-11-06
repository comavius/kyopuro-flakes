{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    my-cpp.url = "./cpp";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    my-cpp,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        cpp = my-cpp.package-lambda {inherit pkgs;};
      in {
        packages = {
          inherit cpp;
        };
        formatter = pkgs.alejandra;
      }
    );
}
