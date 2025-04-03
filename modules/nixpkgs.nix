{
  outputs,
  ...
}:

{
  nixpkgs = {
    overlays = [
      outputs.overlays.default
    ];

    config = {
      allowUnfree = true;
    };
  };
}
