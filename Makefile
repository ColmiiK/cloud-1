all:
	bash init.sh

local:
	bash local-init.sh

terminate:
	ansible-playbook -i inventory/hosts.yml playbooks/terminate.yml

clean:
	rm launched_hosts.yml
	rm launched_instance_metadata.yml

down:
	ansible-playbook -i inventory/hosts.yml playbooks/stop.yml -K

.PHONY: all terminate clean down
