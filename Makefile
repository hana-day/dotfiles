install: install-vim

install-vim:
	rm -rf ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc
