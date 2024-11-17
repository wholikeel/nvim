{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell.override { 
  stdenv = pkgs.gcc14Stdenv;
} {
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
}


