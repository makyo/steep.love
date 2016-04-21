Steep.min.js: Steep.js
	node_modules/.bin/uglify -s Steep.js -o Steep.min.js

Steep.js: Steep.elm
	node_modules/.bin/elm-make Steep.elm --output Steep.js

.PHONY: deps
deps:
	npm install
	node_modules/.bin/elm-package install --yes

.PHONY: run
run:
	node_modules/.bin/elm-reactor
