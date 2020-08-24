{
  description = "DevBlog - Despair Driven Development";

  inputs.nixpkgs.url =
    "github:NixOS/nixpkgs/b83b54d0a8336746e4cd130bb7beb2ddd032ac87";

  outputs = { self, nixpkgs }:
    let
      moz_overlay = import (builtins.fetchTarball {
        url =
          "https://github.com/mozilla/nixpkgs-mozilla/archive/efda5b357451dbb0431f983cca679ae3cd9b9829.tar.gz";
        sha256 = "11wqrg86g3qva67vnk81ynvqyfj0zxk83cbrf0p9hsvxiwxs8469";
      });

      pkgs = (import nixpkgs {
        system = "x86_64-linux";
        config = { allowUnfree = true; };
        overlays = [ moz_overlay ];
      });

      serveLandingScript = pkgs.writeScript "serveLanding" ''
        ${pkgs.python3}/bin/python -m http.server --directory ${self.packages.x86_64-linux.landingPage}
      '';
    in {
      #packages.x86_64-linux.bucket =
      #  pkgs.callPackage ./packages/bucket {};

      packages.x86_64-linux.landingPage =
        pkgs.callPackage ./packages/landingPage { };

      packages.x86_64-linux.postAPI = pkgs.callPackage ./packages/postAPI { };

      dockerImages = {
        postAPI = pkgs.dockerTools.buildImage {
          name = "devblog/postAPI";
          tag = "latest";

          contents = [ self.packages.x86_64-linux.postAPI pkgs.bashInteractive ];
        };
      };

      #packages.x86_64-linux.navbar =
      #  pkgs.callPackage ./packages/navbar { inherit mainRepo; };

      apps.x86_64-linux.serveLanding = {
        type = "app";
        program = "${serveLandingScript}";
      };

      devShell.x86_64-linux = pkgs.mkShell { buildInputs = [ ]; };

      hydraJobs = {
        build = {
          postAPI = pkgs.runCommand { preferLocalBuild = true; } ''
            mkdir -p $out/nix-support
            cp ${self.dockerImages.postAPI} $out/nix-support/hydra-build-products
          '';
        };
      };
    };
}
