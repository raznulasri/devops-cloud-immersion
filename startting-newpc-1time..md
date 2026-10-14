# new PC
## 1 for Windows
```
irm https://raw.githubusercontent.com/Infratify/bootstrap-devops-bootcamp/main/install.ps1 | iex
```

## 1 for Linux
```
curl -fsSL https://raw.githubusercontent.com/Infratify/bootstrap-devops-bootcamp/main/script-linux.sh -o script-linux.sh && bash script-linux.sh
```

----------------

# Inside Linux
## 2 starting setup
```
sudo apt update
```


## 3 ZSH install line by line avoid error
```
sudo apt install -y zsh fzf
 ```
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```
```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```
```
sed -i 's/^plugins=.*/plugins=(git sudo zsh-autosuggestions fzf zsh-syntax-highlighting)/' ~/.zshrc
```
```
chsh -s $(which zsh)
```
### close terminal and open


## 4 install eza
sudo apt update && sudo apt install -y eza

cat << 'EOF' >> ~/.zshrc
# Custom eza aliases
alias ls='eza --icons'
alias ll='ls -la'
EOF

# 5 powerlevel10k install
## a. Font dahulu — install at PC MesloLGS NF manully. Please ignore if existing
 https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k

## b. Kemudian pasang tema — Oh My Zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
## Open ~/.zshrc, find the line that sets ZSH_THEME, and change its value to "powerlevel10k/powerlevel10k".


# 6 lazygit
sudo apt install lazygit

# 7 github
sudo apt install gh
gh auth login
gh auth status
ssh -T git@github.com

# 8 aws
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
unzip awscliv2.zip && sudo ./aws/install
aws configure
aws sts get-caller-identity

# 9 terraform https://developer.hashicorp.com/terraform/install
sudo apt install terraform

# 10 cloudflare. do at cloudflare and hosting site
# Domain - add domain
# select Free plan
# DNS - Setting - Copy Nameserver to own hosting
# Click I updated my nameservers (take 1 2 hours)

# 10 check version
zsh --version
eza --version
lazygit --version
gh --version
aws --version
terraform --version
