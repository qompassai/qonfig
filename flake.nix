# /qompassai/qonfig/flake.nix
# Qompass AI Qonfig Flake
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
{
  description = "Qompass AI Qonfig: A Quality Config Manager";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        pythonVersions = [
          "python311"
          "python312"
          "python313"
          "python314"
        ];
        getPython = ver: pkgs.${ver};
        buildForPython = ver:
          let
            python = getPython ver;
          in
            python.pkgs.buildPythonApplication {
              pname = "qonfig";
              version = "1.0.0";
              src = ./.;
              format = "pyproject";
              propagatedBuildInputs = with python.pkgs; [ pyyaml meson  ];
            };
        pythonPackages = builtins.listToAttrs (
          builtins.map
            (ver: { name = ver; value = buildForPython ver; })
            pythonVersions
        );
        defaultPython = "python313";
      in
      {
        packages = pythonPackages // { default = pythonPackages.${defaultPython}; };
        devShells.default = pkgs.mkShell {
          buildInputs = [ pythonPackages.${defaultPython} ];
        };
        apps.default = flake-utils.lib.mkApp {
          drv = pythonPackages.${defaultPython};
        };
      }
    );
}
