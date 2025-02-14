
var $settings : 4D:C1709.File
$settings:=File:C1566("/DATA/Settings/office365.json")


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

$settings.setText(JSON Stringify:C1217($params; *))

ALERT:C41("保存しました")