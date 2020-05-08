with (import <nixpkgs> {});
stdenv.mkDerivation rec {
  name = "jphim-blog";
  version = "latest";
  src = ./.;
  buildInputs = [ hugo ];
  phases = "installPhase";
  installPhase = ''
    mkdir -p $out/share/jphim
    cd ${src} && hugo -d $out/share/jphim
  '';
}
