
Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		
		
		//var $oAuth2 : cs.NetKit.OAuth2Provider
		//var $office365 : cs.NetKit.Office365
		
		//OPEN URL("https://entra.microsoft.com/")
		
		var $settings : 4D:C1709.File
		$settings:=File:C1566("/DATA/Settings/office365.json")
		
		If ($settings.exists)
			
			$params:=JSON Parse:C1218($settings.getText())
			
		Else 
			
			$params:={}
			$params.name:="Microsoft"
			$params.permission:="signedIn"
/*
"signedIn": Azure AD/Google will sign in the user and ensure they gave their consent for the permissions your app requests (opens a web browser).
"service": the app calls Microsoft Graph with its own identity/Google (access without a user).
*/
			$params.scope:="https://graph.microsoft.com/.default"
			$params.clientId:=""
			$params.tenant:=""  // ID de l'annuaire (locataire)
			$params.clientSecret:=""  // Valeur Client secret
			$params.redirectURI:="http://localhost/auth"  // URI de redirection renseignée
			$params.accessType:="offline"
			
		End if 
		
		Form:C1466.params:=$params
		
		
	: (FORM Event:C1606.code=On Page Change:K2:54) && (FORM Get current page:C276=2)
		SET TIMER:C645(-1)
		
	: (FORM Event:C1606.code=On Timer:K2:25) && (FORM Get current page:C276=2)
		SET TIMER:C645(0)
		
		$content:=File:C1566("/RESOURCES/Helps/Office365.html").getText()
		
		
		//WA OPEN URL(*; "Web Area"; "file://"+File("/RESOURCES/Helps/Office365.html").path)
		
		WA SET PAGE CONTENT:C1037(*; "Web Area"; $content; "")
		
		
End case 
