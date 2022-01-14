
check-env:
ifndef ENV
	$(error ENV is required)
endif

make build:
	docker-compose build

pull:
	docker-compose pull

lint:
	docker-compose run --rm control \
		find . -name "*.yml" ! -name "docker-compose*.yml" -exec ansible-lint {} \;


playbook: check-env
	docker-compose run --rm control \
		ansible-playbook -i ${ENV} playbook.yml
