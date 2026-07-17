{
  mkShell,
  taplo,
  voltExtension,
  ...
}:

mkShell {
  name = "zed-volt-dev-shell";

  inputsFrom = [ voltExtension ];

  buildInputs = [
    taplo
  ];
}
