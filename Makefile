list=bashrc bash_aliases bash_nnn vimrc vimrc.plug zathurarc
UNAME_S := $(shell uname -s)

ifneq ($(UNAME_S),Linux)
exit:
	@echo "You are not using Linux. Exiting."
else
install:
	@ifeq ($(UNAME_S), Linux)
		for f in $(list); do \
			cp $$f ~/.$$f; \
		done
		. ~/.bashrc
	endif
endif

.PHONY: install exit
