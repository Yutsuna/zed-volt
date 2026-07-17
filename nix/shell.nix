{
  mkShell,
  taplo,
  pkg-config,
  openssl,
  cargo,
  rustc,
  git,
  cmake,
  voltExtension ? null,
  callPackage,
  ...
}:
let
  setupZedCli = callPackage ./zed-cli.nix { };
  zedCompileExtension = callPackage ./zed-compile.nix { };
in
mkShell {
  name = "zed-volt-dev-shell";

  inputsFrom = if voltExtension != null then [ voltExtension ] else [];

  buildInputs = [
    taplo
    pkg-config
    openssl
    cargo
    rustc
    git
    cmake
    setupZedCli
    zedCompileExtension
  ];

  shellHook = ''
    export PKG_CONFIG_PATH="${openssl.dev}/lib/pkg-config"

    mkdir -p .direnv/bin
    export PATH="$PWD/.direnv/bin:$PATH"

    if ! command -v extension_cli &> /dev/null; then
        cat << EOF
Zed's 'extension_cli' tool is not yet installed in your project.
Run the following command to install it interactively:
setup-zed-cli
        EOF
    fi
  '';
}
