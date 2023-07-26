# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "79371d3a334f5d4170535a920a0f2206c10706a2a16948244095b06322cd4d64"
resource "docker_container" "web" {
  env                                         = []
  image                                       =  docker_image.nginx-test.image_id
  name                                        = "hashicorp-learn"
  ports {
    external = 8091
    internal = 80
    ip       = "::"
    protocol = "tcp"
  }
}
