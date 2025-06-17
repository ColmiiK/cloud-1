all:
	ansible-playbook -i inventory/hosts.yml playbooks/local-deploy.yml

.PHONY: all
