SLACK_URL ?= ""

PHONY: build
SILENT: build

DEFAULT: build

clean:
	rm -rf sonitus.zip

build: clean
	echo "=> Building binary and creating zip"
	$(eval TMP:=$(shell mktemp -d -t sonitus))
	curl -L -o ${TMP}/lambda https://github.com/BBC-News/sonitus/releases/download/0.1.0/lambda
	sed "s/##SLACK_URL##/${SLACK_URL}/" index.js > ${TMP}/index.js
	zip sonitus.zip ${TMP}/*
