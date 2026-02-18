{
  flake-utils,
  nixpkgs,
  ...
}: {
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      # replace ./derivation.nix with the path (relative to this file) to your derivation
      eveauth = pkgs.python3Packages.callPackage ./shell.nix {
        inherit (pkgs) lib;
      };
    in {
      packages.default = pkgs.python3.withPackages (_: [eveauth]);
    });
}
