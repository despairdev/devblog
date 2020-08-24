{ makeTest, pkgs, dockerImages, ... }:

makeTest {
  name = "post-api-tests";

  nodes = {
    client = { pkgs, lib, ... }: {

      services.redis.enable = true;

      docker-containers.postAPI = {
        image = "devblog/postAPI:latest";
        imageFile = dockerImages.postAPI;

        environment = {
          api_port = "3306";
        };

        extraDockerOptions = [ "--network=host" ];
      };
    };
  };

  testScript = ''
    start_all()

    client.succeed("curl localhost:3000")
  '';
}
