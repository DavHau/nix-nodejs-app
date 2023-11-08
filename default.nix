{ lib
, config
, dream2nix
, ...
}:
let
  system = config.deps.stdenv.system;
in
{
  imports = [
    dream2nix.modules.dream2nix.nodejs-package-json
    dream2nix.modules.dream2nix.nodejs-package-lock
    dream2nix.modules.dream2nix.nodejs-granular
  ];

  name = "app";
  version = "1.0.0";

  nodejs-package-lock = {
    source = lib.cleanSource ./.;
  };

  nodejs-granular = {
    buildScript = ''
    '';
  };

  mkDerivation = {
    src = config.nodejs-package-lock.source;
  };

  deps = { nixpkgs, ... }: {
    inherit
      (nixpkgs)
      gnugrep
      stdenv
      ;
  };
}
