all:
	bash init.sh
	source .venv/bin/activate
	pip install -r pip_requirements.txt
	ansible-galaxy install -r requirements.yml
	ansible-playbook -i inventory/hosts.yml playbooks/create_ec2.yml
	ansible-playbook -i inventory/hosts.yml playbooks/setup.yml
	ansible-playbook -i inventory/hosts.yml playbooks/deploy.yml

terminate:
	ansible-playbook -i inventory/hosts.yml playbooks/terminate.yml

clean: terminate
	rm -rf .venv

.PHONY: all terminate clean
