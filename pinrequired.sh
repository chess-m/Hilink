#!/bin/ash
modem="http://192.168.8.1"
pin="1410"
ap_token="/api/webserver/token"
ap_pinst="/api/pin/status"
ap_pinop="/api/pin/operate"
rq_pino="<request><OperateType>0</OperateType><CurrentPin>"$pin"</CurrentPin><Ne
pin_s=$(curl -s -X GET $modem$ap_pinst | grep SimState  | cut -d '>' -f2 | cut -


if [ $pin_s == "257" ]; then echo "pin ok!  " $pin_s
fi

if [ $pin_s == "260" ]; then echo "zada pin " $pin_s
echo $rq_pino
token=$(curl -s -X GET $modem$ap_token | grep token  | cut -d '>' -f2 | cut -d '
echo $token
curl -X POST -d $rq_pino --url $modem$ap_pinop -H "__RequestVerificationToken: $
fi
