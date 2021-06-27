list=bashrc bash_aliases bash_nnn vimrc vimrc.plug zathurarc
install:
	@for f in $(list); do \
		cp $$f ~/.$$f; \
	done
	@. ~/.bashrc

.PHONY: install
