local:
	ansible-playbook -i inventory/hosts.yml playbooks/local-setup.yml -K

.PHONY: local
