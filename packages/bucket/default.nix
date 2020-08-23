{ fetchFromGitHub, callPackage, pkg-config, openssl, ... }:

let
  mozillaRust = callPackage ./mozilla-rust.nix {
    date = "2020-01-15";
    channel = "nightly";
    sha256 = "olL7mTcuWQ6d46WIBW8vK3DfsNGbgGBuWQnazALOkk8=";
  };
in mozillaRust.buildRustPackage {
  name = "bucket";

  cargoPatches = [
    ./cargo.patch
  ];

  src = fetchFromGitHub {
    owner = "despairdev";
    repo = "dev-blog-bucket";
    rev = "cbbe2254c5fa58e52ac2006d7323fa1ef58af437";
    sha256 = "irRDVduT9nnbaPobBJCbsMAMcurheBdOUcfQHNlwhFg=";
  };

  buildInputs = [ pkg-config openssl.dev ];

  checkPhase = "true";

  cargoSha256 = "62blbH0w9V9td8BGD9tF5hEEFF0uH/weaZDbqrVFuDg=";

  verifyCargoDeps = true;
}
