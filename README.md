**[Terraform Tutorial](https://developer.hashicorp.com/terraform/tutorials/docker-get-started/infrastructure-as-code)**

1- Install terraform: 

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform
```

2- Verify the Installation:
```
terraform -help
```

3- Install docker 

4- Create main.tf file

5- To initialize directory, Run,
```
terraform init
```

6- To format and validate the configuration,
```
terraform fmt && terraform validate
```

7- Create the infrasturcture by; 
```
terraform apply
```

8- It prompts a question; write 'yes'.

9- Inspect the state 
```
terraform show
```

10- To list the resources in project's state; 
```
terraform state list
```

11- If visited the `http://localhost:8080` through http client, nginx web server is available.

12- To change the created infratructure, we just change the configuration file and run;
```
terraform apply
```

13- To destroy;
```
terraform destroy
```

14- To include variables in tf file, create a variable.tf file and add a variable for container name. We can now use this container name in main.tf. We can also do it this;
```
terraform apply -var "container_name=YetAnotherName"
```

15- To get sepcific outputs like image id or container id, we can use outputs.tf file and define the outputs there.
To see the outputs;
```
terraform output
```


**[How To Import Existing Infrastructure to Terraform](https://developer.hashicorp.com/terraform/tutorials/state/state-import)**

1- Create a docker container;
```
docker run --name hashicorp-learn -d -p 8081:80 nginx:latest

docker ps --filter="name=hashicorp-learn"

docker inspect hashicorp-learn --format="{{.ID}}" // to get the id of container

```

2- After writing docker.tf to import a existing container, run to generate configuration for the resources we will import;
```
terraform plan -generate-config-out=generated.tf
```

Terraform used the docker provider to find a docker_container resource with the ID you specified in the import block.

3- Prune the generated.tf to contain only necesary arguments. Then run to verify configuration;
```
terraform plan
```

4- We can change the configuration of created resource through generated.tf file. eg, We changed external port from 8081 to 8091 of the container. Now, run;
```
terraform apply
```

5- We can bring resources to terraform without import block such as docker images. You can do one thing; either creating import block or create a resource separately in docker.tf file. We can find the name of image based on this command in docker and then refernce in generated.tf file for image instead of SHA256 hash id;
```
 docker image inspect -f {{.RepoTags}} `docker inspect --format="{{.Image}}" hashicorp-learn`
``` 
*Do not replace the image value in the docker_container.web resource yet, or Terraform will destroy and recreate your container. Since Terraform did not yet load the docker_image.nginx resource into state, it does not have an image ID to compare with the hardcoded one, which will force replacement. The image resource must exist in state before you can reference it.*
