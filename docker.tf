/*import {
    id = "nginx:latest"
    to = docker_container.web
}
*/


resource "docker_image" "nginx-test" {
    name = "nginx:latest"
}
