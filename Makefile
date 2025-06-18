local:
	ansible-galaxy install -r requirements.yml
	ansible-playbook -i inventory/hosts.yml playbooks/local-setup.yml -K

stop:
	ansible-playbook -i inventory/hosts.yml playbooks/stop.yml -K

.PHONY: local stop
