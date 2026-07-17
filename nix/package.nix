{
  lib,
  stdenv,
  version,
  ...
}:
let
  src = lib.cleanSource ../.;
in
stdenv.mkDerivation {
  pname = "zed-volt";
  inherit version src;

  installPhase = ''
    mkdir -p $out
    cp -r extension.toml languages $out/
  '';

  meta = with lib; {
    description = "Volt language support for Zed Editor";
    homepage = "https://github.com/Yutsuna/zed-volt";
    license = licenses.mit;
    maintainers = [ ];
  };
}
