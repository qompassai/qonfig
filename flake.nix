# /qompassai/qonfig/flake.nix
# Qompass AI Qonfig Flake
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
{
  description = "Qompass AI Qonfig: A Quality Config Manager";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        python = pkgs.python313;
        qonfigPkg = python.pkgs.buildPythonApplication {
          pname = "qonfig";
          version = "unstable";
          src = ./.;
          format = "setuptools";
          propagatedBuildInputs = with python.pkgs; [ pyyaml ];
          doCheck = false;
          installPhase = ''
            mkdir -p $out/bin
            cp ${./bin/qonfig} $out/bin/qonfig
            chmod +x $out/bin/qonfig
          '';
        };
      in
      {
        packages.default = qonfigPkg;
        apps.default = flake-utils.lib.mkApp {
          drv = qonfigPkg;
          exePath = "/bin/qonfig";
        };
        devShells.default = pkgs.mkShell {
          buildInputs = [
            python
            (python.withPackages (ps: with ps; [ pyyaml ]))
          ];
        };
      });
}
