u:
	docker compose up
d:
	docker compose down
build:
	docker compose build
upb:
	docker compose up --build

# Specific commands to backend
ub:
	docker compose up back
bb:
	docker exec -it $$(docker ps --filter name=api -q) bash
m:
	docker exec -it $$(docker ps --filter name=api -q) rake db:migrate
s:
	docker exec -it $$(docker ps --filter name=api -q) rake db:seed
c:
	docker exec -it $$(docker ps --filter name=api -q) rails c
t:
	docker exec -it $$(docker ps --filter name=api -q) rspec
rb:
	docker exec -it $$(docker ps --filter name=api -q) rubocop
rba:
	docker exec -it $$(docker ps --filter name=api -q) rubocop -a
rbaa:
	docker exec -it $$(docker ps --filter name=api -q) rubocop -A

# Specific commands to frontend
uf:
	docker compose up frontend
fb:
	docker exec -it $$(docker ps --filter name=front -q) bash
