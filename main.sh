# Install essentials
sudo apt install git curl net-tools vim zsh build-essential -y

# Download/Install chrome
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Download/Install VSCode
wget https://az764295.vo.msecnd.net/stable/695af097c7bd098fbf017ce3ac85e09bbc5dda06/code_1.79.2-1686734195_amd64.deb
sudo apt install ./code_*.deb


# SSH Setup
cd ~/.ssh
ssh-keygen -t ed25519 -C u.ahmed@abysssolutions.com.au
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
read -p "\nAdd the above key to github and press enter to continue\n"
ssh -T git@github.com

# Cloning repos
cd ~
mkdir Work
cd Work
git clone git@github.com:abyss-solutions/fabric-api-ts.git
git clone git@github.com:abyss-solutions/fabric-client-react.git


# NVM
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

## Install node versions
cd ~/Work/fabric-api-ts
nvm install
nvm use
npm i -g yarn

cd ~/Work/fabric-client-react
nvm install
nvm use
npm i -g yarn


cd
nvm install --lts
nvm use --lts
npm i -g yarn


# Installing snaps
sudo snap install nvim
sudo snap install nvim --classic

# ZSH
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting


# Docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}
su - ${USER}
groups


# Docker desktop
cd Downloads
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.21.1-amd64.deb
sudo apt install ./docker-desktop-*.deb

# Replica Set
docker pull candis/mongo-replica-set
docker run -d -p 27017:27017 -p 27018:27018 -p 27019:27019 candis/mongo-replica-set


# Mongo tools
wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-x86_64-100.7.3.deb
sudo apt install ./mongodb-database-tools-ubuntu2204-x86_64-*.deb

# mongo compass
wget https://downloads.mongodb.com/compass/mongodb-compass_1.38.2_amd64.deb
sudo apt install ./mongodb-compass_*.deb

# Fonts
cd ~
mkdir ~/.fonts
cd .fonts
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono*.zip
rm OFL.txt AUTHORS.txt JetBrainsMono-*.zip
mv fonts/ttf/*.ttf ./
rm fonts -r


# Ohmyzsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

cp ./dotfiles/.zshrc ~/.zshrc
