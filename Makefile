ELM_FILES = $(shell ls *.elm)

SteepLove.min.js: SteepLove.js manage-steeps.js
	node_modules/.bin/uglify -s SteepLove.js,manage-steeps.js -o SteepLove.min.js

SteepLove.js: $(ELM_FILES)
	node_modules/.bin/elm-make $(ELM_FILES) --output SteepLove.js

.PHONY: deps
deps:
	npm install
	node_modules/.bin/elm-package install --yes

.PHONY: watch
watch:
	watch -c $(MAKE) SteepLove.min.js

.PHONY: reactor
reactor:
	node_modules/.bin/elm-reactor
