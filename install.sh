sudo apt update
#install build-essential an ripgrep (easy)
sudo apt install -y build-essential ripgrep

# Get Ubuntu version
declare repo_version=$(if command -v lsb_release &> /dev/null; then lsb_release -r -s; else grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"'; fi)

# Download Microsoft signing key and repository
wget https://packages.microsoft.com/config/ubuntu/$repo_version/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

# Install Microsoft signing key and repository
sudo dpkg -i packages-microsoft-prod.deb

# Clean up
rm packages-microsoft-prod.deb

# Update packages
sudo apt update

#install dotnet
sudo apt install -y dotnet-sdk-7.0

#install neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb  -P /tmp
cd /tmp && sudo apt install -y ./nvim-linux64.deb
