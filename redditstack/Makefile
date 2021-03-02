up: down pull build
	docker-compose up -d

down:
	docker-compose down

pull:
	docker-compose pull

build:
	docker-compose build

logs:
	docker-compose logs -f

init: down airflowdir
	docker-compose pull
	docker-compose build
	docker-compose up -d

airflowdir:
	mkdir -p -m 777 airflow/logs
	mkdir -p -m 777 airflow/dags
	mkdir -p -m 777 airflow/plugins
	mkdir -p -m 777 airflow/scripts
	mkdir -p -m 777 airflow/sql

mpush:
	git add --all
	git commit -m 'update'
	git push origin main

mpull:
	git reset --hard
	git pull origin main

stopall:
	docker stop $(docker ps -aq)

removeall:
	docker rm $(docker ps -aq)

removeimages:
	docker rmi $(docker images -q)

scheduler:
	docker exec -it redditstack_airflow-scheduler_1 bash
