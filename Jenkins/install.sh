# ----------------------------------------------------------------------------
# JRE Install
# ----------------------------------------------------------------------------
sudo add-apt-repository universe
sudo apt install openjdk-21-jre




# ----------------------------------------------------------------------------
# Jenkins Install
# ----------------------------------------------------------------------------
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins




# ----------------------------------------------------------------------------
# Docker Install ( skip if already installed)
# ----------------------------------------------------------------------------
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin





# ----------------------------------------------------------------------------
# Bun Install
# ----------------------------------------------------------------------------

sudo apt install unzip
curl -fsSL https://bun.sh/install | bash


# ----------------------------------------------------------------------------
# Post Install ( May need to run manually again)
# ----------------------------------------------------------------------------
sudo groupadd docker
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins
sudo systemctl start jenkins


# ----------------------------------------------------------------------------
# Pull Images
# ----------------------------------------------------------------------------
sudo docker pull oven/bun:latest
sudo docker pull node:alpine
sudo docker pull mongo:latest
