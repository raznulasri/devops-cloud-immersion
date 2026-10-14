## new PC
# for Windows
irm https://raw.githubusercontent.com/Infratify/bootstrap-devops-bootcamp/main/install.ps1 | iex

# for Linux
curl -fsSL https://raw.githubusercontent.com/Infratify/bootstrap-devops-bootcamp/main/script-linux.sh -o script-linux.sh && bash script-linux.sh




## Inside Linux
# starting setup
sudo apt update

# github
sudo apt install gh
gh auth login
gh auth status
ssh -T git@github.com

# aws
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
unzip awscliv2.zip && sudo ./aws/install
aws configure
aws sts get-caller-identity

# terraform https://developer.hashicorp.com/terraform/install
sudo apt install terraform

# cloudflare
# Domain - add domain
# select Free plan
# DNS - Setting - Copy Nameserver to own hosting
# Click I updated my nameservers (take 1 2 hours)


gh --version
aws --version
terraform --version