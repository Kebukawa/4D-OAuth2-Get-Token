//%attributes = {}

#DECLARE($token : Object; $params : Object)


//認証ページの設定を加える
$fileOK:=File:C1566("/RESOURCES/Pages/ok.html")
$fileNG:=File:C1566("/RESOURCES/Pages/ng.html")
$params.authenticationPage:=$fileOK
$params.authenticationErrorPage:=$fileNG

//mark: OAuth2インスタンス生成
var $oAuth2 : cs:C1710.NetKit.OAuth2Provider
$oAuth2:=cs:C1710.NetKit.OAuth2Provider.new($params)

//ログとして記録
$file:=File:C1566("/LOGS/"+Replace string:C233(String:C10(Current date:C33); "/"; "-")+" "+Replace string:C233(String:C10(Current time:C178); ":"; "")+" office365_params.json")
$file.setText(JSON Stringify:C1217($oAuth2; *))

//mark: トークンを取得（ブラウザが開く）
var $myCurrentToken : Object
$myCurrentToken:=$oAuth2.getToken()

//ログとして記録
$file:=File:C1566("/LOGS/"+Replace string:C233(String:C10(Current date:C33); "/"; "-")+" "+Replace string:C233(String:C10(Current time:C178); ":"; "")+" office365_token.json")
$file.setText(JSON Stringify:C1217($myCurrentToken; *))

Use ($token)
	$token.token:=String:C10($myCurrentToken.token.access_token)  // 結果を返す
End use 
$token.trigger()  // 処理が完了した

KILL WORKER:C1390
