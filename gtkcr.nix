{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.gcc
    pkgs.gtk3
    pkgs.pkg-config
    pkgs.glib
    pkgs.gnome.gobject-introspection
  ];
}
