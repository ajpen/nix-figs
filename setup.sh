#!/usr/bin/env bash

#set -x

for config in ./*.nix; 
do
	if [ $config == "./configuration.nix" ]; then
		echo "ignoring configuration.nix"
	else
		pname=${config%.*}
		pname=${pname//.}
		pname=${pname///}
		nixos-rebuild boot -p $pname -I nixos-config=$config
	fi
done

# Finally, build the default config
nixos-rebuild boot

echo "Don't forget to cleanup if all is well"
