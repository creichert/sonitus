Sonitus
==========

Sontius is a AWS Lambda project to send alert messages to various chat services such as Slack.  This is achieved by using Go to process the SNS message and send a formatted message on another service.  The main application is written in Go as I wanted to learn some more Go and not JavaScript.

## Usage

Run the build command then upload `sonitus.zip` into your Lambda function. From there, subscribe your Alarms to a topic and add a Lambda subscription to that topic.

## Building

To build with the latest release of the prebuilt binary run the following:

`make -e SLACK_URL=http:\/\/www.my-slack-url.com`

> Note: make sure to escape the forward slashes in the URL

If you'd like to build the binary yourself, I'd recommend [gox](https://github.com/mitchellh/gox).

## Development
To replicate Lambda, there is a debug folder with a example Alarm message from SNS.  Build a local binary and put the path to that binary into index.js instead of `/var/task/lambda` (e.g. `./sonitus`).  Simply run `node debug/start.js` and it will send a message.
