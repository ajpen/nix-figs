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
    services.xserver.displayManager.lightdm.enable = true;

    # Enable touchpad support.
    services.xserver.libinput.enable = true;

    services.physlock = {
      allowAnyUser = true;
      enable = true;
    };

    services.xserver.xautolock = {
	enable = true;
	enableNotifier = true;
	locker = ''${config.security.wrapperDir}/physlock'';
	notifier = ''${pkgs.libnotify}/bin/notify-send "Locking in 10 seconds"'';
    };

    # setup session for dwm
    services.xserver.desktopManager.session =
	  [{ 
	    name = "dwm";
	    start = ''
              # fixes issues with Jetbrains applications
              export _JAVA_AWT_WM_NONREPARENTING=1
              export AWT_TOOLKIT=MToolkit
              wmname LG3D

	      # Set background
	      feh --bg-scale /etc/nixos/addons/wallpapers/default.jpg

	      /run/current-system/sw/bin/dwm &
	      waitPID=$!
	    '';
	  }];
}
