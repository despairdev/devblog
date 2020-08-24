{ makeTest, pkgs, dockerImages, ... }:

makeTest {
  name = "post-api-tests";

  nodes = {
    client = { pkgs, lib, ... }: {
      docker-containers.postAPI = {
        imageFile = dockerImages.postAPI;
        extraDockerOptions = [ "--network=host" ];
      };
    };
  };

  testScript = ''
    start_all()
  '';
}
