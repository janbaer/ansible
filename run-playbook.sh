PLAYBOOK=${1:-all.yml}

sudo ansible-playbook ${PLAYBOOK} ${*:2}
