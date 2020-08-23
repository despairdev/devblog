{ yarn2nix-moretea, fetchFromGitHub, nodejs, python, libsass, pkgconfig, makeWrapper, ... }:

yarn2nix-moretea.mkYarnPackage rec {
  name = "dev-blog-post-api";

  src = fetchFromGitHub {
    owner = "despairdev";
    repo = "dev-blog-post-api";
    rev = "4a43600e5af83feb7921b36bb8e2f4f2b2826efe";
    sha256 = "jL4hWCF5ktKr8x+wZFnCp58wU3/64SeTpJ+xAYQdQ4M=";
  };

  yarnLock = ./yarn.lock;

  propagatedBuildInputs = [ makeWrapper ];

  buildPhase = ''
    yarn run build
  '';

  postInstall = ''
    makeWrapper ${nodejs}/bin/node $out/bin/post-api --add-flags $out/libexec/post-api/deps/post-api/dist/main.js
  '';

  distPhase = "true";
  doDist = false;


  pkgConfig = {
    node-sass = {
      buildInputs = [ python libsass pkgconfig ];
      postInstall = ''
        LIBSASS_EXT=auto yarn --offline run build
      '';
    };

    "@angular/cli" = {
      prePatch = ''
        export NG_CLI_ANALYTICS=false
      '';
    };
  };

  yarnNix = ./yarn.nix;
}
