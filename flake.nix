{
 
 description = "My first flake!";

 inputs = {
 nixpkgs.url = "nixpkgs/nixos-unstable";
 };

 outputs = {nixpkgs, ...}:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
   nixosConfigurations = {
    rosie = lib.nixosSystem {
    inherit system;
    modules = [ ./configuration.nix ];
   };
  };
 };
}
