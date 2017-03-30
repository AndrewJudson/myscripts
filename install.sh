# Source the files from this repo
CUR_DIR='~/Development/myscripts'
echo "source $CUR_DIR/other/.aliases" | cat >> ~/.aliases
echo "[include]\n\tpath = $CUR_DIR/dotfiles/git/.gitconfig"| cat >> ~/.gitconfig
echo "source-file $CUR_DIR/dotfiles/.tmux.conf" | cat >> ~/.tmux.conf
echo "(load-file \"$CUR_DIR/dotfiles/.emacs.d/init.el\")" | cat >> ~/.emacs.d/init.el
# add antigen installer?
echo "source $CUR_DIR/other/.zshrc_master" | cat >> ~/.zshrc
