#!/bin/ash
token=$(curl -s -X GET http://192.168.8.1/api/webserver/token | grep token  | cut -d '>' -f2 | cut -d '<' -f1)
curl -X POST -d "<request><Control>1</Control></request>" --url http://192.168.8.1/api/device/control -H "__RequestVerificationToken: $token" -H "Content-Ty
pe: text/xml"
