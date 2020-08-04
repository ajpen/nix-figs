{ config, pkgs, ... }:

{
  imports = [
	./environments/base.nix
	./environments/graphical.nix
	./environments/networking.nix
  ];

  environment.systemPackages = with pkgs; [
	gnome3.nautilus google-chrome
  ];

}
