gd3.js: $(shell node_modules/.bin/smash --list src/gd3.js)
				node_modules/.bin/smash src/gd3.js | node_modules/.bin/uglifyjs - -b indent-level=2 -o $@

global: $(shell smash --list src/gd3.js)
				smash src/gd3.js | uglifyjs - -b indent-level=2 -o $@

test:	$(shell node_modules/.bin/smash --list src/gd3.js)
				node_modules/.bin/smash src/gd3.js > gd3.test.js