#install everything

#switch to pipewire if system doesn't come with
sudo systemctl --user disable pulseaudio.socket pulseaudio.service
yay -Rns pulseaudio 
sudo systemctl --user enable pipewire pipewire-pulse
sudo systemctl --user start pipewire pipewire-pulse

#copy dotfiles
mkdir $HOME/.config
cd ~/swayconfig/
sudo cp environment /etc/
sudo cp pfetch /usr/bin/pfetch
rsync -av --progress ./ $HOME/ --exclude .git --exclude backup.sh --exclude installscript.sh --exclude pfetch --exclude environtment --exclude swaybu.sh --exclude fixzsh.sh --exclude .fonts

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

git clone https://github.com/dcx86r/cmus-notify
cd cmus-notify/
sudo sh installer.sh install
cd ~/
#:set status_display_program=/usr/local/bin/cmus-notify #in cmus


