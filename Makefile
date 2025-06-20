local:
	bash init.sh
	ansible-galaxy install -r requirements.yml
	ansible-playbook -i inventory/hosts.yml playbooks/local-setup.yml -K

ec2:
	bash init.sh
	ansible-galaxy install -r requirements.yml
	ansible-playbook -i inventory/hosts.yml playbooks/create_ec2.yml -K
	ansible-playbook -i inventory/hosts.yml playbooks/setup.yml -K
	ansible-playbook -i inventory/hosts.yml playbooks/deploy.yml -K

down:
	ansible-playbook -i inventory/hosts.yml playbooks/stop.yml -K

clean: down
	rm -rf .venv

.PHONY: local ec2 down clean
