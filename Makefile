local:
	ansible-playbook -i inventory/hosts.yml playbooks/local-deploy.yml -K

.PHONY: local
