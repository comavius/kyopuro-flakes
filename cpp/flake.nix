{
  inputs = {
    ac-library = {
      url = "github:atcoder/ac-library";
      flake = false;
    };
    boost = {
      url = "github:boostorg/boost";
      flake = false;
    };
    eigen = {
      url = "https://gitlab.com/libeigen/eigen/-/releases/3.4.0";
      flake = false;
    };
  };

  outputs = {
    self,
    ac-library,
    boost,
    eigen,
  }: {
    package-lambda = {pkgs}: let
      clang = pkgs.clang_16;
    in
      pkgs.stdenv.mkDerivation {
        name = "cpp";
        buildInputs = [
          clang
        ];
        shellHook = ''
          export CC=${clang}/bin/clang
          export CXX=${clang}/bin/clang++
        '';
      };
  };

}
