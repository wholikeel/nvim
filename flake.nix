{
  description = "Neovim RC configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.11";
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
        devShells.default = pkgs.mkShell {
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
                tree-sitter
            ];
        };
      }
    );
}
