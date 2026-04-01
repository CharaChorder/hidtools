{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "waratah";
      overlay = final: prev: {
        waratah = {
          waratah = prev.callPackage ./nix { };
        };
      };
      shell =
        { pkgs }:
        pkgs.mkShell {
          buildInputs = [ pkgs.dotnetCorePackages.dotnet_8.sdk ];
        };
    };

}
