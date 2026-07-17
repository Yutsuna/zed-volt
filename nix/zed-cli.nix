{
  writeShellScriptBin,
  openssl,
}:

writeShellScriptBin "setup-zed-cli" ''
  set -e
  export PKG_CONFIG_PATH="${openssl.dev}/lib/pkg-config"

  mkdir -p .direnv/bin

  echo "Compiling extension_cli from Zed's repository..."

  CARGO_TARGET_DIR=.direnv/cargo-target cargo install \
    --root .direnv \
    --git https://github.com/zed-industries/zed \
    extension_cli

  echo -e "\n'extension_cli' has been successfully compiled into .direnv/bin!"
''
