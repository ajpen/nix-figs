{ config, pkgs, ... }:


{

    # Set up DWM
    nixpkgs.config.packageOverrides = pkgs: {
      dwm = pkgs.dwm.overrideAttrs (_: {
	    src = builtins.fetchGit {
	      url = "https://github.com/ajpen/dwm";
		  ref = "master";
	    };
	  }); 
     };

    # GUI packages
    environment.systemPackages = with pkgs; [
	  dwm dmenu arandr rxvt_unicode feh
    ];

    # Enable sound.
    sound.enable = true;
    hardware.pulseaudio.enable = true;
  
    # Enable X11
    services.xserver.enable = true;

    # Enable touchpad support.
    services.xserver.libinput.enable = true;

    services.xserver.displayManager.lightdm.enable = true;

    # setup session for dwm
    services.xserver.desktopManager.session =
	  [{ 
	    name = "dwm";
	    start = ''
              # fixes issues with Jetbrains applications
              #export _JAVA_AWT_WM_NONREPARENTING=1
              #export AWT_TOOLKIT=MToolkit
	      #wmname LG3D
	      feh --bg-scale /etc/nixos/addons/wallpapers/default.jpg
	      /run/current-system/sw/bin/dwm &
	      waitPID=$!
	    '';
	  }];
}
