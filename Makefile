TAGS := all

all:
	ansible-playbook setup.yml -i local -vvv -e curdir=$(CURDIR) -K

nvchad:
	ansible-playbook setup-nvchad.yml -i local -vvv -e curdir=$(CURDIR) -K
