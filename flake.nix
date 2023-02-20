{
  description = "Configuration and build from my qmk keyboards";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in with pkgs; {
        devShells.default = mkShell {
          QMK_HOME = "./qmk_firmware";
          nativeBuildInputs = [ qmk ];
        };

        apps = let
          flash = kb:
            pkgs.writeShellApplication {
              name = "flash";
              runtimeInputs = with pkgs; [ qmk ];
              text = ''
                export QMK_HOME=./qmk_firmware
                qmk flash -c ./${kb}.json
              '';
            };
        in {
          sol3 = {
            type = "app";
            program = "${flash "sol3"}/bin/flash";
          };
        };

      });
}
