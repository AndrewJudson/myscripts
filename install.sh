# Concatenate bashrc-master to existing bashrc file (in order to avoid path/source issues)
cat other/.bashrc-master >> ~/.bashrc
# Copy other config files
# TODO: Make this more programatic (once there are more files)
cp other/.bash_aliases ~/.bash_aliases
cp other/.git-completion-patch.bash ~/.git-completion-patch.bash
cp -r dotfiles/git ~/.git
cp dotfiles/.tmux.conf ~/.tmux.conf
cp -r dotfiles/.emacs.d ~/.emacs.d
