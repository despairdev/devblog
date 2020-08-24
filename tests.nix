{ makeTest, pkgs, dockerImages, ... }:

makeTest {
  name = "post-api-tests";

  nodes = {
    client = { pkgs, lib, ... }: {

      environment.systemPackages = [ pkgs.curl ];

      services.redis.enable = true;

      docker-containers.postAPI = {
        image = "devblog/postAPI:latest";
        imageFile = dockerImages.postAPI;

        environment = {
          api_port = "3306";

          db_database = "testPostAPI";
          db_password = "VerySecurePassword";
          db_username = "testuser";
          db_host = "localhost";
        };

        extraDockerOptions = [ "--network=host" ];
      };

      services.mysql = {
        enable = true;
        package = pkgs.mariadb;

        initialScript = pkgs.writeText "mysql-init.sql" ''
          CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'VerySecurePassword';
          GRANT ALL PRIVILEGES ON testPostAPI.* TO 'testuser'@'localhost';
        '';

        initialDatabases = [{ name = "testPostAPI"; }];
      };
    };

  };

  testScript = ''
    start_all()

    client.wait_until_succeeds("docker logs postAPI")
  '';
}
