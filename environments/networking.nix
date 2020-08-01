{ config, pkgs, ... }:

{
  
  networking.networkmanager.enable = true; 

  networking.extraHosts = builtins.readFile ../addons/restricted-hosts;

}
