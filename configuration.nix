{ config, pkgs, ... }:

{
  imports = [
	./environments/base.nix
	./environments/graphical.nix
	./environments/server.nix    # this laptop runs all the time. Uncomment to disable
	./environments/networking.nix
  ];


  environment.systemPackages = with pkgs; [
  	okular gnome3.nautilus vlc
  ];

}
