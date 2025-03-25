{
  description = "Flake for exporting some packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11-small";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;
    };
}
