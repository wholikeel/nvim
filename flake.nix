{
  description = "neovim dev";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, ... }@inputs: inputs.utils.lib.eachDefaultSystem
    (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells = {
          default = pkgs.mkShell {
            name = "neovim dev";
            #buildInputs 
            packages = with pkgs; [
              lua-language-server
              stylua
              marksman
              nixd
              nixpkgs-fmt
            ];
          };
        };
      });
}

