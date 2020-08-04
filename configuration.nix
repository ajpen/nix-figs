{ config, pkgs, ... }:

{
  imports = [
	./study.nix
	./environments/networking.nix
  ];
}
