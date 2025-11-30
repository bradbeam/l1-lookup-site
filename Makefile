docs:
	hugo --gc --minify

docs-local: submods
	hugo serve

init-netlify:
	npm install postcss-cli autoprefixer

init: submods
	npm install -D --save postcss postcss-cli autoprefixer

netlify: init-netlify docs
