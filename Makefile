ps-tree:
	docker compose exec cmd-json-format ps axjf | grep -v 'ps axjf'
	docker compose exec cmd-shell-format ps axjf | grep -v 'ps axjf'
	docker compose exec cmd-json-format-with-sh ps axjf | grep -v 'ps axjf'
	docker compose exec cmd-json-format-with-sh-exec ps axjf | grep -v 'ps axjf'
