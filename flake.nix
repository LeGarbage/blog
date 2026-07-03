{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flakelight.url = "github:nix-community/flakelight";
  };
  outputs =
    { flakelight, ... }@inputs:
    flakelight ./. {
      inherit inputs;
      packages = {
        default =
          {
            pkgs,
            lib,
            stdenv,
            ...
          }:
          stdenv.mkDerivation {
            pname = "blog";
            version = "0.1.0";

            src = lib.cleanSource ./.;

            nativeBuildInputs = with pkgs; [ zola ];

            buildPhase = ''
              zola build
            '';

            installPhase = ''
              mkdir -p $out
              cp -r public/* $out
            '';
          };
      };

      devShell = pkgs: {
        inputsFrom = with pkgs; [
          blog
        ];
        packages = with pkgs; [
          vscode-css-languageserver
          rumdl
        ];
      };

      checks = {
        lint = pkgs: "${pkgs.rumdl}/bin/rumdl check";
      };

      formatters = pkgs: {
        "/README.md" = "${pkgs.rumdl}/bin/rumdl fmt";
        "content/**/*.md" = "${pkgs.rumdl}/bin/rumdl fmt";
      };

      flakelight.builtinFormatters = false;
    };
}
