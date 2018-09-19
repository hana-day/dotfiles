install: install-vim install-bash install-tmux install-emacs install-gitconfig

install-vim:
	rm -rf ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc
	mkdir -p ~/.vim/swap
	mkdir -p ~/.vim/backup

install-bash:
	rm -rf ~/.bashrc
	ln -sf `pwd`/bashrc ~/.bashrc

install-tmux:
	rm -rf ~/.tmux.conf
	ln -s `pwd`/tmux.conf ~/.tmux.conf

install-emacs:
	rm -rf ~/.emacs.d/init.el ~/.emacs.d/eshell ~/.emacs.d/snippets
	ln -s `pwd`/emacs.d/init.el  ~/.emacs.d/init.el
	ln -s `pwd`/emacs.d/eshell   ~/.emacs.d/eshell
	ln -s `pwd`/emacs.d/snippets ~/.emacs.d/snippets

install-gitconfig:
	rm -rf ~/.gitconfig
	ln -s `pwd`/gitconfig ~/.gitconfig
