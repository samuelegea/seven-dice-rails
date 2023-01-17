up:
	docker compose up
down:
	docker compose down
build:
	docker compose build
up_build:
	docker compose up --build

# Specific commands to backend
up_backend:
	docker compose up back
backend_bash:
	docker exec -it $$(docker ps --filter name=api -q) bash
migrate:
	docker exec -it $$(docker ps --filter name=api -q) rake db:migrate
seed:
	docker exec -it $$(docker ps --filter name=api -q) rake db:seed
reset:
    docker exec -it $$(docker ps --filter name=api -q) rake db:reset
setup:
    docker exec -it $$(docker ps --filter name=api -q) rake db:setup
console:
	docker exec -it $$(docker ps --filter name=api -q) rails c
test:
	docker exec -it $$(docker ps --filter name=api -q) rspec
rubocop:
	docker exec -it $$(docker ps --filter name=api -q) rubocop
rubocop_all:
	docker exec -it $$(docker ps --filter name=api -q) rubocop -a
rubocop_all_unsf:
	docker exec -it $$(docker ps --filter name=api -q) rubocop -A

# Specific commands to frontend
up_frontend:
	docker compose up frontend
frontend_bash:
	docker exec -it $$(docker ps --filter name=front -q) bash

# Aliases

u: up
ub: up_backend
uf: up_frontend
d: down
b: build
ub: up_build
bb: backend_bash
fb: frontend_bash
m: migrate
s: seed
c: console
rst: reset
st: setup
t: test
r: rubocop
ra: rubocop_all
rau: rubocop_all_unsf




