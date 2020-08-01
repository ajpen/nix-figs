{config, pkgs, ... }:

{
  config = {
	  
	imports = [
	  ./school-admin.nix
    ];

	environment.systemPackage = with pkgs; [
	  jetbrains.webstorm 
	];
  };
}
