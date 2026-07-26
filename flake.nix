{
	description = "NixOS + Hyprland + Caelestia Shell";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		caelestia-shell = {
			url = "github:caelestia-dots/shell/v2.1.0";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, caelestia-shell, ... }@inputs: {
		nixosConfigurations.mitchells-plain = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.angelo = import ./home.nix;
						extraSpecialArgs = { inherit inputs; };
						backupFileExtension = "backup";
					};
				}
			];
		};
	};

}
