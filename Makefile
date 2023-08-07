ps-tree:
	docker compose exec cmd-json-format ps axjf
	docker compose exec cmd-shell-format ps axjf
	docker compose exec cmd-json-format-with-sh ps axjf
	docker compose exec cmd-json-format-with-sh-exec ps axjf
