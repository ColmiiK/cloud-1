local:
	bash init.sh
	ansible-galaxy install -r requirements.yml
	ansible-playbook -i inventory/hosts.yml playbooks/local-setup.yml -K

down:
	ansible-playbook -i inventory/hosts.yml playbooks/stop.yml -K

clean: down
	rm -rf .venv

.PHONY: local down clean
