SLACK_URL ?= ""

PHONY: build
SILENT: build

DEFAULT: build

clean:
	rm -rf sonitus.zip

build: clean
	echo "=> Pulling the latest Go release binary from GitHub"
	$(eval TMP:=$(shell mktemp -d -t sonitus))
	curl -L -o ${TMP}/lambda https://github.com/BBC-News/sonitus/releases/download/0.1.0/lambda
	chmod 777 ${TMP}/lambda
	echo "=> Replacing Slack URL with the one provided"
	sed "s/##SLACK_URL##/${SLACK_URL}/" index.js > ${TMP}/index.js
	pushd ${TMP} && zip sonitus.zip ./* && popd && mv ${TMP}/sonitus.zip ./
