install: install-vim install-zsh install-tmux install-emacs install-gitconfig install-gitignore install-ctags

install-vim:
	rm -rf ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc
	mkdir -p ~/.vim/swap
	mkdir -p ~/.vim/backup

install-zsh:
	rm -rf ~/.zshrc
	ln -sf `pwd`/zshrc ~/.zshrc

install-tmux:
	rm -rf ~/.tmux.conf
	ln -s `pwd`/tmux.conf ~/.tmux.conf

install-emacs:
	rm -rf ~/.emacs.d/init.el ~/.emacs.d/eshell ~/.emacs.d/snippets ~/.emacs.d/elpa
	ln -s `pwd`/emacs.d/init.el  ~/.emacs.d/init.el
	ln -s `pwd`/emacs.d/eshell   ~/.emacs.d/eshell
	ln -s `pwd`/emacs.d/snippets ~/.emacs.d/snippets
	ln -s `pwd`/emacs.d/elpa ~/.emacs.d/elpa

install-gitconfig:
	rm -rf ~/.gitconfig
	ln -s `pwd`/gitconfig ~/.gitconfig

install-gitignore:
	rm -rf ~/.gitignore_global
	ln -s `pwd`/gitignore_global ~/.gitignore_global

install-ctags:
	rm -rf ~/.ctags
	ln -s `pwd`/.ctags ~/.ctags
