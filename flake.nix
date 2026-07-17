{
  description = "Volt zed plugin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f (import nixpkgs { inherit system; }));
      version = with builtins; head (split "\n" (readFile ./VERSION.md));
    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.callPackage ./nix/package.nix { inherit inputs version; };
      });

      devShells = forAllSystems (
        pkgs:
        let
          voltExtension = pkgs.callPackage ./nix/package.nix { inherit inputs version; };
        in
        {
          default = pkgs.callPackage ./nix/shell.nix { inherit voltExtension; };
        }
      );
    };
}
