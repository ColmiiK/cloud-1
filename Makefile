all:
	bash init.sh

terminate:
	ansible-playbook -i inventory/hosts.yml playbooks/terminate.yml

clean:
	rm launched_hosts.yml
	rm launched_instance_metadata.yml

.PHONY: all terminate clean
