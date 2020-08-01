{ config, pkgs, ... }:

{
  imports = [
	./study.nix
	./environment/networking.nix
  ];
}
