#! /bin/sh
SERVICE=/etc/init.d/tomcat8

if $SERVICE status | grep -q "not running"; then
    $SERVICE start
    /opt/scripts/slackpost.sh "https://hooks.slack.com/services/your-hook" "#monitor" "Tomcat Automatic Restart"
fi
if $SERVICE status | grep -q "stopped"; then
    $SERVICE start
    /opt/scripts/slackpost.sh "https://hooks.slack.com/services/your-hook" "#monitor" "Tomcat Automatic Restart"
fi
