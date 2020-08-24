{ makeTest, pkgs, dockerImages, ... }:

makeTest {
  name = "post-api-tests";

  nodes = {
    client = { pkgs, lib, ... }: {
      docker-containers.postAPI = {
        image = "devblog/postAPI:latest";
        imageFile = dockerImages.postAPI;
        extraDockerOptions = [ "--network=host" ];
      };
    };
  };

  testScript = ''
    start_all()
  '';
}
