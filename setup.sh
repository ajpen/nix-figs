#!/usr/bin/env bash

#set -x

for config in ./*.nix; 
do
	if [ $config == "./configuration.nix" ]; then
		nixos-rebuild boot
	else
		pname=${config%.*}
		pname=${pname//.}
		pname=${pname///}
		nixos-rebuild boot -p $pname -I nixos-config=$config
	fi
done
