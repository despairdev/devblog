{ yarn2nix-moretea, fetchFromGitHub, ... }:

yarn2nix-moretea.mkYarnPackage rec {
  name = "landing-page";

  src = fetchFromGitHub {
    owner = "despairdev";
    repo = "dev-blog-landingpage";
    rev = "26f2d1fa26ca886aea88040e7698dc00036abaac";
    sha256 = "iPXHNDxKaFTkfmeBhRpFc/zuiwAIYSnlN/X0vEDEU7I=";
  };

  yarnNix = ./yarn.nix;
  yarnLock = ./yarn.lock;

  buildPhase = ''
    rm deps/landingpage/node_modules
    mkdir deps/landingpage/node_modules
    ln -s $node_modules/.bin deps/landingpage/node_modules/.bin
    substituteInPlace deps/landingpage/angular.json --replace node_modules ../../node_modules
    yarn run build
  '';

  installPhase = ''
    mkdir -p $out
    cp -a deps/landingpage/dist/landingPage/* $out/
  '';

  distPhase = "true";
  doDist = false;
}
