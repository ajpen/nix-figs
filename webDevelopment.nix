{config, lib, pkgs, ... }:

with lib;

{
  imports = [
    ./environments/base.nix
    ./virtualClass.nix
  ];

  environment.systemPackages = with pkgs; [
    jetbrains.webstorm
    jetbrains.pycharm-professional
  ];
}
