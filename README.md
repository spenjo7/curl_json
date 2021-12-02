# curl_json

## Synopsis ##
This is a .bat file which makes CURLing .json files easier by referencing a config.ini file for endpoint and filename details.

## Example config.ini ##

```
[Payload Source]
jsonFile=test.json

[Endpoint]
url=http://192.168.0.4:5309/testing
```

## Utilization ##
1. Update the "jsonFile" and "url" values in config.ini
2. Run the curl_json.bat file

## Author ## 
Jon E. Spencer ( 2021 ) 
