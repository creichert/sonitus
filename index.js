console.log('Loading function');

var util = require('util'),
    exec = require('child_process').exec,
    child;

exports.handler = function(event, context) {
    console.log(util.inspect(event, false, null));

    var payload = JSON.stringify(event.Records[0])
    var sqs = "'" + payload + "'"

    // Ensure you leave a space after the URL
    exec('/var/task/lambda ' + "##SLACK_URL## " + sqs, function (error, stdout, stderr) {
      console.log('stderr: ', stderr);
      console.log('stdout: ' + stdout);
      context.done(null, stdout);
    });
};
