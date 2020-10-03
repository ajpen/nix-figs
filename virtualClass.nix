{ config, pkgs, ... }:

{
  imports = [
	./environments/base.nix
	./environments/graphical.nix
	./environments/networking.nix
  ];

  environment.systemPackages = with pkgs; [
 	jetbrains.pycharm-professional
	jetbrains.webstorm
	gnome3.nautilus 
	google-chrome 
	zoom-us
  ];

}
