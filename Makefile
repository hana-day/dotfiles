install: install-vim install-zsh install-tmux

install-vim:
	rm -rf ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc

install-zsh:
	rm -rf ~/.zshrc ~/.zshrc.alias
	ln -s `pwd`/zshrc ~/.zshrc
	ln -s `pwd`/zshrc.alias ~/.zshrc.alias

install-tmux:
	rm -rf ~/.tmux.conf
	ln -s `pwd`/tmux.conf ~/.tmux.conf
