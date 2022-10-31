{
  description = "A very basic flake";

  outputs = { self, nixpkgs}: let 
    forAllSystems = f: nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (system: f system);

    # Nixpkgs instantiated for supported system types.
    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
  in {
    packages = forAllSystems (system:
    let
      pkgs = nixpkgsFor.${system};
    in {
      default = pkgs.stdenv.mkDerivation {
        name = "jph.im";
        src = ./.;
        buildInputs = with pkgs; [ git hugo ];
        buildPhase = ''
          ${pkgs.hugo}/bin/hugo
        '';
        installPhase = ''
          mv public $out
        '';
      };
    });
    devShells = forAllSystems (system:
      let pkgs = nixpkgsFor.${system};
      in {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [ hugo git ];
        };
    });
  };
}

