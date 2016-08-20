# Concatenate bashrc-master to existing bashrc file (in order to avoid path/source issues)
cat other/.bashrc-master >> ~/.bashrc
# Copy other config files
# TODO: Make this more programatic (once there are more files)
cp other/.aliases ~/.aliases
cp -r dotfiles/git ~/.git
cp dotfiles/.tmux.conf ~/.tmux.conf
cp -r dotfiles/.emacs.d ~/.emacs.d
# add antigen installer?
cat other/.zshrc_master >> ~/.zshrc
