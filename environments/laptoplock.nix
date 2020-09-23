{config, lib, pkgs, ... }:

with lib;

{   
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
}
