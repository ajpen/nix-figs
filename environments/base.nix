{ config, lib,  pkgs, ... }:


### Installation & Booting ###########

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # grub
  boot.loader.grub = {
    enable = true;
    version = 2;
    efiSupport = true;
    enableCryptodisk = true;
    device = "nodev";
  };

  # disk encryption with luks
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/c6793bb6-0dd0-4cb6-b171-4c802e2c862d";
      preLVM = true;
    };
  };

  
  # enable kernel based virtual machine
  boot.kernelModules = [ "kvm-intel" ];
  
  # Kernel parameters for XPS 13. May not be necessary
  boot.kernelParams = [ 
    "pcie.aspm=force"
    "i915.enable_fbc=1"
    "i915.enable_rc6=7"
    "i915.lvds_downclock=1"
    "i915.enable_guc_loading=1"
    "i915.enable_guc_submission=1"
    "i915.enable_psr=0"
  ];

  # More kernel options. 
  boot.kernelPackages = pkgs.linuxPackages_latest;


################################################################################

##### Locale and TTY/Console settings ###############

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "us";
  };

  # Sets up fonts and stuff early
  console.earlySetup = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Use KmsCon on TTYs
  # services.kmscon.enable = true;
  # services.kmscon.hwRender = true;
  # services.kmscon.extraConfig = "font-size=14";

################################################################################

##### System Settings  ##################

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [ 
	aspell
	aspellDicts.en
	fbterm
	git
	googler
	jfbview
	lynx
	man-pages
	python3
	screen
	tmux
	unzip
	vim
	w3m
	wget
	which
  ];


  # Automatic Garbage collection & optimization
  nix.gc.automatic = true;
  nix.optimise.automatic = true;


##### Services #######

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable SSH Agent
  programs.ssh.startAgent = true;

  # Enable docker 
  virtualisation.docker.enable = true;
  
  # Autoclean unused docker elements
  virtualisation.docker.autoPrune.enable = true;

  # enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;


##### Environment ###########
  environment.variables.EDITOR = "vim";




##############################################################################


##### User(s) Settings ##################

  #  Don't forget to set a password with ‘passwd’.
  users.users.anfernee = {
    isNormalUser = true;
	initialPassword = "toortoor";
    extraGroups = [ "docker" "video" ];
  };

#############################################################################


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}

