.PHONY: deps install

deps:
	@echo "Installing roles found in requirements.yml from private github"
	ansible-galaxy install -r requirements.yml #-p /etc/ansible/roles
	@echo "Here I would install any python dependencies but I'm not going to"

install:
	@echo "Installing this role into /etc/ansible/roles"
	ansible-galaxy install -p /etc/ansible/roles

test: clean
	vagrant up

apply:
	vagrant provision

clean:
	vagrant destroy