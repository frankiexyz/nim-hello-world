import httpclient
import json
import strformat

proc ip_to_asn(ip: string): string = 
    var client = newHttpClient(userAgent="curl")
    var output = client.getContent(fmt"http://ipinfo.io/{ip}")
    var json_output = parseJson(output)
    return json_output["org"].getStr()


echo("Please enter IP:")
let name = readLine(stdin)  

echo(ip_to_asn(name))
