list=bashrc bash_aliases bash_nnn vimrc vimrc.plug zathurarc bash_profile
UNAME_S := $(shell uname -s)

ifneq ($(UNAME_S),Linux)
exit:
	@echo $(UNAME_S)
	@echo "You are not using Linux. Exiting."
else
install:
	@for f in $(list); do \
		cp $$f ~/.$$f; \
	done
	@. ~/.bashrc
endif

.PHONY: install exit
