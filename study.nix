{ config, pkgs, ... }:

{
  imports = [
	./environments/base.nix
  ];

  environment.systemPackage = with pkgs; [
	mpv mplayer fbida
  ];
}
