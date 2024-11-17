{
  description = "neovim dev";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    inputs.utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {

        formatter = pkgs.nixfmt-rfc-style;
        devShells = {
          default = pkgs.mkShell.override { stdenv = pkgs.gcc14Stdenv; } {
            name = "neovim dev";
            #buildInputs 
            packages = with pkgs; [
              lua-language-server
              stylua
              marksman
              nixd
              nixfmt-rfc-style
              nodejs
              tree-sitter

              curlFull
              jq
              libxml2
            ];
          };
        };
      }
    );
}
