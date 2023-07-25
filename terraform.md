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
 ```terraform init``` .

6- To format and validate the configuration,

`terraform fmt && terraform validate`.

7- Create the infrasturcture by; `terraform apply`.

8- It prompts a question; write 'yes'.

9- Inspect the state `terraform show`.

10- To list the resources in project's state; `terraform state list`.

11- If visited the `http://localhost:8080` through http client, nginx web server is available.

12- To change the created infratructure, we just change the configuration file and run;

```
terraform apply
```


