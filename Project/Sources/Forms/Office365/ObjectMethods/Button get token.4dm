
//var $oAuth2 : cs.NetKit.OAuth2Provider
//var $office365 : cs.NetKit.Office365

//OPEN URL("https://entra.microsoft.com/")

New shared object:C1526



$params:={}
$params.name:="Microsoft"
$params.permission:="signedIn"
/*
"signedIn": Azure AD/Google will sign in the user and ensure they gave their consent for the permissions your app requests (opens a web browser).
"service": the app calls Microsoft Graph with its own identity/Google (access without a user).
*/
$params.scope:="https://graph.microsoft.com/.default"
$params.accessType:="offline"

$params.clientId:=Form:C1466.params.clientId
$params.tenant:=Form:C1466.params.tenant
$params.clientSecret:=Form:C1466.params.clientSecret
//$params.clientSecret:=Form.params.clientSecretValue

$params.redirectURI:=Form:C1466.params.redirectURI

//$oAuth2:=New OAuth2 provider($params)
//If ($oAuth2.token#Null)
//Form.token:=$oAuth2.getToken()
//End if 

C_OBJECT:C1216($signal)
$token:=New signal:C1641("This is my first signal")
CALL WORKER:C1389("GET_TOKEN"; "GET_TOKEN"; $token; $params)

$signaled:=$token.wait(120)  // 最大で120秒待つ
If ($signaled)
	Form:C1466.token:=$token.token
	ALERT:C41("GET_TOKEN finished the work.\r\rtoken:\r"+String:C10($token.token))
Else 
	ALERT:C41("GET_TOKEN has not finished in less than 120sec.")
End if 

//File("/LOGS/"+Replace string(String(Current date); "/"; "-")+" "+Replace string(String(Current time); ":"; "")+"office365.json").setText(JSON Stringify($oAuth2; *))

//ALERT("END")

//$office365:=New Office365 provider($oAuth2; New object("mailType"; "Microsoft"))

