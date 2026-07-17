{
  writeShellScriptBin,
}:

writeShellScriptBin "zed-compile-extension" ''
  set -e

  SOURCE_DIR="''${1:-.}"
  OUTPUT_DIR="''${2:-dist}"
  SCRATCH_DIR=".direnv/zed-scratch"

  if [ ! -f "$SOURCE_DIR/extension.toml" ]; then
    echo "Error: No 'extension.toml' found in '$SOURCE_DIR'."
    echo "Please make sure to run this script from the root of your extension directory."
    exit 1
  fi

  if command -v zed-extension &> /dev/null; then
    CMD="zed-extension"
  elif command -v extension_cli &> /dev/null; then
    CMD="extension_cli"
  else
    echo "Error: Zed's compilation CLI tool is not installed."
    echo "Please run 'setup-zed-cli' first."
    exit 1
  fi

  echo "Compiling Zed extension from '$SOURCE_DIR'..."
  mkdir -p "$OUTPUT_DIR"
  mkdir -p "$SCRATCH_DIR"

  $CMD \
    --source-dir "$SOURCE_DIR" \
    --output-dir "$OUTPUT_DIR" \
    --scratch-dir "$SCRATCH_DIR"

  echo "Extension successfully compiled to '$OUTPUT_DIR/'."
''
