all:
	bash remote.sh

local:
	bash local.sh

terminate:
	ansible-playbook -i inventory/hosts.yml playbooks/terminate.yml

down:
	ansible-playbook -i inventory/hosts.yml playbooks/stop.yml -K

.PHONY: all local terminate down
