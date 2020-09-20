{ config, pkgs, ... }:

{
  imports = [
	./environments/base.nix
	./environments/graphical.nix
	./environments/networking.nix
  ];


  environment.systemPackages = with pkgs; [
  	okular gnome3.nautilus vlc
  ];

}
