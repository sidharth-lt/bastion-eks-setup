#!/bin/sh

sudo apt update -y
sudo apt install wget nano curl git unzip -y
sudo mkdir -p ~/.local/bin
CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1)
sudo wget -c https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -O - | tar -xzv -C ~/.local/bin
sudo chmod u+x ~/.local/bin/saml2aws
hash -r
~/.local/bin/saml2aws --version
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
