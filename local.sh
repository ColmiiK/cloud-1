#!/bin/bash

VENV_DIR=".venv"

if [ ! -d "$VENV_DIR" ]; then
  echo "Creating virtual environment in $VENV_DIR"
  python3 -m venv "$VENV_DIR"
fi
source "$VENV_DIR/bin/activate"
pip install -r pip_requirements.txt
ansible-galaxy install -r requirements.yml
ansible-playbook -i inventory/hosts.yml playbooks/local.yml -K
