{ config, lib, pkgs, ... }:

with lib;

{
  imports = [
	./environments/base.nix
  ];

  environment.systemPackages = with pkgs; [
	mpv mplayer fbida okular 
  ];

  services.xserver.enable = false;
}
