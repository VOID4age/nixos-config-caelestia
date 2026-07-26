{ config, inputs, pkgs, ... }:

{
	home.username = "angelo";
	home.homeDirectory = "/home/angelo";
	home.stateVersion = "26.05";
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use hyprland btw";
		};
	};

	imports = [ inputs.caelestia-shell.homeManagerModules.default ];

	programs.caelestia = {
		enable = true;
		cli.enable = true;
		systemd.enable = true;

	settings = {
			paths.wallpaperDir = "/home/angelo/Pictures/Wallpapers";
		};
	
	};
	
	home.packages = with pkgs; [
		nil
		nixpkgs-fmt
		nodejs
		gcc
		tree-sitter
	];

}
