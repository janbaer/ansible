PLAYBOOK=${1:-all.yml}

sudo ansible-playbook -vvv ${PLAYBOOK} $*
