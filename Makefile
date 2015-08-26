install: install-vim install-zsh install-tmux install-emacs install-fonts

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

install-emacs:
	rm -rf ~/.emacs.d/init.el ~/.emacs.d/elisp \
		~/.emacs.d/eshell ~/.emacs.d/settings ~/.emacs.d/snippets
	ln -s `pwd`/emacs.d/init.el  ~/.emacs.d/init.el
	ln -s `pwd`/emacs.d/elisp    ~/.emacs.d/elisp
	ln -s `pwd`/emacs.d/eshell   ~/.emacs.d/eshell
	ln -s `pwd`/emacs.d/settings ~/.emacs.d/settings
	ln -s `pwd`/emacs.d/snippets ~/.emacs.d/snippets

install-fonts:
	rm -rf ~/.fonts
	ln -s `pwd`/fonts ~/.fonts
