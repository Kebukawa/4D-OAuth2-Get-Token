//%attributes = {}

#DECLARE($token : Object; $params : Object)

$oAuth2:=New OAuth2 provider($params)

$file:=File:C1566("/LOGS/"+Replace string:C233(String:C10(Current date:C33); "/"; "-")+" "+Replace string:C233(String:C10(Current time:C178); ":"; "")+"office365.json")
$file.setText(JSON Stringify:C1217($oAuth2; *))

Use ($token)
	$token.token:=$oAuth2.getToken()  // 結果を返す
End use 
$token.trigger()  // 処理が完了した

KILL WORKER:C1390
