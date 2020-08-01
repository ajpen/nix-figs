{ config, pkgs, ... }:

{
  imports = [
	./environments/base.nix
	./environments/graphical.nix
	./environments/networking.nix
  ];

  environment.systemPackage = with pkgs; [
	google-chrome nautilus
  ];

}
