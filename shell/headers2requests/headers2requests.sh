#!/bin/bash

out_1_import='import requests'
targetUrl=""
out_3_headers="headers = dict()\n"
var_url_path=""
var_url_schema=""
var_url_method=""


fileIn=$1
echo "reading file://$fileIn"
while IFS= read -r line
do
#  echo $line
  if [[ $line == GET* ]]
  then
    [[ $line =~ (.*)[[:space:]](.*)[[:space:]](.*) ]]
    var_url_method=${BASH_REMATCH[1]}
    var_url_path=${BASH_REMATCH[2]}
    var_url_schema=${BASH_REMATCH[3]}
    if [[ $var_url_schema == "HTTP/1.1" ]]
    then
      targetUrl+="https://"
    else
      targetUrl+="http://"
    fi
  elif [[ $line == Host:* ]]
  then
    [[ "$line" =~ (.*):[[:space:]](.*) ]]
    targetUrl+=${BASH_REMATCH[2]}
    targetUrl+=${var_url_path}
  else
    [[ "$line" =~ (.*):[[:space:]](.*) ]]
    out_3_headers+="headers['${BASH_REMATCH[1]}'] = '${BASH_REMATCH[2]}'\n"
  fi
done < "$fileIn"

out="${out_1_import}\n\n${out_3_headers}\n\n"
if [[ $var_url_method == "GET" ]]
then
  out_req+="res = requests.get('${targetUrl}', headers=headers)\n\n"
  out_req+="print(res.text)"
else
  echo "TODO: not supported method"
  exit 1
fi
out+=$out_req

fileOut="${fileIn}.py"
echo -e $out > $fileOut
echo "output to file://${fileOut}"
