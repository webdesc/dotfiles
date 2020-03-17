TAGS := all

all:
	ansible-playbook setup.yml -i local -vvv -e curdir=$(CURDIR) -K
