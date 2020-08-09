{ config, lib, pkgs, ... }:

with lib;

{
  imports = [
	./environments/base.nix
  ];

  environment.systemPackages = with pkgs; [
	mpv mplayer fbida
  ];

  services.xserver.enable = false;
}
